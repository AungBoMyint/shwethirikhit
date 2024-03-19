import 'dart:developer';

import 'package:better_player/better_player.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kzn/controller/course_route_controller.dart';
import 'package:kzn/data/models/course_price.dart';
import 'package:kzn/data/models/lesson.dart';
import 'package:kzn/providers/course_provider.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:video_player/video_player.dart';

class LessonVideoPlayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CourseProvider provider = Get.find();
    final isTablet = MediaQuery.of(context).size.width > 700;
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      height: isTablet ? 450 : 225,
      child: Obx(() {
        if ((provider.chewieController.value == null)) {
          return Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.white,
            child: Container(
              color: Colors.white,
            ),
          );
        }
        return Chewie(
          controller: provider.chewieController.value!,
        );
      }),
    );
  }
}
