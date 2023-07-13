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
        final progress = affHomeController.streamPosition.value;
        /* final buffered = durationState?.buffered ?? Duration.zero; */
        final total = affHomeController.streamDuration.value;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: ProgressBar(
            progress: progress,
            thumbColor: Colors.black,
            progressBarColor: Colors.black,
            baseBarColor: Colors.white,
            /*  buffered: buffered, */
            total: total,
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
              Image.network(music.image.replaceAll("'", ""), fit: BoxFit.cover),
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
    print("Lets Build it");
    return Scaffold(
      body: Tabs[currentTabIndex],
      backgroundColor: Colors.black,
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
