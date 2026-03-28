/// ============================================
/// 应用入口文件
/// ============================================
/// 说明：Flutter 应用的启动入口
/// 负责：初始化配置、启动应用、配置主题等
/// ============================================

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

// 导入核心配置
import 'core/theme/app_theme.dart';
import 'core/constants/app_constants.dart';
import 'core/routes/app_routes.dart';

// 导入服务层
import 'data/services/http_service.dart';
import 'data/services/storage_service.dart';

// 导入页面
import 'presentation/pages/splash/splash_page.dart';

/// 依赖注入服务定位器
final GetIt getIt = GetIt.instance;

void main() async {
  /// ============================================
  /// 应用初始化前的准备工作
  /// ============================================
  
  // 确保 Flutter 绑定已初始化
  WidgetsFlutterBinding.ensureInitialized();
  
  /// ============================================
  /// 设置系统状态栏（沉浸式）
  /// ============================================
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // 状态栏透明
      statusBarIconBrightness: Brightness.dark, // 状态栏图标亮度（亮色/暗色）
      systemNavigationBarColor: Colors.white, // 底部导航栏颜色
      systemNavigationBarIconBrightness: Brightness.dark, // 底部导航栏图标亮度
    ),
  );
  
  /// ============================================
  /// 初始化全局服务
  /// ============================================
  
  // 初始化 Hive 存储服务
  await StorageService().init();
  
  // 初始化 HTTP 网络服务
  HttpService().init();
  
  /// ============================================
  /// 注册全局单例服务到 GetIt
  /// ============================================
  getIt.registerLazySingleton<StorageService>(() => StorageService());
  getIt.registerLazySingleton<HttpService>(() => HttpService());
  
  /// ============================================
  /// 启动应用
  /// ============================================
  runApp(const MyApp());
}

/// ============================================
/// 主应用 Widget
/// ============================================
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      /// ============================================
      /// 屏幕适配配置
      /// ============================================
      /// 设计稿尺寸（单位：px）
      /// 常用尺寸：
      ///   - iPhone 6/7/8: 750 x 1334
      ///   - iPhone 6/7/8 Plus: 1080 x 1920
      ///   - iPhone X/XS/11 Pro: 1125 x 2436
      ///   - iPhone XR/XS Max/11: 1242 x 2688
      ///   - 通用设计稿：750 x 1334（推荐）
      designSize: const Size(750, 1334),
      
      /// 最小字体适配
      minTextAdapt: true,
      
      /// 是否根据系统字体缩放
      splitScreenMode: true,
      
      /// ============================================
      /// Material App 配置
      /// ============================================
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            // 不受系统字体缩放影响（保持设计稿效果）
            textScaler: TextScaler.noScaling,
          ),
          child: child!,
        );
      },
      
      child: MaterialApp(
        /// 应用标题
        title: AppConstants.appName,
        
        /// ============================================
        /// 主题配置（Material Design 3）
        /// ============================================
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        // themeMode: ThemeMode.system, // 跟随系统
        themeMode: ThemeMode.light, // 强制使用浅色主题
        
        /// ============================================
        /// 路由配置
        /// ============================================
        // 初始路由（启动页）
        initialRoute: AppRoutes.splash,
        
        // 路由表（所有可跳转的页面）
        routes: {
          // 启动页
          AppRoutes.splash: (context) => const SplashPage(),
          
          // 其他路由...
          // TODO: 后续添加所有页面的路由映射
        },
        
        /// ============================================
        /// 路由生成器（处理未命名路由）
        /// ============================================
        onGenerateRoute: (settings) {
          // TODO: 实现动态路由生成
          return null;
        },
        
        /// ============================================
        /// 错误页面
        /// ============================================
        onUnknownRoute: (settings) {
          // 当找不到路由时显示的页面
          return MaterialPageRoute(
            builder: (context) => Scaffold(
              appBar: AppBar(
                title: const Text('错误'),
              ),
              body: Center(
                child: Text('页面不存在：${settings.name}'),
              ),
            ),
          );
        },
        
        /// ============================================
        /// 调试配置
        /// ============================================
        debugShowCheckedModeBanner: false, // 去除右上角 DEBUG 标签
        showPerformanceOverlay: false, // 不显示性能面板
        checkerboardRasterCacheImages: false,
        checkerboardOffscreenLayers: false,
      ),
    );
  }
}
