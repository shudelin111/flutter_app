/// ============================================
/// 应用主题配置
/// ============================================
/// 说明：基于 Material Design 3 设计规范
/// 定义应用的颜色系统、主题样式等
/// ============================================

import 'package:flutter/material.dart';

class AppColors {
  /// ============================================
  /// 主色调（Primary Colors）
  /// ============================================
  /// 主色 - 品牌色（商城主题色）
  static const Color primary = Color(0xFF6750A4);
  
  /// 主色浅色变体
  static const Color primaryLight = Color(0xFFEADDFF);
  
  /// 主色深色变体
  static const Color primaryDark = Color(0xFF21005D);
  
  /// 主色容器背景
  static const Color primaryContainer = Color(0xFFEADDFF);
  
  /// 主色文字（在容器上）
  static const Color onPrimaryContainer = Color(0xFF21005D);
  
  /// ============================================
  /// 辅助色（Secondary Colors）
  /// ============================================
  /// 辅助色 - 用于次要操作和强调
  static const Color secondary = Color(0xFF625B71);
  
  /// 辅助色容器背景
  static const Color secondaryContainer = Color(0xFFE8DEF8);
  
  /// 辅助色文字
  static const Color onSecondaryContainer = Color(0xFF1D192B);
  
  /// ============================================
  /// 强调色（Tertiary Colors）
  /// ============================================
  /// 强调色 - 用于特殊场景和高亮
  static const Color tertiary = Color(0xFF7D5260);
  
  /// 强调色容器背景
  static const Color tertiaryContainer = Color(0xFFFFD8E4);
  
  /// 强调色文字
  static const Color onTertiaryContainer = Color(0xFF31111D);
  
  /// ============================================
  /// 错误色（Error Colors）
  /// ============================================
  /// 错误色 - 用于错误提示和警告
  static const Color error = Color(0xFFB3261E);
  
  /// 错误色容器背景
  static const Color errorContainer = Color(0xFFF9DEDC);
  
  /// 错误色文字
  static const Color onErrorContainer = Color(0xFF410E0B);
  
  /// ============================================
  /// 背景色（Background Colors）
  /// ============================================
  /// 页面背景色
  static const Color background = Color(0xFFFFFBFE);
  
  /// 表面背景色（卡片、对话框等）
  static const Color surface = Color(0xFFFFFBFE);
  
  /// 表面变体背景色
  static const Color surfaceVariant = Color(0xFFE7E0EC);
  
  /// ============================================
  /// 文字颜色（Text Colors）
  /// ============================================
  /// 主要文字颜色
  static const Color onSurface = Color(0xFF1C1B1F);
  
  /// 次要文字颜色（副标题、描述等）
  static const Color onSurfaceVariant = Color(0xFF49454F);
  
  /// 反色文字（在深色背景上）
  static const Color onBackground = Color(0xFF1C1B1F);
  
  /// ============================================
  /// 轮廓色（Outline Colors）
  /// ============================================
  /// 轮廓线颜色
  static const Color outline = Color(0xFF79747E);
  
  /// 浅色轮廓线
  static const Color outlineVariant = Color(0xFFCAC4D0);
  
  /// ============================================
  /// 功能性颜色
  /// ============================================
  /// 成功色（绿色系）
  static const Color success = Color(0xFF4CAF50);
  
  /// 警告色（橙色系）
  static const Color warning = Color(0xFFFF9800);
  
  /// 信息色（蓝色系）
  static const Color info = Color(0xFF2196F3);
  
  /// ============================================
  /// 渐变色配置
  /// ============================================
  /// 主渐变色（用于 Banner、按钮等）
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [
      Color(0xFF6750A4),
      Color(0xFF9A82DB),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  /// 促销渐变色（用于活动、特价等）
  static const LinearGradient promotionGradient = LinearGradient(
    colors: [
      Color(0xFFFF6B6B),
      Color(0xFFFF8E8E),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
