import 'package:freezed_annotation/freezed_annotation.dart';

part 'phone_validator.freezed.dart';

@freezed
class PhoneValidator with _$PhoneValidator {
  factory PhoneValidator.invalid() = _Valid;
  factory PhoneValidator.lessThan() = _LessThan;
  factory PhoneValidator.emptyOrNull() = _EmptyOrNull;
}
