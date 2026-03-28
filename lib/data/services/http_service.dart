/// ============================================
/// HTTP 服务封装
/// ============================================
/// 说明：基于 Dio 封装的统一 HTTP 请求服务
/// 包括：全局配置、拦截器、统一错误处理、统一响应处理等
/// 后端接口规范：{success: bool, code: String, message: String, data: Object}
/// ============================================

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../../core/constants/api_constants.dart';
import '../../core/constants/storage_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// API 响应数据模型
/// 对应后端返回的统一格式：{success, code, message, data}
class ApiResponse<T> {
  /// 请求是否成功
  final bool success;
  
  /// 状态码（业务状态码，非 HTTP 状态码）
  final String code;
  
  /// 提示信息
  final String message;
  
  /// 返回数据（泛型）
  final T? data;
  
  ApiResponse({
    required this.success,
    required this.code,
    required this.message,
    this.data,
  });
  
  /// 从 JSON 创建对象
  factory ApiResponse.fromJson(
    Map<String, dynamic> json, {
    T Function(dynamic)? fromJson,
  }) {
    return ApiResponse(
      success: json['success'] ?? false,
      code: json['code'] ?? '',
      message: json['message'] ?? '',
      data: fromJson != null && json['data'] != null
          ? fromJson(json['data'])
          : json['data'] as T?,
    );
  }
}

/// HTTP 服务类（单例模式）
class HttpService {
  /// ============================================
  /// 单例实现
  /// ============================================
  static final HttpService _instance = HttpService._internal();
  factory HttpService() => _instance;
  HttpService._internal();
  
  /// Dio 实例
  late final Dio _dio;
  
  /// 获取 Dio 实例（供外部使用）
  Dio get dio => _dio;
  
  /// Token 回调函数（Token 过期时调用）
  Function()? onTokenExpired;
  
  /// ============================================
  /// 初始化配置
  /// ============================================
  void init() {
    // 基础配置
    BaseOptions options = BaseOptions(
      // 请求基地址
      baseUrl: ApiConstants.baseUrl,
      // 连接超时时间
      connectTimeout: Duration(seconds: ApiConstants.connectTimeout),
      // 响应超时时间
      receiveTimeout: Duration(seconds: ApiConstants.receiveTimeout),
      // 发送超时时间
      sendTimeout: Duration(seconds: ApiConstants.sendTimeout),
      // 请求头
      headers: {
        'Content-Type': ApiConstants.contentTypeJson,
      },
      // 响应数据类型
      responseType: ResponseType.json,
    );
    
    _dio = Dio(options);
    
    // 添加拦截器
    _addInterceptors();
  }
  
  /// ============================================
  /// 添加拦截器
  /// ============================================
  void _addInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(
      /// 请求拦截器 - 在请求发送前执行
      onRequest: (RequestOptions options, RequestInterceptorHandler handler) async {
        debugPrint('🚀 [HTTP Request]');
        debugPrint('  Method: ${options.method}');
        debugPrint('  URL: ${options.uri}');
        debugPrint('  Headers: ${options.headers}');
        debugPrint('  Data: ${options.data}');
        
        // 添加 Token 到请求头
        try {
          final prefs = await SharedPreferences.getInstance();
          String? token = prefs.getString(StorageKeys.userToken);
          
          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
            debugPrint('  ✅ Token added: Bearer ${token.substring(0, 10)}...');
          }
        } catch (e) {
          debugPrint('  ❌ Failed to get token: $e');
        }
        
        return handler.next(options);
      },
      
      /// 响应拦截器 - 在收到响应后执行
      onResponse: (Response response, ResponseInterceptorHandler handler) {
        debugPrint('✅ [HTTP Response]');
        debugPrint('  Status Code: ${response.statusCode}');
        debugPrint('  Data: ${response.data}');
        
        // 检查业务状态码
        if (response.data is Map) {
          final data = response.data as Map;
          
          // 如果后端返回 success=false，可能是 Token 过期或其他错误
          if (data['success'] == false) {
            final code = data['code'] as String?;
            
            // Token 过期或无效（根据实际后端返回调整）
            if (code == '401' || code == 'TOKEN_EXPIRED') {
              debugPrint('⚠️ Token expired, code: $code');
              // 触发 Token 过期回调
              if (onTokenExpired != null) {
                onTokenExpired!();
              }
            }
          }
        }
        
        return handler.next(response);
      },
      
      /// 错误拦截器 - 在发生错误时执行
      onError: (DioException error, ErrorInterceptorHandler handler) {
        debugPrint('❌ [HTTP Error]');
        debugPrint('  Type: ${error.type}');
        debugPrint('  Message: ${error.message}');
        
        // 统一错误处理
        String errorMessage = _handleError(error);
        debugPrint('  💬 Error Message: $errorMessage');
        
        return handler.next(error);
      },
    ));
    
    // 日志拦截器（仅调试模式）
    if (kDebugMode) {
      _dio.interceptors.add(LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true,
        logPrint: (obj) => debugPrint('📝 [Dio Log] $obj'),
      ));
    }
  }
  
  /// ============================================
  /// 错误处理
  /// ============================================
  String _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return '网络连接超时，请检查网络设置';
      case DioExceptionType.sendTimeout:
        return '发送数据超时';
      case DioExceptionType.receiveTimeout:
        return '接收数据超时';
      case DioExceptionType.badResponse:
        // HTTP 状态码错误处理
        switch (error.response?.statusCode) {
          case 400:
            return '请求参数错误';
          case 401:
            return '未授权，请重新登录';
          case 403:
            return '拒绝访问';
          case 404:
            return '请求资源不存在';
          case 500:
            return '服务器内部错误';
          case 502:
            return '网关错误';
          case 503:
            return '服务不可用';
          case 504:
            return '网关超时';
          default:
            return '网络异常，请稍后重试';
        }
      case DioExceptionType.cancel:
        return '请求已取消';
      case DioExceptionType.connectionError:
        return '网络连接失败，请检查网络';
      case DioExceptionType.badCertificate:
        return '证书错误';
      default:
        return '未知错误';
    }
  }
  
  /// ============================================
  /// GET 请求
  /// ============================================
  /// 参数：
  ///   - path: 请求路径
  ///   - queryParameters: URL 查询参数
  ///   - options: 额外配置
  /// 
  /// 返回：ApiResponse 对象
  Future<ApiResponse<T>> get<T>({
    required String path,
    Map<String, dynamic>? queryParameters,
    Options? options,
    T Function(dynamic)? fromJson,
  }) async {
    try {
      Response response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
      );
      
      return ApiResponse<T>.fromJson(
        response.data,
        fromJson: fromJson,
      );
    } catch (e) {
      rethrow;
    }
  }
  
  /// ============================================
  /// POST 请求
  /// ============================================
  Future<ApiResponse<T>> post<T>({
    required String path,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    T Function(dynamic)? fromJson,
  }) async {
    try {
      Response response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      
      return ApiResponse<T>.fromJson(
        response.data,
        fromJson: fromJson,
      );
    } catch (e) {
      rethrow;
    }
  }
  
  /// ============================================
  /// PUT 请求
  /// ============================================
  Future<ApiResponse<T>> put<T>({
    required String path,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    T Function(dynamic)? fromJson,
  }) async {
    try {
      Response response = await _dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      
      return ApiResponse<T>.fromJson(
        response.data,
        fromJson: fromJson,
      );
    } catch (e) {
      rethrow;
    }
  }
  
  /// ============================================
  /// DELETE 请求
  /// ============================================
  Future<ApiResponse<T>> delete<T>({
    required String path,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    T Function(dynamic)? fromJson,
  }) async {
    try {
      Response response = await _dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      
      return ApiResponse<T>.fromJson(
        response.data,
        fromJson: fromJson,
      );
    } catch (e) {
      rethrow;
    }
  }
  
  /// ============================================
  /// 文件上传
  /// ============================================
  Future<ApiResponse<T>> upload<T>({
    required String path,
    required List<String> filePaths,
    Map<String, dynamic>? data,
    T Function(dynamic)? fromJson,
  }) async {
    try {
      // 构建 FormData
      FormData formData = FormData.fromMap(data ?? {});
      
      // 添加文件
      for (int i = 0; i < filePaths.length; i++) {
        String filePath = filePaths[i];
        formData.files.add(
          MapEntry(
            'files', // 字段名，根据后端要求调整
            await MultipartFile.fromFile(
              filePath,
              filename: filePath.split('/').last,
            ),
          ),
        );
      }
      
      Response response = await _dio.post(
        path,
        data: formData,
      );
      
      return ApiResponse<T>.fromJson(
        response.data,
        fromJson: fromJson,
      );
    } catch (e) {
      rethrow;
    }
  }
  
  /// ============================================
  /// 下载文件
  /// ============================================
  Future<void> downloadFile({
    required String url,
    required String savePath,
    Function(int count, int total)? onReceiveProgress,
  }) async {
    try {
      await _dio.download(
        url,
        savePath,
        onReceiveProgress: onReceiveProgress,
      );
    } catch (e) {
      rethrow;
    }
  }
  
  /// ============================================
  /// 取消请求
  /// ============================================
  void cancelRequests(String tag) {
    // TODO: Dio 新版本 API 变更，暂时不实现
    debugPrint('取消请求功能待实现');
  }
  
  /// ============================================
  /// 清除所有请求
  /// ============================================
  void clearRequests() {
    // TODO: Dio 新版本 API 变更，暂时不实现
    debugPrint('清除所有请求功能待实现');
  }
}
