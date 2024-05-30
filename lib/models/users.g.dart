// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Users _$UsersFromJson(Map<String, dynamic> json) => Users(
      id: (json['id'] as num).toInt(),
      email: json['email'] as String? ?? "Bush",
      password: json['password'] as String? ?? "Bush",
      name: json['name'] as String? ?? "Bush",
      role: json['role'] as String? ?? "Bush",
      avatar: json['avatar'] as String? ?? "Bush",
      creationAt: json['creationAt'] as String? ?? "Bush",
      updateAt: json['updateAt'] as String? ?? "Bush",
    );

Map<String, dynamic> _$UsersToJson(Users instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'password': instance.password,
      'name': instance.name,
      'role': instance.role,
      'avatar': instance.avatar,
      'creationAt': instance.creationAt,
      'updateAt': instance.updateAt,
    };
