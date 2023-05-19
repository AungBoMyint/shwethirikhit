import 'dart:async';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import '../models/music.dart';
import 'package:audioplayers/audioplayers.dart';

import '../models/playerstatus.dart';

class AffirmationsController extends GetxController {
  Rxn<Music> selectedMusic = Rxn<Music>(null);
  AudioPlayer? player;
  Rxn<Either<None, PlayerStatus>> playerStatus =
      Rxn<Either<None, PlayerStatus>>(right(PlayerStatus.nothing()));

  Future<void> setSelectedMusic(Music music) async {
    final state = playerStatus.value!.getOrElse(() => PlayerStatus.nothing());
    if (state == PlayerStatus.playing()) {
      log("Stop Song");
      player!.pause();
    }
    if (!(selectedMusic.value == null) &&
        (music.id == selectedMusic.value!.id)) {
      //if user press the same music
      if (state == PlayerStatus.playing()) {
        await player!.pause();
        playerStatus.value = right(PlayerStatus.pause());
      } else if (state == PlayerStatus.pause()) {
        await player!.resume();
        playerStatus.value = right(PlayerStatus.playing());
      }
      return;
    }
    playerStatus.value = right(PlayerStatus.loading());
    selectedMusic.value = music;
    musicPlay(music.audioURL).then((value) {
      listenStream();
    });
  }

  Future<void> musicPlay(String url) async {
    player = null;
    player = AudioPlayer();
    await player!.play(UrlSource(url));
  }

  listenStream() {
    playerStatus.value = right(PlayerStatus.playing());
    player!.onPositionChanged.listen((Duration p) {
      /* log('Current position: $p'); */
    });
  }

  @override
  void onClose() {
    player?.stop();
    player == null;
    /* player?.dispose(); */
    super.onClose();
  }
}
