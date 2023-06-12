import 'package:freezed_annotation/freezed_annotation.dart';

part 'string_validator.freezed.dart';

@freezed
class StringValidator with _$StringValidator {
  factory StringValidator.valid() = _Valid;
  factory StringValidator.emptyOrNull() = _EmptyOrNull;
}
