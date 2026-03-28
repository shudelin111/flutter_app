/// ============================================
/// 基础响应模型
/// ============================================
/// 说明：所有 API 响应的基础结构
/// 对应后端返回的统一格式：{success, code, message, data}
/// 使用 json_serializable 自动生成序列化代码
/// ============================================

import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

/// 基础响应模型类
@JsonSerializable(genericArgumentFactories: true)
class BaseResponse<T> {
  /// 请求是否成功（业务层面）
  final bool success;
  
  /// 状态码（业务状态码，非 HTTP 状态码）
  /// 例如："200" 成功，"401" 未授权，"500" 服务器错误
  @JsonKey(name: 'code')
  final String code;
  
  /// 提示信息
  /// 用于展示给用户的错误信息或成功提示
  @JsonKey(name: 'message')
  final String message;
  
  /// 返回数据（泛型）
  /// 可以是任意类型，由具体的 API 接口决定
  @JsonKey(name: 'data')
  final T? data;
  
  /// 构造函数
  BaseResponse({
    required this.success,
    required this.code,
    required this.message,
    this.data,
  });
  
  /// 从 JSON 创建对象
  /// 
  /// 参数：
  ///   - json: JSON 数据
  ///   - fromJsonT: 泛型 T 的反序列化函数（由代码生成器生成）
  factory BaseResponse.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic json)? fromJsonT,
  ) =>
      _$BaseResponseFromJson(json, fromJsonT);
  
  /// 转换为 JSON
  Map<String, dynamic> toJson(Object? Function(T value)? toJsonT) =>
      _$BaseResponseToJson(this, toJsonT);
  
  /// 检查响应是否成功
  /// 
  /// 返回：
  ///   - true: 请求成功且业务处理成功
  ///   - false: 请求失败或业务处理失败
  bool get isSuccess => success && code == '200';
  
  /// 检查是否是错误响应
  bool get isError => !success || code != '200';
  
  /// 获取错误信息
  String get errorMessage => message;
  
  /// 复制当前对象并修改部分属性
  BaseResponse<T> copyWith({
    bool? success,
    String? code,
    String? message,
    T? data,
  }) {
    return BaseResponse(
      success: success ?? this.success,
      code: code ?? this.code,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }
  
  @override
  String toString() {
    return 'BaseResponse(success: $success, code: $code, message: $message, data: $data)';
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is BaseResponse &&
        other.success == success &&
        other.code == code &&
        other.message == message &&
        other.data == data;
  }
  
  @override
  int get hashCode {
    return Object.hash(success, code, message, data);
  }
}
