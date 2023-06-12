import 'package:freezed_annotation/freezed_annotation.dart';

part 'email_validator.freezed.dart';

@freezed
class EmailValidator with _$EmailValidator {
  factory EmailValidator.valid() = _Valid;
  factory EmailValidator.invalid() = _Invalid;
  factory EmailValidator.emptyOrNull() = _EmptyOrNull;
}
