/// ============================================
/// 应用主题定义
/// ============================================
/// 说明：基于 Material Design 3 创建完整的应用主题
/// 包括：浅色主题、深色主题、组件主题配置等
/// ============================================

import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  /// ============================================
  /// 浅色主题（Light Theme）
  /// ============================================
  /// Material Design 3 浅色主题配置
  static ThemeData get lightTheme {
    return ThemeData(
      // 启用 Material Design 3
      useMaterial3: true,
      
      // 颜色方案 - 浅色模式
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        brightness: Brightness.light,
        primary: AppColors.primary,
        onPrimary: Colors.white,
        primaryContainer: AppColors.primaryContainer,
        onPrimaryContainer: AppColors.onPrimaryContainer,
        secondary: AppColors.secondary,
        onSecondary: Colors.white,
        secondaryContainer: AppColors.secondaryContainer,
        onSecondaryContainer: AppColors.onSecondaryContainer,
        tertiary: AppColors.tertiary,
        onTertiary: Colors.white,
        tertiaryContainer: AppColors.tertiaryContainer,
        onTertiaryContainer: AppColors.onTertiaryContainer,
        error: AppColors.error,
        onError: Colors.white,
        errorContainer: AppColors.errorContainer,
        onErrorContainer: AppColors.onErrorContainer,
        surface: AppColors.surface,
        onSurface: AppColors.onSurface,
        surfaceVariant: AppColors.surfaceVariant,
        onSurfaceVariant: AppColors.onSurfaceVariant,
        outline: AppColors.outline,
      ),
      
      // 页面背景色
      scaffoldBackgroundColor: AppColors.background,
      
      // AppBar 主题配置
      appBarTheme: const AppBarTheme(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.onSurface,
        iconTheme: IconThemeData(
          color: AppColors.onSurface,
          size: 24,
        ),
        titleTextStyle: TextStyle(
          color: AppColors.onSurface,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      
      // 卡片主题配置
      cardTheme: CardThemeData(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        color: AppColors.surface,
        surfaceTintColor: Colors.transparent,
      ),
      
      // ElevatedButton 主题配置
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      
      // TextButton 主题配置
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primary,
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      
      // OutlinedButton 主题配置
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          side: const BorderSide(color: AppColors.outline, width: 1),
          foregroundColor: AppColors.primary,
        ),
      ),
      
      // TextField/InputDecorator 主题配置
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surfaceVariant.withOpacity(0.5),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.error, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.error, width: 2),
        ),
        labelStyle: const TextStyle(
          color: AppColors.onSurfaceVariant,
          fontSize: 16,
        ),
        hintStyle: const TextStyle(
          color: AppColors.outlineVariant,
          fontSize: 16,
        ),
      ),
      
      // FloatingActionButton 主题配置
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        elevation: 2,
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      
      // Chip 主题配置
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.surfaceVariant,
        deleteIconColor: AppColors.onSurfaceVariant,
        labelStyle: const TextStyle(color: AppColors.onSurface),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      
      // BottomNavigationBar 主题配置
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        elevation: 8,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.onSurfaceVariant,
        backgroundColor: AppColors.surface,
      ),
      
      // Divider 主题配置
      dividerTheme: const DividerThemeData(
        color: AppColors.outlineVariant,
        thickness: 1,
        space: 1,
      ),
      
      // 文字主题配置
      textTheme: const TextTheme(
        // 超大标题
        displayLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: AppColors.onSurface,
        ),
        // 大标题
        displayMedium: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: AppColors.onSurface,
        ),
        // 中标题
        displaySmall: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: AppColors.onSurface,
        ),
        // 标题
        headlineLarge: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: AppColors.onSurface,
        ),
        // 小标题
        headlineMedium: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColors.onSurface,
        ),
        // 正文标题
        titleLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColors.onSurface,
        ),
        // 正文中标题
        titleMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppColors.onSurface,
        ),
        // 正文小标题
        titleSmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.onSurface,
        ),
        // 正文
        bodyLarge: TextStyle(
          fontSize: 16,
          color: AppColors.onSurface,
        ),
        // 正文中号
        bodyMedium: TextStyle(
          fontSize: 14,
          color: AppColors.onSurface,
        ),
        // 正文小号
        bodySmall: TextStyle(
          fontSize: 12,
          color: AppColors.onSurfaceVariant,
        ),
        // 标签
        labelLarge: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.onSurface,
        ),
        // 提示文字
        labelSmall: TextStyle(
          fontSize: 12,
          color: AppColors.onSurfaceVariant,
        ),
      ),
    );
  }
  
  /// ============================================
  /// 深色主题（Dark Theme）
  /// ============================================
  /// Material Design 3 深色主题配置
  static ThemeData get darkTheme {
    return ThemeData(
      // 启用 Material Design 3
      useMaterial3: true,
      
      // 颜色方案 - 深色模式
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        brightness: Brightness.dark,
        primary: AppColors.primaryLight,
        onPrimary: AppColors.primaryDark,
        primaryContainer: AppColors.primaryDark,
        onPrimaryContainer: AppColors.primaryLight,
        secondary: AppColors.secondary,
        onSecondary: Colors.black,
        secondaryContainer: AppColors.secondaryContainer,
        onSecondaryContainer: AppColors.onSecondaryContainer,
        tertiary: AppColors.tertiary,
        onTertiary: Colors.black,
        tertiaryContainer: AppColors.tertiaryContainer,
        onTertiaryContainer: AppColors.onTertiaryContainer,
        error: AppColors.error,
        onError: Colors.black,
        errorContainer: AppColors.errorContainer,
        onErrorContainer: AppColors.onErrorContainer,
        surface: const Color(0xFF1C1B1F),
        onSurface: Colors.white,
        surfaceVariant: const Color(0xFF49454F),
        onSurfaceVariant: Colors.white,
        outline: const Color(0xFF938F99),
      ),
      
      // 页面背景色
      scaffoldBackgroundColor: const Color(0xFF1C1B1F),
      
      // AppBar 主题配置
      appBarTheme: const AppBarTheme(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Color(0xFF1C1B1F),
        foregroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.white,
          size: 24,
        ),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      
      // 其他配置与浅色主题保持一致...
      // 实际项目中可以复制上面的配置，调整颜色为深色模式
      cardTheme: CardThemeData(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        color: const Color(0xFF1C1B1F),
        surfaceTintColor: Colors.transparent,
      ),
    );
  }
}
