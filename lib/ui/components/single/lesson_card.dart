import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kzn/controller/course_route_controller.dart';
import 'package:kzn/data/models/course_price.dart';
import 'package:kzn/data/models/lesson.dart';
import 'package:kzn/providers/course_provider.dart';
import 'package:provider/provider.dart';
import 'dart:developer' as d;

class LessonCard extends StatelessWidget {
  final Lesson lesson;
  LessonCard({required this.lesson});
  @override
  Widget build(BuildContext context) {
    CourseProvider provider = Get.find();
    return Obx(() {
      return Container(
        color: provider.lesson.value?.id == lesson.id
            ? Colors.grey.shade200
            : Colors.transparent,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
          child: InkWell(
            onTap: () {
              print("lessonCard.onTap");
              provider.setLessonDetail(lesson);
            },

            child: Text(
              lesson.name,
              style: TextStyle(color: Colors.black),
            ),
            // ),
          ),
        ),
      );
    });
  }
}
