import 'package:freezed_annotation/freezed_annotation.dart';

part 'choose_one_validator.freezed.dart';

@freezed
class ChooseOneValidator with _$ChooseOneValidator {
  factory ChooseOneValidator.needToChoose() = _NeedToChoose;
}
