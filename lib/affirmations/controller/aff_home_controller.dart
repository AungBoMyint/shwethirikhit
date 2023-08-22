import 'dart:async';
import 'dart:developer';

/* import 'package:audioplayers/audioplayers.dart';
 */
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import '../../utils/debouncer.dart';
import '../models/music.dart';

class AffHomeController extends GetxController {
  final _debouncer = Debouncer(milliseconds: 300);
  Rxn<Music> selectedMusic = Rxn<Music>(null);
  AudioPlayer player = AudioPlayer();
  var isPlaying = false.obs;
  var isLoading = false.obs;
  var streamDuration = Duration.zero.obs;
  var streamPosition = Duration.zero.obs;
  var streamBuffer = Duration.zero.obs;
  PlayerState? streamState;
  StreamSubscription<PlayerState>? playerStreams;
  List<StreamSubscription<Duration?>?>? streams;

  Future<void> setSelectedMusic(Music music) async {
/*     selectedMusic.value = music;
 */
    if (!(selectedMusic.value == null) &&
        (music.id == selectedMusic.value?.id)) {
      //if user press the same music
      if (!isPlaying.value) {
        await player.play();
      } else {
        await player.pause();
      }
      return;
    }
    selectedMusic.value = music;
    isLoading.value = true;
    if (isPlaying.value) {
      player.pause();
    }
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
      isPlaying.value = event.playing;
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
    isLoading.value = false;
  }

  Future<void> justPause() async {
    if (isPlaying.value) {
      await player.pause();
      isPlaying.value = false;
    }
  }

  @override
  void onClose() {
    player.stop();
    player.dispose();
    log("========Disposed Aff Home Audio Player");
    super.onClose();
  }
}
