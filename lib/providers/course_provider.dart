/* import 'dart:convert';
import 'package:chewie/chewie.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_connect/sockets/src/socket_notifier.dart';
import 'package:kzn/data/constant.dart';
import 'package:kzn/data/models/course.dart';
import 'package:kzn/data/models/lesson.dart';
import 'package:video_player/video_player.dart';

class CourseProvider extends ChangeNotifier {
  Course? course;
  /* Future< */ Lesson /* > */ ? lesson;
  bool isLoading = false;
  ChewieController? chewieController;
  List<Course> courseListNormal = [];
  Future<List<Course>>? courseList;
  int? _lastCourseId;
  bool? courseLoading;

  void disposeVideoController() {
    chewieController?.pause();
    chewieController?.videoPlayerController.pause();
    chewieController?.videoPlayerController.dispose();
    chewieController?.dispose();
    print("*********Dispose Video Controller");
  }

  playVideo() => chewieController?.play();
  changeSelectedVideo(Lesson v) {
    lesson = v;
    if (chewieController?.isPlaying == true) {
      chewieController?.pause();
    }
    chewieController?.videoPlayerController.dispose();
    chewieController?.dispose();
    chewieController = null;
    chewieController = ChewieController(
        deviceOrientationsAfterFullScreen: [
          DeviceOrientation.portraitUp,
        ],
        deviceOrientationsOnEnterFullScreen: [
          DeviceOrientation.landscapeRight,
        ],
        videoPlayerController: VideoPlayerController.network(v.videoUrl),
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
  }

  // 1. select all courses [public]
  Future<void> getCourseListForOneTime() async {
    try {
      courseLoading = true;
      var response = await Dio().get(courseEndpoint);

      Map<String, dynamic> dataResponse = response.data;
      dynamic dataList = dataResponse['results']; // list of wp-content

      courseListNormal = [];

      for (int i = 0; i < dataList.length; i++) {
        try {
          courseListNormal.add(Course.fromJson(dataList[i]));
          _lastCourseId = courseListNormal.last.id;
        } catch (innerExp) {}
      }

      //goodsListForOneTime = goodsListCONSTANT;
      courseList = Future.delayed(Duration.zero, () => courseListNormal);

      //return goodsListForOneTime;

      courseLoading = false;
      Future.delayed(Duration(seconds: 1), () {
        notifyListeners();
      });
    } catch (exp) {
      // customer = null;
      courseLoading = false;
      courseListNormal = [];
      courseList = Future.delayed(Duration.zero, () => courseListNormal);
      Future.delayed(Duration(seconds: 1), () {
        notifyListeners();
      });
    }
  }

  void setCourseDetail(Course detailCourse) {
    course = detailCourse;
    isLoading = true;
    try {
      setLessonDetail(course!.lessonSet.first);
    } catch (exp) {}
    isLoading = false;
    notifyListeners();
  }

  void setLessonDetail(Lesson detailLesson) {
    changeSelectedVideo(detailLesson);
    notifyListeners();
  }
}
 */