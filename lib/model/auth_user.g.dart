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
      location: json['location'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      long: (json['long'] as num?)?.toDouble(),
      avatar: json['avatar'] as String?,
      status: json['status'] as int?,
      token: json['token'] as String?,
      age: json['age'] as String?,
      area: (json['area'] as List<dynamic>?)?.map((e) => e as String).toList(),
      nameList: (json['nameList'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_AuthUserToJson(_$_AuthUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'password': instance.password,
      'location': instance.location,
      'lat': instance.lat,
      'long': instance.long,
      'avatar': instance.avatar,
      'status': instance.status,
      'token': instance.token,
      'age': instance.age,
      'area': instance.area,
      'nameList': instance.nameList,
    };
