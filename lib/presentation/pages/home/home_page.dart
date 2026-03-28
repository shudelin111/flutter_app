/// ============================================
/// 首页（主页面）
/// ============================================
/// 说明：应用的主页面，包含底部导航栏
/// 功能：展示各个模块的入口（首页、分类、购物车、我的）
/// ============================================

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/theme/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// 当前选中的索引
  int _currentIndex = 0;
  
  /// 页面控制器（用于页面切换动画）
  final PageController _pageController = PageController();
  
  /// 页面列表
  final List<Widget> _pages = [
    // TODO: 首页内容
    Center(child: Text('首页', style: TextStyle(fontSize: 24.sp))),
    // TODO: 分类页
    Center(child: Text('分类', style: TextStyle(fontSize: 24.sp))),
    // TODO: 购物车页
    Center(child: Text('购物车', style: TextStyle(fontSize: 24.sp))),
    // TODO: 个人中心页
    Center(child: Text('我的', style: TextStyle(fontSize: 24.sp))),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          children: _pages,
        ),
      ),
      
      /// ============================================
      /// 底部导航栏
      /// ============================================
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _pageController.jumpToPage(index);
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        elevation: 8,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 12.sp,
        unselectedFontSize: 12.sp,
        iconSize: 24.r,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: '首页',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined),
            activeIcon: Icon(Icons.category),
            label: '分类',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            activeIcon: Icon(Icons.shopping_cart),
            label: '购物车',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: '我的',
          ),
        ],
      ),
    );
  }
  
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
