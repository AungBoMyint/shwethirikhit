import 'dart:async';
import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import '../../utils/debouncer.dart';
import '../models/music.dart';

class AffHomeController extends GetxController {
  final _debouncer = Debouncer(milliseconds: 300);
  Rxn<Music> selectedMusic = Rxn<Music>(null);
  AudioPlayer? player;
  var isPlaying = false.obs;
  var isLoading = false.obs;
  var streamDuration = Duration.zero.obs;
  var streamPosition = Duration.zero.obs;
  PlayerState? streamState;
  List<StreamSubscription<Duration>?>? streams;

  Future<void> setSelectedMusic(Music music) async {
    if (!(selectedMusic.value == null) &&
        (music.id == selectedMusic.value!.id)) {
      //if user press the same music
      if (isPlaying.value) {
        await player!.pause();

        isPlaying.value = false;
      } else {
        await player!.resume();
        isPlaying.value = true;
      }
      return;
    } else {
      //if different song
      if (isLoading.value) {
        //but it is still loading,nothing do,return
        return;
      }
    }
    selectedMusic.value = music;
    isLoading.value = true;
    if (isPlaying.value) {
      player!.pause();
      isPlaying.value = false;
    }
    player = null;
    player = AudioPlayer();
    isPlaying.value = true;
    await player!.play(UrlSource(music.audioURL));
    streamState = player?.state;
    player?.getDuration().then((it) {
      streamDuration.value = it ?? Duration.zero;
      log("Total Durations:$it");
    });
    player?.getCurrentPosition().then(
      (it) {
        streamPosition.value = it ?? Duration.zero;
        log("Player State: $it");
      },
    );

    if (!(streams == null)) streams?.map((e) => e?.cancel());
    streams = <StreamSubscription<Duration>?>[
      player?.onDurationChanged.listen((it) {
        streamDuration.value = it;
      }),

      /*  player?.onPlayerStateChanged
          .listen((it) =>  streamState = it), */
      player?.onPositionChanged.listen((it) {
        streamPosition.value = it;
        if (streamPosition.value == streamDuration.value && isPlaying.value) {
          isPlaying.value = false;
          log("Finished");
        }
      }),
    ];
    isLoading.value = false;
  }

  Future<void> justPause() async {
    if (isPlaying.value) {
      await player?.pause();
      isPlaying.value = false;
    }
  }

  @override
  void onClose() {
    player?.stop();
    player == null;
    player?.dispose();
    super.onClose();
  }
}
