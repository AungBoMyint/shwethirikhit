// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'playerstatus.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
    TResult? Function()? loading,
    TResult? Function()? playing,
    TResult? Function()? pause,
    TResult? Function()? nothing,
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
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Playing value)? playing,
    TResult? Function(_Pause value)? pause,
    TResult? Function(_Nothing value)? nothing,
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
      _$PlayerStatusCopyWithImpl<$Res, PlayerStatus>;
}

/// @nodoc
class _$PlayerStatusCopyWithImpl<$Res, $Val extends PlayerStatus>
    implements $PlayerStatusCopyWith<$Res> {
  _$PlayerStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_LoadingCopyWith<$Res> {
  factory _$$_LoadingCopyWith(
          _$_Loading value, $Res Function(_$_Loading) then) =
      __$$_LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadingCopyWithImpl<$Res>
    extends _$PlayerStatusCopyWithImpl<$Res, _$_Loading>
    implements _$$_LoadingCopyWith<$Res> {
  __$$_LoadingCopyWithImpl(_$_Loading _value, $Res Function(_$_Loading) _then)
      : super(_value, _then);
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
        (other.runtimeType == runtimeType && other is _$_Loading);
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
    TResult? Function()? loading,
    TResult? Function()? playing,
    TResult? Function()? pause,
    TResult? Function()? nothing,
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
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Playing value)? playing,
    TResult? Function(_Pause value)? pause,
    TResult? Function(_Nothing value)? nothing,
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
abstract class _$$_PlayingCopyWith<$Res> {
  factory _$$_PlayingCopyWith(
          _$_Playing value, $Res Function(_$_Playing) then) =
      __$$_PlayingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_PlayingCopyWithImpl<$Res>
    extends _$PlayerStatusCopyWithImpl<$Res, _$_Playing>
    implements _$$_PlayingCopyWith<$Res> {
  __$$_PlayingCopyWithImpl(_$_Playing _value, $Res Function(_$_Playing) _then)
      : super(_value, _then);
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
        (other.runtimeType == runtimeType && other is _$_Playing);
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
    TResult? Function()? loading,
    TResult? Function()? playing,
    TResult? Function()? pause,
    TResult? Function()? nothing,
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
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Playing value)? playing,
    TResult? Function(_Pause value)? pause,
    TResult? Function(_Nothing value)? nothing,
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
abstract class _$$_PauseCopyWith<$Res> {
  factory _$$_PauseCopyWith(_$_Pause value, $Res Function(_$_Pause) then) =
      __$$_PauseCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_PauseCopyWithImpl<$Res>
    extends _$PlayerStatusCopyWithImpl<$Res, _$_Pause>
    implements _$$_PauseCopyWith<$Res> {
  __$$_PauseCopyWithImpl(_$_Pause _value, $Res Function(_$_Pause) _then)
      : super(_value, _then);
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
        (other.runtimeType == runtimeType && other is _$_Pause);
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
    TResult? Function()? loading,
    TResult? Function()? playing,
    TResult? Function()? pause,
    TResult? Function()? nothing,
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
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Playing value)? playing,
    TResult? Function(_Pause value)? pause,
    TResult? Function(_Nothing value)? nothing,
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
abstract class _$$_NothingCopyWith<$Res> {
  factory _$$_NothingCopyWith(
          _$_Nothing value, $Res Function(_$_Nothing) then) =
      __$$_NothingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_NothingCopyWithImpl<$Res>
    extends _$PlayerStatusCopyWithImpl<$Res, _$_Nothing>
    implements _$$_NothingCopyWith<$Res> {
  __$$_NothingCopyWithImpl(_$_Nothing _value, $Res Function(_$_Nothing) _then)
      : super(_value, _then);
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
        (other.runtimeType == runtimeType && other is _$_Nothing);
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
    TResult? Function()? loading,
    TResult? Function()? playing,
    TResult? Function()? pause,
    TResult? Function()? nothing,
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
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Playing value)? playing,
    TResult? Function(_Pause value)? pause,
    TResult? Function(_Nothing value)? nothing,
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
