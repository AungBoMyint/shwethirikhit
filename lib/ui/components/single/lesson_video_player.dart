import 'dart:developer';

import 'package:better_player/better_player.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kzn/data/models/lesson.dart';
import 'package:kzn/providers/course_provider.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class LessonVideoPlayer extends StatefulWidget {
  @override
  _LessonVideoPlayerState createState() => _LessonVideoPlayerState();
}

class _LessonVideoPlayerState extends State<LessonVideoPlayer> {
  ChewieController? chewieController;

  @override
  void initState() {}

  @override
  void dispose() {
    log('------------Dispose course video route');
    // TODO: implement dispose\
    try {
      chewieController?.pause();
    } catch (e) {
      log("Error chewie controller pause.");
    }
    chewieController?.videoPlayerController?.dispose();
    chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.width > 700;
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      height: isTablet ? 450 : 225,
      child: _videoPlayerFuture(),
    );
  }

  Widget _videoPlayerFuture() {
    return FutureBuilder(
        future: Provider.of<CourseProvider>(context, listen: true).lesson,
        builder: (BuildContext context, AsyncSnapshot<Lesson> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data == null) {
              return Container(
                child: Center(child: Text('no lesson')),
              );
            } else {
              chewieController = ChewieController(
                  deviceOrientationsAfterFullScreen: [
                    DeviceOrientation.portraitUp,
                  ],
                  deviceOrientationsOnEnterFullScreen: [
                    DeviceOrientation.landscapeRight,
                  ],
                  videoPlayerController:
                      VideoPlayerController.network(snapshot.data!.videoUrl),
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
              return Chewie(
                controller: chewieController!,
              );
            }
          } else if (snapshot.hasError) {
            //_refreshController.refreshCompleted();
            return Container(
              child: Center(child: Text('error ${snapshot.error.toString()}')),
            );
          } else {
            //_refreshController.refreshCompleted();
            return Container(
              child: Center(child: Text('loading lesson...')),
            );
          }
        });
  }

  /* Widget _videoPlayer() {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: BetterPlayer(
        controller: _betterPlayerController,
      ),
    );
  } */
}
