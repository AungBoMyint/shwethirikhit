// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'playerstatus.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PlayerStatusTearOff {
  const _$PlayerStatusTearOff();

  _Loading loading() {
    return _Loading();
  }

  _Playing playing() {
    return _Playing();
  }

  _Pause pause() {
    return _Pause();
  }

  _Nothing nothing() {
    return _Nothing();
  }
}

/// @nodoc
const $PlayerStatus = _$PlayerStatusTearOff();

/// @nodoc
mixin _$PlayerStatus {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() playing,
    required TResult Function() pause,
    required TResult Function() nothing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? playing,
    TResult Function()? pause,
    TResult Function()? nothing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? playing,
    TResult Function()? pause,
    TResult Function()? nothing,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Playing value) playing,
    required TResult Function(_Pause value) pause,
    required TResult Function(_Nothing value) nothing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Playing value)? playing,
    TResult Function(_Pause value)? pause,
    TResult Function(_Nothing value)? nothing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Playing value)? playing,
    TResult Function(_Pause value)? pause,
    TResult Function(_Nothing value)? nothing,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayerStatusCopyWith<$Res> {
  factory $PlayerStatusCopyWith(
          PlayerStatus value, $Res Function(PlayerStatus) then) =
      _$PlayerStatusCopyWithImpl<$Res>;
}

/// @nodoc
class _$PlayerStatusCopyWithImpl<$Res> implements $PlayerStatusCopyWith<$Res> {
  _$PlayerStatusCopyWithImpl(this._value, this._then);

  final PlayerStatus _value;
  // ignore: unused_field
  final $Res Function(PlayerStatus) _then;
}

/// @nodoc
abstract class _$LoadingCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) then) =
      __$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res> extends _$PlayerStatusCopyWithImpl<$Res>
    implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(_Loading _value, $Res Function(_Loading) _then)
      : super(_value, (v) => _then(v as _Loading));

  @override
  _Loading get _value => super._value as _Loading;
}

/// @nodoc

class _$_Loading implements _Loading {
  _$_Loading();

  @override
  String toString() {
    return 'PlayerStatus.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() playing,
    required TResult Function() pause,
    required TResult Function() nothing,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? playing,
    TResult Function()? pause,
    TResult Function()? nothing,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? playing,
    TResult Function()? pause,
    TResult Function()? nothing,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Playing value) playing,
    required TResult Function(_Pause value) pause,
    required TResult Function(_Nothing value) nothing,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Playing value)? playing,
    TResult Function(_Pause value)? pause,
    TResult Function(_Nothing value)? nothing,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Playing value)? playing,
    TResult Function(_Pause value)? pause,
    TResult Function(_Nothing value)? nothing,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements PlayerStatus {
  factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$PlayingCopyWith<$Res> {
  factory _$PlayingCopyWith(_Playing value, $Res Function(_Playing) then) =
      __$PlayingCopyWithImpl<$Res>;
}

/// @nodoc
class __$PlayingCopyWithImpl<$Res> extends _$PlayerStatusCopyWithImpl<$Res>
    implements _$PlayingCopyWith<$Res> {
  __$PlayingCopyWithImpl(_Playing _value, $Res Function(_Playing) _then)
      : super(_value, (v) => _then(v as _Playing));

  @override
  _Playing get _value => super._value as _Playing;
}

/// @nodoc

class _$_Playing implements _Playing {
  _$_Playing();

  @override
  String toString() {
    return 'PlayerStatus.playing()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Playing);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() playing,
    required TResult Function() pause,
    required TResult Function() nothing,
  }) {
    return playing();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? playing,
    TResult Function()? pause,
    TResult Function()? nothing,
  }) {
    return playing?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? playing,
    TResult Function()? pause,
    TResult Function()? nothing,
    required TResult orElse(),
  }) {
    if (playing != null) {
      return playing();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Playing value) playing,
    required TResult Function(_Pause value) pause,
    required TResult Function(_Nothing value) nothing,
  }) {
    return playing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Playing value)? playing,
    TResult Function(_Pause value)? pause,
    TResult Function(_Nothing value)? nothing,
  }) {
    return playing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Playing value)? playing,
    TResult Function(_Pause value)? pause,
    TResult Function(_Nothing value)? nothing,
    required TResult orElse(),
  }) {
    if (playing != null) {
      return playing(this);
    }
    return orElse();
  }
}

abstract class _Playing implements PlayerStatus {
  factory _Playing() = _$_Playing;
}

/// @nodoc
abstract class _$PauseCopyWith<$Res> {
  factory _$PauseCopyWith(_Pause value, $Res Function(_Pause) then) =
      __$PauseCopyWithImpl<$Res>;
}

/// @nodoc
class __$PauseCopyWithImpl<$Res> extends _$PlayerStatusCopyWithImpl<$Res>
    implements _$PauseCopyWith<$Res> {
  __$PauseCopyWithImpl(_Pause _value, $Res Function(_Pause) _then)
      : super(_value, (v) => _then(v as _Pause));

  @override
  _Pause get _value => super._value as _Pause;
}

/// @nodoc

class _$_Pause implements _Pause {
  _$_Pause();

  @override
  String toString() {
    return 'PlayerStatus.pause()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Pause);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() playing,
    required TResult Function() pause,
    required TResult Function() nothing,
  }) {
    return pause();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? playing,
    TResult Function()? pause,
    TResult Function()? nothing,
  }) {
    return pause?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? playing,
    TResult Function()? pause,
    TResult Function()? nothing,
    required TResult orElse(),
  }) {
    if (pause != null) {
      return pause();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Playing value) playing,
    required TResult Function(_Pause value) pause,
    required TResult Function(_Nothing value) nothing,
  }) {
    return pause(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Playing value)? playing,
    TResult Function(_Pause value)? pause,
    TResult Function(_Nothing value)? nothing,
  }) {
    return pause?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Playing value)? playing,
    TResult Function(_Pause value)? pause,
    TResult Function(_Nothing value)? nothing,
    required TResult orElse(),
  }) {
    if (pause != null) {
      return pause(this);
    }
    return orElse();
  }
}

abstract class _Pause implements PlayerStatus {
  factory _Pause() = _$_Pause;
}

/// @nodoc
abstract class _$NothingCopyWith<$Res> {
  factory _$NothingCopyWith(_Nothing value, $Res Function(_Nothing) then) =
      __$NothingCopyWithImpl<$Res>;
}

/// @nodoc
class __$NothingCopyWithImpl<$Res> extends _$PlayerStatusCopyWithImpl<$Res>
    implements _$NothingCopyWith<$Res> {
  __$NothingCopyWithImpl(_Nothing _value, $Res Function(_Nothing) _then)
      : super(_value, (v) => _then(v as _Nothing));

  @override
  _Nothing get _value => super._value as _Nothing;
}

/// @nodoc

class _$_Nothing implements _Nothing {
  _$_Nothing();

  @override
  String toString() {
    return 'PlayerStatus.nothing()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Nothing);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() playing,
    required TResult Function() pause,
    required TResult Function() nothing,
  }) {
    return nothing();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? playing,
    TResult Function()? pause,
    TResult Function()? nothing,
  }) {
    return nothing?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? playing,
    TResult Function()? pause,
    TResult Function()? nothing,
    required TResult orElse(),
  }) {
    if (nothing != null) {
      return nothing();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Playing value) playing,
    required TResult Function(_Pause value) pause,
    required TResult Function(_Nothing value) nothing,
  }) {
    return nothing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Playing value)? playing,
    TResult Function(_Pause value)? pause,
    TResult Function(_Nothing value)? nothing,
  }) {
    return nothing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Playing value)? playing,
    TResult Function(_Pause value)? pause,
    TResult Function(_Nothing value)? nothing,
    required TResult orElse(),
  }) {
    if (nothing != null) {
      return nothing(this);
    }
    return orElse();
  }
}

abstract class _Nothing implements PlayerStatus {
  factory _Nothing() = _$_Nothing;
}
