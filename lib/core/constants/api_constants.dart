/// ============================================
/// API 常量定义
/// ============================================
/// 说明：存放所有与后端接口相关的常量配置
/// 包括：基础 URL、API 版本、超时时间、请求头等
/// ============================================

class ApiConstants {
  /// ============================================
  /// 服务器地址配置
  /// ============================================
  
  /// 开发环境服务器地址（本地调试使用）
  static const String baseUrlDev = 'http://localhost:8080/api';
  
  /// 测试环境服务器地址
  static const String baseUrlTest = 'https://test-api.yourmall.com/api';
  
  /// 生产环境服务器地址
  static const String baseUrlProd = 'https://api.yourmall.com/api';
  
  /// 当前使用的环境（dev | test | prod）
  static const String currentEnv = 'dev';
  
  /// 根据环境获取对应的 Base URL
  static String get baseUrl {
    switch (currentEnv) {
      case 'dev':
        return baseUrlDev;
      case 'test':
        return baseUrlTest;
      case 'prod':
        return baseUrlProd;
      default:
        return baseUrlDev;
    }
  }
  
  /// ============================================
  /// API 版本控制
  /// ============================================
  static const String apiVersion = 'v1';
  
  /// ============================================
  /// 超时时间配置（单位：秒）
  /// ============================================
  /// 连接超时：建立连接的最长时间
  static const int connectTimeout = 30;
  
  /// 响应超时：等待响应的最长时间
  static const int receiveTimeout = 30;
  
  /// 发送超时：发送数据的最长时间
  static const int sendTimeout = 30;
  
  /// ============================================
  /// 请求头配置
  /// ============================================
  /// 标准 Content-Type：JSON 格式
  static const String contentTypeJson = 'application/json';
  
  /// 表单 Content-Type
  static const String contentTypeForm = 'application/x-www-form-urlencoded';
  
  /// 文件上传 Content-Type
  static const String contentTypeMultipart = 'multipart/form-data';
  
  /// ============================================
  /// 通用请求参数
  /// ============================================
  /// 默认分页大小
  static const int defaultPageSize = 20;
  
  /// 默认页码
  static const int defaultPageNum = 1;
  
  /// 最大分页大小
  static const int maxPageSize = 100;
}
