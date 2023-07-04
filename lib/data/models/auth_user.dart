import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_user.freezed.dart';
part 'auth_user.g.dart';

@freezed
class AuthUser with _$AuthUser {
  factory AuthUser({
    required String id,
    required String name,
    String? email,
    String? phone,
    String? password,
    String? age,
    List<String>? areas,
    String? avatar,
    int? status, //0 == customer,1 == Admin
    String? token,
    required bool isActive,
  }) = _AuthUser;

  factory AuthUser.fromJson(Map<String, dynamic> json) =>
      _$AuthUserFromJson(json);
}
