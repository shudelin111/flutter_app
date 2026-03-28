/// ============================================
/// 启动页/闪屏页
/// ============================================
/// 说明：应用启动时显示的第一个页面
/// 功能：展示 Logo、加载初始化数据、判断是否已登录等
/// ============================================

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/routes/app_routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});
  
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  /// ============================================
  /// 动画控制器
  /// ============================================
  late AnimationController _fadeController;
  late AnimationController _scaleController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  
  @override
  void initState() {
    super.initState();
    
    /// 初始化淡入动画
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    
    /// 初始化缩放动画
    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    
    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeIn,
    );
    
    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: _scaleController,
        curve: Curves.elasticOut,
      ),
    );
    
    /// 启动动画
    _fadeController.forward();
    _scaleController.forward();
    
    /// 延迟跳转到首页（模拟初始化加载）
    _navigateToHome();
  }
  
  /// ============================================
  /// 导航到首页
  /// ============================================
  Future<void> _navigateToHome() async {
    // 延迟 2 秒（可以根据实际需要调整）
    await Future.delayed(const Duration(seconds: 2));
    
    if (!mounted) return;
    
    // TODO: 这里应该检查用户登录状态
    // 如果已登录，跳转到首页
    // 如果未登录，跳转到登录页
    
    // 暂时直接跳转到首页
    Navigator.of(context).pushReplacementNamed(AppRoutes.home);
  }
  
  @override
  void dispose() {
    /// 释放动画控制器
    _fadeController.dispose();
    _scaleController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        /// 背景渐变色
        decoration: const BoxDecoration(
          gradient: AppColors.primaryGradient,
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /// Logo 动画
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: ScaleTransition(
                    scale: _scaleAnimation,
                    child: Container(
                      width: 200.w,
                      height: 200.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 30,
                            spreadRadius: 10,
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.shopping_bag_rounded,
                        size: 100,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ),
                
                SizedBox(height: 60.h),
                
                /// 应用名称
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: Text(
                    '综合商城',
                    style: TextStyle(
                      fontSize: 36.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 4,
                    ),
                  ),
                ),
                
                SizedBox(height: 20.h),
                
                /// Slogan
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: Text(
                    '品质生活 · 精选好物',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.white70,
                      letterSpacing: 2,
                    ),
                  ),
                ),
                
                SizedBox(height: 100.h),
                
                /// 加载指示器
                const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
