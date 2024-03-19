import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../model/therapy_video.dart';

class TherapyController extends GetxController {
  Rxn<TherapyVideo> selectedVideo = Rxn<TherapyVideo>(null);
  Rxn<ChewieController> chewieController = Rxn<ChewieController>(null);
  var isLoading = false.obs;

  void reset() {
    isLoading.value = false;
    selectedVideo.value = null;
    chewieController.value?.pause();

    chewieController.value = null;
    /* chewieController.value?.dispose(); */
  }

  playVideo() => chewieController.value?.play();
  void disposeVideo() {
    chewieController.value?.videoPlayerController.dispose();
    chewieController.value?.dispose();
    chewieController.value = null;
  }

  changeSelectedVideo(TherapyVideo v) async {
    isLoading.value = true;
    await Future.delayed(Duration.zero);
    selectedVideo.value = v;
    disposeVideo(); // Dispose previous controller if any

    try {
      VideoPlayerController videoPlayerController =
          VideoPlayerController.network(v.videoURL);
      await videoPlayerController
          .initialize(); // Ensure initialization before creating ChewieController

      chewieController.value = ChewieController(
          deviceOrientationsAfterFullScreen: [
            DeviceOrientation.portraitUp,
          ],
          deviceOrientationsOnEnterFullScreen: [
            DeviceOrientation.landscapeRight,
          ],
          videoPlayerController: videoPlayerController,
          aspectRatio: 16 / 9,
          autoInitialize: true,
          autoPlay: true,
          looping: true,
          errorBuilder: (context, errorMessage) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  errorMessage,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            );
          });
    } catch (e) {
      isLoading.value = false;
      return;
    } finally {
      isLoading.value = false;
    }
  }
}
