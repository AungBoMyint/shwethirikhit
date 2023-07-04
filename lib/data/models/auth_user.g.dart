// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AuthUser _$$_AuthUserFromJson(Map<String, dynamic> json) => _$_AuthUser(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      password: json['password'] as String?,
      age: json['age'] as String?,
      areas:
          (json['areas'] as List<dynamic>?)?.map((e) => e as String).toList(),
      avatar: json['avatar'] as String?,
      status: json['status'] as int?,
      token: json['token'] as String?,
      isActive: json['isActive'] as bool,
    );

Map<String, dynamic> _$$_AuthUserToJson(_$_AuthUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'password': instance.password,
      'age': instance.age,
      'areas': instance.areas,
      'avatar': instance.avatar,
      'status': instance.status,
      'token': instance.token,
      'isActive': instance.isActive,
    };
