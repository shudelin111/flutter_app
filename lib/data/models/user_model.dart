/// ============================================
/// 用户信息模型
/// ============================================
/// 说明：描述用户数据的完整结构
/// 用于：登录、注册、个人中心等场景
/// 支持 JSON 序列化和 Hive 持久化
/// ============================================

import 'package:json_annotation/json_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'user_model.g.dart';

/// 用户信息数据模型
@JsonSerializable()
@HiveType(typeId: 0)
class UserModel {
  /// 用户唯一标识（主键）
  @JsonKey(name: 'userId')
  @HiveField(0)
  final String userId;
  
  /// 用户名（通常是手机号）
  @JsonKey(name: 'username')
  @HiveField(1)
  final String username;
  
  /// 用户昵称
  @JsonKey(name: 'nickname')
  @HiveField(2)
  final String nickname;
  
  /// 用户头像 URL
  @JsonKey(name: 'avatar')
  @HiveField(3)
  final String? avatar;
  
  /// 性别（0:未知，1:男，2:女）
  @JsonKey(name: 'gender')
  @HiveField(4)
  final int? gender;
  
  /// 生日
  @JsonKey(name: 'birthday')
  @HiveField(5)
  final String? birthday;
  
  /// 手机号码
  @JsonKey(name: 'phone')
  @HiveField(6)
  final String? phone;
  
  /// 邮箱地址
  @JsonKey(name: 'email')
  @HiveField(7)
  final String? email;
  
  /// 用户等级（普通用户、VIP 等）
  @JsonKey(name: 'level')
  @HiveField(8)
  final int? level;
  
  /// 用户积分
  @JsonKey(name: 'points')
  @HiveField(9)
  final int? points;
  
  /// 账户余额
  @JsonKey(name: 'balance')
  @HiveField(10)
  final double? balance;
  
  /// 注册时间
  @JsonKey(name: 'createTime')
  @HiveField(11)
  final String? createTime;
  
  /// 最后登录时间
  @JsonKey(name: 'lastLoginTime')
  @HiveField(12)
  final String? lastLoginTime;
  
  /// 用户状态（0:禁用，1:正常，2:冻结）
  @JsonKey(name: 'status')
  @HiveField(13)
  final int? status;
  
  /// 默认收货地址 ID
  @JsonKey(name: 'defaultAddressId')
  @HiveField(14)
  final String? defaultAddressId;
  
  /// 扩展字段（存储其他自定义数据）
  @JsonKey(name: 'extData')
  @HiveField(15)
  final Map<String, dynamic>? extData;
  
  /// 构造函数
  UserModel({
    required this.userId,
    required this.username,
    required this.nickname,
    this.avatar,
    this.gender,
    this.birthday,
    this.phone,
    this.email,
    this.level,
    this.points,
    this.balance,
    this.createTime,
    this.lastLoginTime,
    this.status,
    this.defaultAddressId,
    this.extData,
  });
  
  /// 从 JSON 创建对象
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  
  /// 转换为 JSON
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
  
  /// 获取头像（如果有则返回头像，否则返回默认头像）
  String getAvatarUrl() {
    if (avatar != null && avatar!.isNotEmpty) {
      return avatar!;
    }
    // TODO: 返回默认头像 URL
    return '';
  }
  
  /// 获取性别文本
  String getGenderText() {
    switch (gender) {
      case 1:
        return '男';
      case 2:
        return '女';
      default:
        return '未知';
    }
  }
  
  /// 检查用户是否已登录
  bool get isLoggedIn => userId.isNotEmpty;
  
  /// 复制当前对象并修改部分属性
  UserModel copyWith({
    String? userId,
    String? username,
    String? nickname,
    String? avatar,
    int? gender,
    String? birthday,
    String? phone,
    String? email,
    int? level,
    int? points,
    double? balance,
    String? createTime,
    String? lastLoginTime,
    int? status,
    String? defaultAddressId,
    Map<String, dynamic>? extData,
  }) {
    return UserModel(
      userId: userId ?? this.userId,
      username: username ?? this.username,
      nickname: nickname ?? this.nickname,
      avatar: avatar ?? this.avatar,
      gender: gender ?? this.gender,
      birthday: birthday ?? this.birthday,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      level: level ?? this.level,
      points: points ?? this.points,
      balance: balance ?? this.balance,
      createTime: createTime ?? this.createTime,
      lastLoginTime: lastLoginTime ?? this.lastLoginTime,
      status: status ?? this.status,
      defaultAddressId: defaultAddressId ?? this.defaultAddressId,
      extData: extData ?? this.extData,
    );
  }
  
  @override
  String toString() {
    return 'UserModel(userId: $userId, username: $username, nickname: $nickname)';
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UserModel && other.userId == userId;
  }
  
  @override
  int get hashCode => userId.hashCode;
}
