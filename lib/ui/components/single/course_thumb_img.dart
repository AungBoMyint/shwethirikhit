import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kzn/consultant_appointant/controller/home_controller.dart';
import 'package:kzn/data/constant.dart';
import 'package:kzn/data/models/course.dart';

import '../../../data/image.dart';

class CourseThumbImg extends StatelessWidget {
  final Course course;
  final Size frameSize;
  CourseThumbImg({required this.course, required this.frameSize});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Image.network(
        course.coverImgUrl,
        fit: BoxFit.contain,
      ),
    );
  }
}

class FrameThumbImg extends StatelessWidget {
  final Size frameSize;
  FrameThumbImg({required this.frameSize});
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: (frameSize.width / frameSize.height) * 0.9,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(appIconAsset, fit: BoxFit.fill),
            CircularProgressIndicator(),
            Image.asset(
              AppImage.iPhoneFrame,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
