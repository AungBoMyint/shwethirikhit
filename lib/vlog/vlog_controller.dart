import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kzn/consultant_appointant/controller/home_controller.dart';
import 'package:kzn/model/vlog_video.dart';
import 'package:video_player/video_player.dart';

class VlogController extends GetxController {
  Rxn<VlogVideo> selectedVideo = Rxn<VlogVideo>(null);
  final HomeController _homeController = Get.find();
  Rxn<ChewieController> chewieController = Rxn<ChewieController>(null);
  var isLoading = true.obs;
  Worker? worker;

  changeSelectedVideo(VlogVideo v) {
    selectedVideo.value = v;
    if (chewieController.value?.isPlaying == true) {
      chewieController.value?.pause();
    }
    chewieController.value = null;
    chewieController.value = ChewieController(
        videoPlayerController: VideoPlayerController.network(v.videoURL),
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
    chewieController.value!.videoPlayerController.dispose();
    chewieController.value!.dispose();
    worker?.dispose();
    super.onClose();
  }

  initChewieController(List<VlogVideo> v) {
    initializeImplementation(v);
  }

  initializeImplementation(List<VlogVideo> v) {
    if (v.isNotEmpty && (chewieController == null)) {
      selectedVideo.value = _homeController.vlogVideos.first;
      isLoading.value = false;
      debugPrint("Vlog Page Is Loading: ${isLoading.value}");
      chewieController.value = ChewieController(
          videoPlayerController: VideoPlayerController.network(
              _homeController.vlogVideos.first.videoURL),
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
    }
  }
}
