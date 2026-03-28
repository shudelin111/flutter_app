/// ============================================
/// 存储键名常量定义
/// ============================================
/// 说明：存放所有本地存储（Hive、SharedPreferences）的键名
/// 统一管理，避免硬编码和键名冲突
/// ============================================

class StorageKeys {
  /// ============================================
  /// 用户相关键名
  /// ============================================
  /// 用户 Token（用于身份验证）
  static const String userToken = 'user_token';
  
  /// 用户 ID
  static const String userId = 'user_id';
  
  /// 用户信息对象
  static const String userInfo = 'user_info';
  
  /// 用户名（手机号）
  static const String username = 'username';
  
  /// 用户头像 URL
  static const String userAvatar = 'user_avatar';
  
  /// 用户昵称
  static const String userNickname = 'user_nickname';
  
  /// ============================================
  /// 设备相关键名
  /// ============================================
  /// 设备唯一标识
  static const String deviceId = 'device_id';
  
  /// 设备令牌（推送用）
  static const String deviceToken = 'device_token';
  
  /// 设备信息
  static const String deviceInfo = 'device_info';
  
  /// ============================================
  /// 应用设置键名
  /// ============================================
  /// 是否首次启动
  static const String isFirstLaunch = 'is_first_launch';
  
  /// 语言设置（zh-CN | en-US）
  static const String languageCode = 'language_code';
  
  /// 是否开启通知
  static const String notificationEnabled = 'notification_enabled';
  
  /// 主题模式（light | dark | system）
  static const String themeMode = 'theme_mode';
  
  /// ============================================
  /// 缓存相关键名
  /// ============================================
  /// 首页数据缓存
  static const String homeDataCache = 'home_data_cache';
  
  /// 商品分类缓存
  static const String categoryCache = 'category_cache';
  
  /// 搜索历史列表
  static const String searchHistory = 'search_history';
  
  /// 浏览历史记录
  static const String browseHistory = 'browse_history';
  
  /// ============================================
  /// Hive Box 名称
  /// ============================================
  /// 用户数据 Box
  static const String userBox = 'user_box';
  
  /// 购物车数据 Box
  static const String cartBox = 'cart_box';
  
  /// 收藏数据 Box
  static const String favoriteBox = 'favorite_box';
  
  /// 缓存数据 Box
  static const String cacheBox = 'cache_box';
  
  /// 订单数据 Box
  static const String orderBox = 'order_box';
}
