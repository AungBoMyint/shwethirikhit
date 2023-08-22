import 'dart:async';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import '../../utils/debouncer.dart';
import '../models/music.dart';

import '../models/playerstatus.dart';

class AffirmationsController extends GetxController {
  final _debouncer = Debouncer(milliseconds: 300);
  Rxn<Music> selectedMusic = Rxn<Music>(null);
  AudioPlayer player = AudioPlayer();
  Rxn<Either<None, PlayerStatus>> playerStatus =
      Rxn<Either<None, PlayerStatus>>(right(PlayerStatus.nothing()));
  StreamSubscription<PlayerState>? playerStreams;
  List<StreamSubscription<Duration?>?>? streams;
  var streamDuration = Duration.zero.obs;
  var streamPosition = Duration.zero.obs;
  var streamBuffer = Duration.zero.obs;

  Future<void> setSelectedMusic(Music music) async {
    final state = playerStatus.value!.getOrElse(() => PlayerStatus.nothing());
    /* if (state == PlayerStatus.playing()) {
      log("Stop Song");
      player.pause();
    } */
    if (!(selectedMusic.value == null) &&
        (music.id == selectedMusic.value!.id)) {
      //if user press the same music
      if (state == PlayerStatus.playing()) {
        await player.pause();
      } else if (state == PlayerStatus.pause()) {
        await player.play();
      }
      return;
    } /*  else {
      //if different sound
      if (state == PlayerStatus.loading()) {
        //but it is still loading,nothing do,return
        return;
      }
    } */
/*     playerStatus.value = right(PlayerStatus.loading());
 */
    selectedMusic.value = music;
    musicPlay(music);
  }

  Future<void> musicPlay(Music music) async {
    player = player
      ..setAudioSource(AudioSource.uri(
        Uri.parse(music.audioURL),
        tag: MediaItem(
            // Specify a unique ID for each media item:
            id: music.id,
            // Metadata to display in the notification:
            album: music.categoryID,
            title: music.name,
            artUri: Uri.parse(music.image)),
      ));
    await player.play();

    if ((streams == null)) streams?.map((e) => e?.cancel());
    if ((playerStreams == null)) playerStreams?.cancel();
    player.playerStateStream.listen((event) {
      playerStatus.value = event.playing
          ? right(PlayerStatus.playing())
          : right(PlayerStatus.pause());
    });
    streams = <StreamSubscription<Duration?>?>[
      player.durationStream.listen((event) {
        streamDuration.value = event ?? Duration.zero;
      }),
      player.positionStream.listen((event) {
        streamPosition.value = event;
      }),
      player.bufferedPositionStream.listen((event) {
        streamBuffer.value = event;
      }),
    ];
  }

  @override
  void onClose() {
    player.stop();
    player.dispose();
    super.onClose();
  }
}
