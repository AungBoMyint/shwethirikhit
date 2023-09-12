import 'package:better_player/better_player.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kzn/consultant_appointant/controller/home_controller.dart';
import 'package:kzn/model/vlog_video.dart';
import 'package:video_player/video_player.dart';
import 'dart:developer';

class VlogController extends GetxController {
  Rxn<VlogVideo> selectedVideo = Rxn<VlogVideo>(null);
  final HomeController _homeController = Get.find();
  Rxn<BetterPlayerController> betterPlayerController =
      Rxn<BetterPlayerController>(null);
  var isLoading = true.obs;
  Worker? worker;

  playVideo() => betterPlayerController.value?.play();
  changeSelectedVideo(VlogVideo v) {
    selectedVideo.value = v;
    if (betterPlayerController.value?.isPlaying == true) {
      betterPlayerController.value?.pause();
    }
    betterPlayerController.value?.dispose();
    betterPlayerController.value?.dispose();
    betterPlayerController.value = null;
    betterPlayerController.value = BetterPlayerController(
        BetterPlayerConfiguration(
          autoPlay: true,
          looping: true,
          fullScreenByDefault: false,
          deviceOrientationsAfterFullScreen: [
            DeviceOrientation.portraitUp,
          ],
          deviceOrientationsOnFullScreen: [
            DeviceOrientation.landscapeRight,
          ],
        ),
        betterPlayerDataSource: BetterPlayerDataSource.network(v.videoURL));
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
    betterPlayerController.value?.videoPlayerController?.dispose();
    betterPlayerController.value?.dispose();
    worker?.dispose();
    super.onClose();
  }

  initChewieController(List<VlogVideo> v) {
    initializeImplementation(v);
  }

  initializeImplementation(List<VlogVideo> v) {
/*     log("====video url: ${_homeController.vlogVideos.first.videoURL}");
 */
    if (v.isNotEmpty && (betterPlayerController.value == null)) {
      selectedVideo.value = _homeController.vlogVideos.first;
      isLoading.value = false;
      debugPrint("Vlog Page Is Loading: ${isLoading.value}");
      betterPlayerController.value = BetterPlayerController(
          BetterPlayerConfiguration(
            autoPlay: true,
            looping: true,
            fullScreenByDefault: false,
            deviceOrientationsAfterFullScreen: [
              DeviceOrientation.portraitUp,
            ],
            deviceOrientationsOnFullScreen: [
              DeviceOrientation.landscapeRight,
            ],
          ),
          betterPlayerDataSource:
              BetterPlayerDataSource.network(v.first.videoURL));
      /*  log("Vlog Page Is Loading: ${isLoading.value}");
      log("Vlog Page ChewieController is Null: ${chewieController.value == null}"); */
    }
  }
}
