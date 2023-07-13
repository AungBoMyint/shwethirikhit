import 'dart:async';

import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kzn/affirmations/screens/search.dart';
import 'package:kzn/affirmations/screens/yourlibrary.dart';
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
        /* final buffered = durationState?.buffered ?? Duration.zero; */
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
            baseBarColor: Colors.grey.shade400,
            /*  buffered: buffered, */
            total: total,
            timeLabelTextStyle: TextStyle(
              color: Colors.grey.shade400,
            ),
            onSeek: (duration) {
              affHomeController.player?.seek(duration);
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
      duration: const Duration(milliseconds: 500),
      color: Colors.blueGrey,
      width: deviceSize.width,
      height: 150,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(
                music.image.replaceAll("'", ""),
                fit: BoxFit.contain,
                height: 100,
                width: 200,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    music.name,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        wordSpacing: 1,
                        letterSpacing: 1),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(music.desc,
                      style: TextStyle(
                          color: Colors.white,
                          wordSpacing: 1,
                          letterSpacing: 1)),
                ],
              ),
              SizedBox(
                width: 50,
              ),
              IconButton(
                  onPressed: () => affHomeController.setSelectedMusic(music),
                  icon: isPlaying
                      ? Icon(Icons.pause, color: Colors.white)
                      : Icon(Icons.play_arrow, color: Colors.white))
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
      backgroundColor: Colors.blueGrey,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: largerThanMobile(size.width) ? 20 : 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Obx(() {
              final music = affHomeController.selectedMusic.value;
              final isPlaying = affHomeController.isPlaying.value;
              return miniPlayer(music, isPlaying);
            }),
          ],
        ),
      ),
    );
  }
}
