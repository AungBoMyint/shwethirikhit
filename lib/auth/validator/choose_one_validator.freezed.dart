// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'choose_one_validator.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ChooseOneValidatorTearOff {
  const _$ChooseOneValidatorTearOff();

  _NeedToChoose needToChoose() {
    return _NeedToChoose();
  }
}

/// @nodoc
const $ChooseOneValidator = _$ChooseOneValidatorTearOff();

/// @nodoc
mixin _$ChooseOneValidator {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() needToChoose,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? needToChoose,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? needToChoose,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NeedToChoose value) needToChoose,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_NeedToChoose value)? needToChoose,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NeedToChoose value)? needToChoose,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChooseOneValidatorCopyWith<$Res> {
  factory $ChooseOneValidatorCopyWith(
          ChooseOneValidator value, $Res Function(ChooseOneValidator) then) =
      _$ChooseOneValidatorCopyWithImpl<$Res>;
}

/// @nodoc
class _$ChooseOneValidatorCopyWithImpl<$Res>
    implements $ChooseOneValidatorCopyWith<$Res> {
  _$ChooseOneValidatorCopyWithImpl(this._value, this._then);

  final ChooseOneValidator _value;
  // ignore: unused_field
  final $Res Function(ChooseOneValidator) _then;
}

/// @nodoc
abstract class _$NeedToChooseCopyWith<$Res> {
  factory _$NeedToChooseCopyWith(
          _NeedToChoose value, $Res Function(_NeedToChoose) then) =
      __$NeedToChooseCopyWithImpl<$Res>;
}

/// @nodoc
class __$NeedToChooseCopyWithImpl<$Res>
    extends _$ChooseOneValidatorCopyWithImpl<$Res>
    implements _$NeedToChooseCopyWith<$Res> {
  __$NeedToChooseCopyWithImpl(
      _NeedToChoose _value, $Res Function(_NeedToChoose) _then)
      : super(_value, (v) => _then(v as _NeedToChoose));

  @override
  _NeedToChoose get _value => super._value as _NeedToChoose;
}

/// @nodoc

class _$_NeedToChoose implements _NeedToChoose {
  _$_NeedToChoose();

  @override
  String toString() {
    return 'ChooseOneValidator.needToChoose()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _NeedToChoose);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() needToChoose,
  }) {
    return needToChoose();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? needToChoose,
  }) {
    return needToChoose?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? needToChoose,
    required TResult orElse(),
  }) {
    if (needToChoose != null) {
      return needToChoose();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NeedToChoose value) needToChoose,
  }) {
    return needToChoose(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_NeedToChoose value)? needToChoose,
  }) {
    return needToChoose?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NeedToChoose value)? needToChoose,
    required TResult orElse(),
  }) {
    if (needToChoose != null) {
      return needToChoose(this);
    }
    return orElse();
  }
}

abstract class _NeedToChoose implements ChooseOneValidator {
  factory _NeedToChoose() = _$_NeedToChoose;
}
