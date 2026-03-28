/// ============================================
/// 应用路由配置
/// ============================================
/// 说明：统一管理所有页面路由
/// 包括：路由名称定义、路由表、路由生成器等
/// ============================================

class AppRoutes {
  /// ============================================
  /// 路由名称常量（用于导航跳转）
  /// ============================================
  
  /// 启动页/闪屏页
  static const String splash = '/splash';
  
  /// 登录页
  static const String login = '/login';
  
  /// 注册页
  static const String register = '/register';
  
  /// 忘记密码页
  static const String forgotPassword = '/forgot-password';
  
  /// 验证码登录页
  static const String smsLogin = '/sms-login';
  
  /// 首页（主页面）
  static const String home = '/home';
  
  /// 商品分类页
  static const String category = '/category';
  
  /// 商品列表页
  static const String productList = '/product-list';
  
  /// 商品详情页
  static const String productDetail = '/product-detail';
  
  /// 商品搜索页
  static const String search = '/search';
  
  /// 购物车页
  static const String cart = '/cart';
  
  /// 订单确认页（提交订单）
  static const String orderConfirm = '/order-confirm';
  
  /// 订单列表页
  static const String orderList = '/order-list';
  
  /// 订单详情页
  static const String orderDetail = '/order-detail';
  
  /// 支付页
  static const String payment = '/payment';
  
  /// 用户中心页
  static const String userCenter = '/user-center';
  
  /// 个人信息页
  static const String profile = '/profile';
  
  /// 地址管理页
  static const String addressList = '/address-list';
  
  /// 添加/编辑地址页
  static const String addressEdit = '/address-edit';
  
  /// 收藏夹页
  static const String favorite = '/favorite';
  
  /// 浏览历史页
  static const String history = '/history';
  
  /// 优惠券页
  static const String coupon = '/coupon';
  
  /// 客服中心页
  static const String customerService = '/customer-service';
  
  /// 设置页
  static const String settings = '/settings';
  
  /// 关于我们页
  static const String about = '/about';
  
  /// Web 视图页（加载 H5 页面）
  static const String webView = '/web-view';
  
  /// ============================================
  /// 完整路由表（路径 -> 页面）
  /// ============================================
  static Map<String, String> get routeTable {
    return {
      splash: 'SplashPage',
      login: 'LoginPage',
      register: 'RegisterPage',
      forgotPassword: 'ForgotPasswordPage',
      smsLogin: 'SmsLoginPage',
      home: 'HomePage',
      category: 'CategoryPage',
      productList: 'ProductListPage',
      productDetail: 'ProductDetailPage',
      search: 'SearchPage',
      cart: 'CartPage',
      orderConfirm: 'OrderConfirmPage',
      orderList: 'OrderListPage',
      orderDetail: 'OrderDetailPage',
      payment: 'PaymentPage',
      userCenter: 'UserCenterPage',
      profile: 'ProfilePage',
      addressList: 'AddressListPage',
      addressEdit: 'AddressEditPage',
      favorite: 'FavoritePage',
      history: 'HistoryPage',
      coupon: 'CouponPage',
      customerService: 'CustomerServicePage',
      settings: 'SettingsPage',
      about: 'AboutPage',
      webView: 'WebViewPage',
    };
  }
}
