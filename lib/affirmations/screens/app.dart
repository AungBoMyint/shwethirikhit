import 'dart:async';

import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kzn/affirmations/screens/search.dart';
import 'package:kzn/affirmations/screens/yourlibrary.dart';
import 'package:kzn/data/constant.dart';
import 'package:kzn/utils/utils.dart';

import '../controller/aff_home_controller.dart';
import '../models/music.dart';
import 'home.dart';

class Aff extends StatefulWidget {
  const Aff({Key? key}) : super(key: key);

  @override
  _AffState createState() => _AffState();
}

class _AffState extends State<Aff> {
  final AffHomeController affHomeController = Get.find();
  var Tabs = [];
  int currentTabIndex = 0;

  Widget audioProgressBar() {
    return Obx(
      () {
        final theme = Theme.of(Get.context!);
        final progress = affHomeController.streamPosition.value;
        final buffered = affHomeController.streamBuffer.value;
        final total = affHomeController.streamDuration.value;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: ProgressBar(
            barHeight: 2,
            thumbRadius: 8,
            progress: progress,
            timeLabelPadding: 5,
            thumbColor: Colors.white,
            progressBarColor: Colors.white,
            baseBarColor: Colors.grey.shade500,
            bufferedBarColor: Colors.grey.shade200,
            buffered: buffered,
            total: total,
            timeLabelTextStyle: TextStyle(
              color: Colors.grey.shade400,
            ),
            onSeek: (duration) {
              affHomeController.player.seek(duration);
            },
          ),
        );
      },
    );
  }

  Widget miniPlayer(Music? music, bool isPlaying) {
    if (music == null) {
      return SizedBox();
    }
    Size deviceSize = MediaQuery.of(context).size;
    return AnimatedContainer(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: mainThemeColor,
      ),
      duration: const Duration(milliseconds: 500),
      width: deviceSize.width,
      height: 150,
      padding: const EdgeInsets.only(
        top: 15,
        left: 15,
        right: 15,
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 80,
                width: 80,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  child: Image.network(
                    music.image.replaceAll("'", ""),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              horizontalSpace(10),
              Expanded(
                child: Text(
                  music.name,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      wordSpacing: 1,
                      letterSpacing: 1),
                ),
              ),
              IconButton(
                  onPressed: () => affHomeController.setSelectedMusic(music),
                  icon: isPlaying
                      ? Icon(Icons.pause, color: Colors.white)
                      : Icon(Icons.play_arrow, color: Colors.white)),
            ],
          ),
          verticalSpace(5),
          Expanded(child: audioProgressBar()),
        ],
      ),
    );
  }

  @override
  initState() {
    super.initState();
    Tabs = [AffHome(miniPlayer), Search(), YourLibrary()];
  }

  // UI Design Code Goes inside Build
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    print("Lets Build it");
    return Scaffold(
      body: Tabs[currentTabIndex],
      backgroundColor: Color.fromRGBO(85, 38, 38, 1),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Obx(() {
            final music = affHomeController.selectedMusic.value;
            final isPlaying = affHomeController.isPlaying.value;
            return miniPlayer(music, isPlaying);
          }),
        ],
      ),
    );
  }
}
