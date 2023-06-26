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
    String? location,
    double? lat,
    double? long,
    String? avatar,
    int? status, //0 == customer,1 == Admin
    String? token,
    String? age,
    List<String>? area,
    List<String>? nameList,
  }) = _AuthUser;

  factory AuthUser.fromJson(Map<String, dynamic> json) =>
      _$AuthUserFromJson(json);
}
