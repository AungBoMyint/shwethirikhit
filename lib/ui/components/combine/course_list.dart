import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kzn/data/models/course.dart';
import 'package:kzn/ui/components/single/course_thumb.dart';
import 'package:kzn/utils/utils.dart';

import '../../../affirmations/screens/home.dart';
import '../../../consultant_appointant/controller/home_controller.dart';

class CourseList extends StatelessWidget {
  final List<Course> courses;
  CourseList({required this.courses});
  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find();
    final width = MediaQuery.of(context).size.width;
    return FutureBuilder<Size>(
        future: homeController.completer.future,
        builder: (context, AsyncSnapshot<Size> snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return LoadingWidget();
          }
          if (snap.hasError) {
            return ErrorWidget("${snap.error}");
          }
          debugPrint(
              "**************Height: ${snap.data?.height} Width: ${snap.data?.width}");
          return GridView.builder(
              padding: const EdgeInsets.only(bottom: 10, left: 5, right: 5),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: largerThanMobile(width) ? 3 : 2,
                /* mainAxisSpacing: 20,
                crossAxisSpacing: 35, */
                childAspectRatio: (snap.data!.width / snap.data!.height),
              ),
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) =>
                  CourseThumb(course: courses[index]),
              itemCount: courses.length);
        });
  }
}
