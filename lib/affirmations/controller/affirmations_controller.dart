import 'package:get/get.dart';
import '../models/music.dart';
import 'package:audioplayers/audioplayers.dart';

class AffirmationsController extends GetxController {
  Rxn<Music> selectedMusic = Rxn<Music>(null);
  AudioPlayer? player;
  var playerLoading = false.obs;

  Future<void> setSelectedMusic(Music music) async {
    playerLoading.value = true;
    selectedMusic.value = music;
    if (!(player == null)) {
      player!.stop().then((value) async {
        musicPlay(music.audioURL).then((value) => playerLoading.value = false);
      });
      return;
    }
    musicPlay(music.audioURL).then((value) => playerLoading.value = false);
  }

  Future<void> musicPlay(String url) async {
    player = null;
    player = AudioPlayer();
    await player!.play(UrlSource(url));
  }
}
