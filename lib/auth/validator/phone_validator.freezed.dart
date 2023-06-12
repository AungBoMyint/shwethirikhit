// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'phone_validator.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PhoneValidatorTearOff {
  const _$PhoneValidatorTearOff();

  _Valid invalid() {
    return _Valid();
  }

  _LessThan lessThan() {
    return _LessThan();
  }

  _EmptyOrNull emptyOrNull() {
    return _EmptyOrNull();
  }
}

/// @nodoc
const $PhoneValidator = _$PhoneValidatorTearOff();

/// @nodoc
mixin _$PhoneValidator {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() invalid,
    required TResult Function() lessThan,
    required TResult Function() emptyOrNull,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? invalid,
    TResult Function()? lessThan,
    TResult Function()? emptyOrNull,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? invalid,
    TResult Function()? lessThan,
    TResult Function()? emptyOrNull,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Valid value) invalid,
    required TResult Function(_LessThan value) lessThan,
    required TResult Function(_EmptyOrNull value) emptyOrNull,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Valid value)? invalid,
    TResult Function(_LessThan value)? lessThan,
    TResult Function(_EmptyOrNull value)? emptyOrNull,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Valid value)? invalid,
    TResult Function(_LessThan value)? lessThan,
    TResult Function(_EmptyOrNull value)? emptyOrNull,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhoneValidatorCopyWith<$Res> {
  factory $PhoneValidatorCopyWith(
          PhoneValidator value, $Res Function(PhoneValidator) then) =
      _$PhoneValidatorCopyWithImpl<$Res>;
}

/// @nodoc
class _$PhoneValidatorCopyWithImpl<$Res>
    implements $PhoneValidatorCopyWith<$Res> {
  _$PhoneValidatorCopyWithImpl(this._value, this._then);

  final PhoneValidator _value;
  // ignore: unused_field
  final $Res Function(PhoneValidator) _then;
}

/// @nodoc
abstract class _$ValidCopyWith<$Res> {
  factory _$ValidCopyWith(_Valid value, $Res Function(_Valid) then) =
      __$ValidCopyWithImpl<$Res>;
}

/// @nodoc
class __$ValidCopyWithImpl<$Res> extends _$PhoneValidatorCopyWithImpl<$Res>
    implements _$ValidCopyWith<$Res> {
  __$ValidCopyWithImpl(_Valid _value, $Res Function(_Valid) _then)
      : super(_value, (v) => _then(v as _Valid));

  @override
  _Valid get _value => super._value as _Valid;
}

/// @nodoc

class _$_Valid implements _Valid {
  _$_Valid();

  @override
  String toString() {
    return 'PhoneValidator.invalid()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Valid);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() invalid,
    required TResult Function() lessThan,
    required TResult Function() emptyOrNull,
  }) {
    return invalid();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? invalid,
    TResult Function()? lessThan,
    TResult Function()? emptyOrNull,
  }) {
    return invalid?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? invalid,
    TResult Function()? lessThan,
    TResult Function()? emptyOrNull,
    required TResult orElse(),
  }) {
    if (invalid != null) {
      return invalid();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Valid value) invalid,
    required TResult Function(_LessThan value) lessThan,
    required TResult Function(_EmptyOrNull value) emptyOrNull,
  }) {
    return invalid(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Valid value)? invalid,
    TResult Function(_LessThan value)? lessThan,
    TResult Function(_EmptyOrNull value)? emptyOrNull,
  }) {
    return invalid?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Valid value)? invalid,
    TResult Function(_LessThan value)? lessThan,
    TResult Function(_EmptyOrNull value)? emptyOrNull,
    required TResult orElse(),
  }) {
    if (invalid != null) {
      return invalid(this);
    }
    return orElse();
  }
}

abstract class _Valid implements PhoneValidator {
  factory _Valid() = _$_Valid;
}

/// @nodoc
abstract class _$LessThanCopyWith<$Res> {
  factory _$LessThanCopyWith(_LessThan value, $Res Function(_LessThan) then) =
      __$LessThanCopyWithImpl<$Res>;
}

/// @nodoc
class __$LessThanCopyWithImpl<$Res> extends _$PhoneValidatorCopyWithImpl<$Res>
    implements _$LessThanCopyWith<$Res> {
  __$LessThanCopyWithImpl(_LessThan _value, $Res Function(_LessThan) _then)
      : super(_value, (v) => _then(v as _LessThan));

  @override
  _LessThan get _value => super._value as _LessThan;
}

/// @nodoc

class _$_LessThan implements _LessThan {
  _$_LessThan();

  @override
  String toString() {
    return 'PhoneValidator.lessThan()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _LessThan);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() invalid,
    required TResult Function() lessThan,
    required TResult Function() emptyOrNull,
  }) {
    return lessThan();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? invalid,
    TResult Function()? lessThan,
    TResult Function()? emptyOrNull,
  }) {
    return lessThan?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? invalid,
    TResult Function()? lessThan,
    TResult Function()? emptyOrNull,
    required TResult orElse(),
  }) {
    if (lessThan != null) {
      return lessThan();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Valid value) invalid,
    required TResult Function(_LessThan value) lessThan,
    required TResult Function(_EmptyOrNull value) emptyOrNull,
  }) {
    return lessThan(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Valid value)? invalid,
    TResult Function(_LessThan value)? lessThan,
    TResult Function(_EmptyOrNull value)? emptyOrNull,
  }) {
    return lessThan?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Valid value)? invalid,
    TResult Function(_LessThan value)? lessThan,
    TResult Function(_EmptyOrNull value)? emptyOrNull,
    required TResult orElse(),
  }) {
    if (lessThan != null) {
      return lessThan(this);
    }
    return orElse();
  }
}

abstract class _LessThan implements PhoneValidator {
  factory _LessThan() = _$_LessThan;
}

/// @nodoc
abstract class _$EmptyOrNullCopyWith<$Res> {
  factory _$EmptyOrNullCopyWith(
          _EmptyOrNull value, $Res Function(_EmptyOrNull) then) =
      __$EmptyOrNullCopyWithImpl<$Res>;
}

/// @nodoc
class __$EmptyOrNullCopyWithImpl<$Res>
    extends _$PhoneValidatorCopyWithImpl<$Res>
    implements _$EmptyOrNullCopyWith<$Res> {
  __$EmptyOrNullCopyWithImpl(
      _EmptyOrNull _value, $Res Function(_EmptyOrNull) _then)
      : super(_value, (v) => _then(v as _EmptyOrNull));

  @override
  _EmptyOrNull get _value => super._value as _EmptyOrNull;
}

/// @nodoc

class _$_EmptyOrNull implements _EmptyOrNull {
  _$_EmptyOrNull();

  @override
  String toString() {
    return 'PhoneValidator.emptyOrNull()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _EmptyOrNull);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() invalid,
    required TResult Function() lessThan,
    required TResult Function() emptyOrNull,
  }) {
    return emptyOrNull();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? invalid,
    TResult Function()? lessThan,
    TResult Function()? emptyOrNull,
  }) {
    return emptyOrNull?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? invalid,
    TResult Function()? lessThan,
    TResult Function()? emptyOrNull,
    required TResult orElse(),
  }) {
    if (emptyOrNull != null) {
      return emptyOrNull();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Valid value) invalid,
    required TResult Function(_LessThan value) lessThan,
    required TResult Function(_EmptyOrNull value) emptyOrNull,
  }) {
    return emptyOrNull(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Valid value)? invalid,
    TResult Function(_LessThan value)? lessThan,
    TResult Function(_EmptyOrNull value)? emptyOrNull,
  }) {
    return emptyOrNull?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Valid value)? invalid,
    TResult Function(_LessThan value)? lessThan,
    TResult Function(_EmptyOrNull value)? emptyOrNull,
    required TResult orElse(),
  }) {
    if (emptyOrNull != null) {
      return emptyOrNull(this);
    }
    return orElse();
  }
}

abstract class _EmptyOrNull implements PhoneValidator {
  factory _EmptyOrNull() = _$_EmptyOrNull;
}
