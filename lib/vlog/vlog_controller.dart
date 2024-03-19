import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kzn/consultant_appointant/controller/home_controller.dart';
import 'package:kzn/model/vlog_video.dart';
import 'package:video_player/video_player.dart';
import 'dart:developer';

class VlogController extends GetxController {
  var isLessonLoading = false.obs;
  Rxn<VlogVideo> selectedVideo = Rxn<VlogVideo>(null);
  final HomeController _homeController = Get.find();
  Rxn<ChewieController> chewieController = Rxn<ChewieController>(null);
  var isLoading = true.obs;
  Worker? worker;

  playVideo() => chewieController.value?.play();
  void disposeVideo() {
    chewieController.value?.videoPlayerController.dispose();
    chewieController.value?.dispose();
    chewieController.value = null;
  }

  Future<void> changeSelectedVideo(VlogVideo v) async {
    selectedVideo.value = v;
    if (isLessonLoading.isTrue) return;

    isLessonLoading.value = true;
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
          autoPlay: false,
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
      isLessonLoading.value = false;
      // Handle error
      print("Error initializing video player: $e");
    } finally {
      isLessonLoading.value = false;
    }
  }

  @override
  void onInit() {
    initializeImplementation(_homeController.vlogVideos);
    // init ChewieController
    worker = ever(_homeController.vlogVideos, initChewieController);
    super.onInit();
  }

  @override
  void onClose() {
    chewieController.value?.videoPlayerController.dispose();
    chewieController.value?.dispose();
    worker?.dispose();
    super.onClose();
  }

  initChewieController(List<VlogVideo> v) {
    initializeImplementation(v);
  }

  initializeImplementation(List<VlogVideo> v) {
/*     log("====video url: ${_homeController.vlogVideos.first.videoURL}");
 */
    if (v.isNotEmpty && (chewieController.value == null)) {
      selectedVideo.value = _homeController.vlogVideos.first;
      isLoading.value = false;
      debugPrint("Vlog Page Is Loading: ${isLoading.value}");
      changeSelectedVideo(_homeController.vlogVideos.first);
    }
  }
}
