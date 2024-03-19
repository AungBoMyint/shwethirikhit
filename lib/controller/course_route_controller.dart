/* import 'dart:async';
import 'dart:convert';
import 'package:chewie/chewie.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/sockets/src/socket_notifier.dart';
import 'package:kzn/data/constant.dart';
import 'package:kzn/data/models/course.dart';
import 'package:kzn/data/models/lesson.dart';
import 'package:video_player/video_player.dart';

class CourseProvider extends GetxController {
  bool isLessonLoading = false;
  Rxn<Course> course = Rxn<Course>(null);
  /* Future< */ Rxn<Lesson> /* > */ lesson = Rxn<Lesson>(null);
  var isLoading = false.obs;
  Rxn<ChewieController> chewieController = Rxn<ChewieController>(null);
  RxList<Course> courseListNormal = <Course>[].obs;
  RxList<Course> courseList = <Course>[].obs;
  Rxn<int> lastCourseId = Rxn(null);
  var courseLoading = false.obs;

  void pauseVideo() {
    chewieController.value?.videoPlayerController.pause();
    chewieController.value?.pause();
  }

  @override
  void onClose() {
    chewieController.value?.videoPlayerController.pause();
    chewieController.value?.pause();
    chewieController.value?.videoPlayerController.dispose();
    chewieController.value?.dispose();
    _debounce?.cancel();
    super.onClose();
  }

  playVideo() => chewieController.value?.play();
  changeSelectedVideo(Lesson v) async {
    if (!(chewieController.value == null) &&
        chewieController.value?.videoPlayerController.value.isInitialized ==
            false) {
      return;
    }
    await Future.delayed(Duration(milliseconds: 100));
    lesson.value = v;
    if (chewieController.value?.isPlaying == true) {
      chewieController.value?.pause();
    }
    chewieController.value?.videoPlayerController.pause();
    chewieController.value?.pause();
    chewieController.value = null;
    try {
      chewieController.value = ChewieController(
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
    } catch (e) {
      //Error
    }
  }

  // 1. select all courses [public]
  Future<void> getCourseListForOneTime() async {
    try {
      courseLoading.value = true;
      var response = await Dio().get(courseEndpoint);

      Map<String, dynamic> dataResponse = response.data;
      dynamic dataList = dataResponse['results']; // list of wp-content

      courseListNormal.value = [];

      for (int i = 0; i < dataList.length; i++) {
        try {
          courseListNormal.add(Course.fromJson(dataList[i]));
          lastCourseId.value = courseListNormal.last.id;
        } catch (innerExp) {}
      }

      //goodsListForOneTime = goodsListCONSTANT;
      courseList.value = courseListNormal;

      //return goodsListForOneTime;

      courseLoading.value = false;

      /*  Future.delayed(Duration(seconds: 1), () {
        
      }); */
    } catch (exp) {
      // customer = null;
      courseLoading.value = false;
      courseListNormal.value = [];
      courseList.value = courseListNormal;
    }
  }

  void setCourseDetail(Course detailCourse) {
    course.value = detailCourse;
    isLoading.value = true;
    try {
      setLessonDetail(course.value!.lessonSet.first);
    } catch (exp) {}
    isLoading.value = false;
  }

  Timer? _debounce;

  void setLessonDetail(Lesson detailLesson) {
    if (_debounce?.isActive ?? false) return;

    if (isLessonLoading) {
      return;
    }
    isLessonLoading = true;

    _debounce = Timer(const Duration(milliseconds: 1000), () {
      changeSelectedVideo(detailLesson);
    });

    isLessonLoading = false;
  }
}
 */

import 'dart:async';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:dio/dio.dart';

import '../data/constant.dart';
import '../data/models/course.dart';
import '../data/models/lesson.dart';
import '../services/database/database.dart';

class CourseProvider extends GetxController {
  var isLessonLoading = false.obs;
  Rxn<Course> course = Rxn<Course>();
  Rxn<Lesson> lesson = Rxn<Lesson>();
  var isLoading = false.obs;
  Rxn<ChewieController> chewieController = Rxn<ChewieController>();
  RxList<Course> courseListNormal = <Course>[].obs;
  RxList<Course> courseList = <Course>[].obs;
  Rxn<int> lastCourseId = Rxn<int>();
  var courseLoading = false.obs;
  Timer? _debounce;

  @override
  void onInit() {
    super.onInit();
    // Optionally initialize resources here if needed
  }

  @override
  void onClose() {
    disposeVideo();
    _debounce?.cancel();
    super.onClose();
  }

  void disposeVideo() {
    chewieController.value?.videoPlayerController.dispose();
    chewieController.value?.dispose();
    chewieController.value = null;
  }

  Future<void> changeSelectedVideo(Lesson v) async {
    if (isLessonLoading.isTrue) return;

    isLessonLoading.value = true;
    disposeVideo(); // Dispose previous controller if any

    try {
      VideoPlayerController videoPlayerController =
          VideoPlayerController.network(v.videoUrl);
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
      lesson.value = v; // Update the current lesson
    } catch (e) {
      // Handle error
      print("Error initializing video player: $e");
    } finally {
      isLessonLoading.value = false;
    }
  }

  void getCourseListForOneTime() {
    FirebaseFirestore.instance
        .collection("callApi")
        .doc("check")
        .snapshots()
        .listen((event) {
      final data = event.data() ?? {"call": false};
      if (data["call"]) {
        //if call is true,we will call this api
        callApi();
      } else {
        //not call,so delete course if we already called
        //before
        disposeVideo();
        courseList.clear();
        courseListNormal.clear();
      }
    });
  }

  Future<void> callApi() async {
    try {
      courseLoading.value = true;
      var response = await Dio().get(courseEndpoint);

      Map<String, dynamic> dataResponse = response.data;
      dynamic dataList = dataResponse['results']; // list of wp-content

      courseListNormal.value = [];

      for (int i = 0; i < dataList.length; i++) {
        try {
          courseListNormal.add(Course.fromJson(dataList[i]));
          lastCourseId.value = courseListNormal.last.id;
        } catch (innerExp) {}
      }

      //goodsListForOneTime = goodsListCONSTANT;
      courseList.value = courseListNormal;
      log("Total Course: ${courseList.length}");

      //return goodsListForOneTime;

      courseLoading.value = false;

      /*  Future.delayed(Duration(seconds: 1), () {
        
      }); */
    } catch (exp) {
      // customer = null;
      courseLoading.value = false;
      courseListNormal.value = [];
      courseList.value = courseListNormal;
    }
  }

  void setCourseDetail(Course detailCourse) {
    course.value = detailCourse;
    isLoading.value = true;
    try {
      if (detailCourse.lessonSet.isNotEmpty) {
        setLessonDetail(detailCourse.lessonSet.first);
      }
    } catch (exp) {
      // Handle error
    } finally {
      isLoading.value = false;
    }
  }

  void setLessonDetail(Lesson detailLesson) {
    if (_debounce?.isActive ?? false) return;

    _debounce = Timer(const Duration(milliseconds: 1000), () {
      changeSelectedVideo(detailLesson);
    });
  }
}
