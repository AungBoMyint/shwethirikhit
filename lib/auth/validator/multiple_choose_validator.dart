import 'package:freezed_annotation/freezed_annotation.dart';

part 'multiple_choose_validator.freezed.dart';

@freezed
class MultipleChooseValidator with _$MultipleChooseValidator {
  factory MultipleChooseValidator.needToChoose() = _NeetToChoose;
  factory MultipleChooseValidator.lessThan() = _LessThan;
}
