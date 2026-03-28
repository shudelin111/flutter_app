/// ============================================
/// 应用常量定义
/// ============================================
/// 说明：存放应用级别的通用常量
/// 包括：应用信息、路由名称、事件类型等
/// ============================================

class AppConstants {
  /// ============================================
  /// 应用基本信息
  /// ============================================
  /// 应用名称
  static const String appName = '综合商城';
  
  /// 应用版本号
  static const String appVersion = '1.0.0';
  
  /// 应用构建号
  static const int appBuildNumber = 1;
  
  /// ============================================
  /// 缓存过期时间配置（单位：秒）
  /// ============================================
  /// Token 缓存时间（7 天）
  static const int tokenCacheDuration = 7 * 24 * 60 * 60;
  
  /// 用户信息缓存时间（1 天）
  static const int userInfoCacheDuration = 24 * 60 * 60;
  
  /// 商品列表缓存时间（30 分钟）
  static const int productListCacheDuration = 30 * 60;
  
  /// 商品详情缓存时间（1 小时）
  static const int productDetailCacheDuration = 60 * 60;
  
  /// 首页数据缓存时间（10 分钟）
  static const int homeDataCacheDuration = 10 * 60;
  
  /// ============================================
  /// 图片尺寸配置（单位：像素）
  /// ============================================
  /// 头像尺寸
  static const int avatarSize = 100;
  
  /// 商品缩略图尺寸
  static const int productThumbnailSize = 200;
  
  /// 商品详情图尺寸
  static const int productDetailImageSize = 800;
  
  /// Banner 图尺寸（宽）
  static const int bannerWidth = 750;
  
  /// ============================================
  /// 分页配置
  /// ============================================
  /// 默认每页加载数量
  static const int defaultPageSize = 20;
  
  /// 首次加载页数
  static const int initialPage = 1;
  
  /// ============================================
  /// 动画时长配置（单位：毫秒）
  /// ============================================
  /// 页面切换动画时长
  static const int pageTransitionDuration = 300;
  
  /// 淡入淡出动画时长
  static const int fadeInOutDuration = 200;
  
  /// 加载动画时长
  static const int loadingDuration = 500;
  
  /// ============================================
  /// 其他常量
  /// ============================================
  /// 最大密码长度
  static const int maxPasswordLength = 18;
  
  /// 最小密码长度
  static const int minPasswordLength = 6;
  
  /// 手机号长度（中国大陆）
  static const int phoneNumberLength = 11;
  
  /// 验证码长度
  static const int verificationCodeLength = 6;
  
  /// 评价最高分数
  static const int maxRatingScore = 5;
}
