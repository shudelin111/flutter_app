/// ============================================
/// Hive 存储服务封装
/// ============================================
/// 说明：基于 Hive 的本地数据持久化服务
/// 包括：初始化、Box 管理、CRUD 操作等
/// Hive 优势：高性能、支持自定义对象、异步操作
/// ============================================

import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/foundation.dart';
import '../../core/constants/storage_keys.dart';

/// Hive 存储服务类（单例模式）
class StorageService {
  /// ============================================
  /// 单例实现
  /// ============================================
  static final StorageService _instance = StorageService._internal();
  factory StorageService() => _instance;
  StorageService._internal();
  
  /// ============================================
  /// 初始化 Hive
  /// ============================================
  /// 必须在应用启动时调用
  Future<void> init() async {
    debugPrint('📦 [Hive] 开始初始化...');
    
    try {
      // 初始化 Hive Flutter
      await Hive.initFlutter();
      
      // TODO: 注册自定义模型适配器（Adapter）
      // 示例：Hive.registerAdapter(UserAdapter());
      // Hive.registerAdapter(ProductAdapter());
      // Hive.registerAdapter(CartItemAdapter());
      
      // 打开常用的 Box
      await _openBoxes();
      
      debugPrint('✅ [Hive] 初始化完成');
    } catch (e) {
      debugPrint('❌ [Hive] 初始化失败：$e');
      rethrow;
    }
  }
  
  /// ============================================
  /// 打开所有 Box
  /// ============================================
  Future<void> _openBoxes() async {
    try {
      // 用户数据 Box
      if (!Hive.isBoxOpen(StorageKeys.userBox)) {
        await Hive.openBox(StorageKeys.userBox);
        debugPrint('  ✅ 打开 Box: ${StorageKeys.userBox}');
      }
      
      // 购物车数据 Box
      if (!Hive.isBoxOpen(StorageKeys.cartBox)) {
        await Hive.openBox(StorageKeys.cartBox);
        debugPrint('  ✅ 打开 Box: ${StorageKeys.cartBox}');
      }
      
      // 收藏数据 Box
      if (!Hive.isBoxOpen(StorageKeys.favoriteBox)) {
        await Hive.openBox(StorageKeys.favoriteBox);
        debugPrint('  ✅ 打开 Box: ${StorageKeys.favoriteBox}');
      }
      
      // 缓存数据 Box
      if (!Hive.isBoxOpen(StorageKeys.cacheBox)) {
        await Hive.openBox(StorageKeys.cacheBox);
        debugPrint('  ✅ 打开 Box: ${StorageKeys.cacheBox}');
      }
      
      // 订单数据 Box
      if (!Hive.isBoxOpen(StorageKeys.orderBox)) {
        await Hive.openBox(StorageKeys.orderBox);
        debugPrint('  ✅ 打开 Box: ${StorageKeys.orderBox}');
      }
    } catch (e) {
      debugPrint('❌ 打开 Box 失败：$e');
      rethrow;
    }
  }
  
  /// ============================================
  /// 通用数据操作方法
  /// ============================================
  
  /// 获取指定的 Box
  Box<T> _getBox<T>(String boxName) {
    if (!Hive.isBoxOpen(boxName)) {
      throw Exception('Box "$boxName" 未打开，请先打开该 Box');
    }
    return Hive.box<T>(boxName);
  }
  
  /// ============================================
  /// 保存数据
  /// ============================================
  /// 参数：
  ///   - key: 键名
  ///   - value: 值
  ///   - boxName: Box 名称（可选，默认使用 cacheBox）
  Future<void> save({
    required String key,
    required dynamic value,
    String boxName = StorageKeys.cacheBox,
  }) async {
    try {
      final box = _getBox(boxName);
      await box.put(key, value);
      debugPrint('💾 [Hive Save] $key = $value');
    } catch (e) {
      debugPrint('❌ [Hive Save Error] $e');
      rethrow;
    }
  }
  
  /// ============================================
  /// 读取数据
  /// ============================================
  /// 参数：
  ///   - key: 键名
  ///   - defaultValue: 默认值（找不到时返回）
  ///   - boxName: Box 名称
  T? get<T>({
    required String key,
    T? defaultValue,
    String boxName = StorageKeys.cacheBox,
  }) {
    try {
      final box = _getBox<T>(boxName);
      return box.get(key, defaultValue: defaultValue);
    } catch (e) {
      debugPrint('❌ [Hive Get Error] $e');
      return defaultValue;
    }
  }
  
  /// ============================================
  /// 删除数据
  /// ============================================
  Future<void> delete({
    required String key,
    String boxName = StorageKeys.cacheBox,
  }) async {
    try {
      final box = _getBox(boxName);
      await box.delete(key);
      debugPrint('🗑️ [Hive Delete] $key');
    } catch (e) {
      debugPrint('❌ [Hive Delete Error] $e');
      rethrow;
    }
  }
  
  /// ============================================
  /// 清空 Box
  /// ============================================
  Future<void> clearBox(String boxName) async {
    try {
      final box = _getBox(boxName);
      await box.clear();
      debugPrint('🧹 [Hive Clear] $boxName');
    } catch (e) {
      debugPrint('❌ [Hive Clear Error] $e');
      rethrow;
    }
  }
  
  /// ============================================
  /// 关闭 Box
  /// ============================================
  Future<void> closeBox(String boxName) async {
    try {
      final box = _getBox(boxName);
      await box.close();
      debugPrint('🔒 [Hive Close] $boxName');
    } catch (e) {
      debugPrint('❌ [Hive Close Error] $e');
      rethrow;
    }
  }
  
  /// ============================================
  /// 检查键是否存在
  /// ============================================
  bool containsKey({
    required String key,
    String boxName = StorageKeys.cacheBox,
  }) {
    try {
      final box = _getBox(boxName);
      return box.containsKey(key);
    } catch (e) {
      debugPrint('❌ [Hive ContainsKey Error] $e');
      return false;
    }
  }
  
  /// ============================================
  /// 获取 Box 中所有键
  /// ============================================
  Iterable<dynamic> keys(String boxName) {
    try {
      final box = _getBox(boxName);
      return box.keys;
    } catch (e) {
      debugPrint('❌ [Hive Keys Error] $e');
      return [];
    }
  }
  
  /// ============================================
  /// 获取 Box 长度
  /// ============================================
  int length(String boxName) {
    try {
      final box = _getBox(boxName);
      return box.length;
    } catch (e) {
      debugPrint('❌ [Hive Length Error] $e');
      return 0;
    }
  }
  
  /// ============================================
  /// 批量保存
  /// ============================================
  Future<void> saveAll({
    required Map<String, dynamic> data,
    String boxName = StorageKeys.cacheBox,
  }) async {
    try {
      final box = _getBox(boxName);
      await box.putAll(data);
      debugPrint('💾 [Hive SaveAll] $data');
    } catch (e) {
      debugPrint('❌ [Hive SaveAll Error] $e');
      rethrow;
    }
  }
  
  /// ============================================
  /// 获取所有数据
  /// ============================================
  Map<dynamic, dynamic> getAllValues(String boxName) {
    try {
      final box = _getBox(boxName);
      return box.toMap();
    } catch (e) {
      debugPrint('❌ [Hive GetAll Error] $e');
      return {};
    }
  }
}
