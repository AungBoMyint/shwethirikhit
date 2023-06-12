// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AuthUser _$AuthUserFromJson(Map<String, dynamic> json) {
  return _AuthUser.fromJson(json);
}

/// @nodoc
class _$AuthUserTearOff {
  const _$AuthUserTearOff();

  _AuthUser call(
      {required String id,
      required String name,
      String? email,
      String? phone,
      String? password,
      String? age,
      List<String>? areas,
      String? avatar,
      int? status,
      String? token,
      required bool isActive}) {
    return _AuthUser(
      id: id,
      name: name,
      email: email,
      phone: phone,
      password: password,
      age: age,
      areas: areas,
      avatar: avatar,
      status: status,
      token: token,
      isActive: isActive,
    );
  }

  AuthUser fromJson(Map<String, Object?> json) {
    return AuthUser.fromJson(json);
  }
}

/// @nodoc
const $AuthUser = _$AuthUserTearOff();

/// @nodoc
mixin _$AuthUser {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  String? get age => throw _privateConstructorUsedError;
  List<String>? get areas => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;
  int? get status =>
      throw _privateConstructorUsedError; //0 == customer,1 == Admin
  String? get token => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthUserCopyWith<AuthUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthUserCopyWith<$Res> {
  factory $AuthUserCopyWith(AuthUser value, $Res Function(AuthUser) then) =
      _$AuthUserCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String name,
      String? email,
      String? phone,
      String? password,
      String? age,
      List<String>? areas,
      String? avatar,
      int? status,
      String? token,
      bool isActive});
}

/// @nodoc
class _$AuthUserCopyWithImpl<$Res> implements $AuthUserCopyWith<$Res> {
  _$AuthUserCopyWithImpl(this._value, this._then);

  final AuthUser _value;
  // ignore: unused_field
  final $Res Function(AuthUser) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? password = freezed,
    Object? age = freezed,
    Object? areas = freezed,
    Object? avatar = freezed,
    Object? status = freezed,
    Object? token = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      age: age == freezed
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as String?,
      areas: areas == freezed
          ? _value.areas
          : areas // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      avatar: avatar == freezed
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: isActive == freezed
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$AuthUserCopyWith<$Res> implements $AuthUserCopyWith<$Res> {
  factory _$AuthUserCopyWith(_AuthUser value, $Res Function(_AuthUser) then) =
      __$AuthUserCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String name,
      String? email,
      String? phone,
      String? password,
      String? age,
      List<String>? areas,
      String? avatar,
      int? status,
      String? token,
      bool isActive});
}

/// @nodoc
class __$AuthUserCopyWithImpl<$Res> extends _$AuthUserCopyWithImpl<$Res>
    implements _$AuthUserCopyWith<$Res> {
  __$AuthUserCopyWithImpl(_AuthUser _value, $Res Function(_AuthUser) _then)
      : super(_value, (v) => _then(v as _AuthUser));

  @override
  _AuthUser get _value => super._value as _AuthUser;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? password = freezed,
    Object? age = freezed,
    Object? areas = freezed,
    Object? avatar = freezed,
    Object? status = freezed,
    Object? token = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_AuthUser(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      age: age == freezed
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as String?,
      areas: areas == freezed
          ? _value.areas
          : areas // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      avatar: avatar == freezed
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: isActive == freezed
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AuthUser implements _AuthUser {
  _$_AuthUser(
      {required this.id,
      required this.name,
      this.email,
      this.phone,
      this.password,
      this.age,
      this.areas,
      this.avatar,
      this.status,
      this.token,
      required this.isActive});

  factory _$_AuthUser.fromJson(Map<String, dynamic> json) =>
      _$$_AuthUserFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String? email;
  @override
  final String? phone;
  @override
  final String? password;
  @override
  final String? age;
  @override
  final List<String>? areas;
  @override
  final String? avatar;
  @override
  final int? status;
  @override //0 == customer,1 == Admin
  final String? token;
  @override
  final bool isActive;

  @override
  String toString() {
    return 'AuthUser(id: $id, name: $name, email: $email, phone: $phone, password: $password, age: $age, areas: $areas, avatar: $avatar, status: $status, token: $token, isActive: $isActive)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AuthUser &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.phone, phone) &&
            const DeepCollectionEquality().equals(other.password, password) &&
            const DeepCollectionEquality().equals(other.age, age) &&
            const DeepCollectionEquality().equals(other.areas, areas) &&
            const DeepCollectionEquality().equals(other.avatar, avatar) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.token, token) &&
            const DeepCollectionEquality().equals(other.isActive, isActive));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(phone),
      const DeepCollectionEquality().hash(password),
      const DeepCollectionEquality().hash(age),
      const DeepCollectionEquality().hash(areas),
      const DeepCollectionEquality().hash(avatar),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(token),
      const DeepCollectionEquality().hash(isActive));

  @JsonKey(ignore: true)
  @override
  _$AuthUserCopyWith<_AuthUser> get copyWith =>
      __$AuthUserCopyWithImpl<_AuthUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AuthUserToJson(this);
  }
}

abstract class _AuthUser implements AuthUser {
  factory _AuthUser(
      {required String id,
      required String name,
      String? email,
      String? phone,
      String? password,
      String? age,
      List<String>? areas,
      String? avatar,
      int? status,
      String? token,
      required bool isActive}) = _$_AuthUser;

  factory _AuthUser.fromJson(Map<String, dynamic> json) = _$_AuthUser.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String? get email;
  @override
  String? get phone;
  @override
  String? get password;
  @override
  String? get age;
  @override
  List<String>? get areas;
  @override
  String? get avatar;
  @override
  int? get status;
  @override //0 == customer,1 == Admin
  String? get token;
  @override
  bool get isActive;
  @override
  @JsonKey(ignore: true)
  _$AuthUserCopyWith<_AuthUser> get copyWith =>
      throw _privateConstructorUsedError;
}
