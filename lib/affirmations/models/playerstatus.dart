import 'package:freezed_annotation/freezed_annotation.dart';

part 'playerstatus.freezed.dart';

@freezed
class PlayerStatus with _$PlayerStatus {
  factory PlayerStatus.loading() = _Loading;
  factory PlayerStatus.playing() = _Playing;
  factory PlayerStatus.pause() = _Pause;
  factory PlayerStatus.nothing() = _Nothing;
}
