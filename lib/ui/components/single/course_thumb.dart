import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kzn/affirmations/screens/home.dart';
import 'package:kzn/consultant_appointant/controller/home_controller.dart';
import 'package:kzn/data/models/course.dart';
import 'package:kzn/providers/course_provider.dart';
import 'package:kzn/ui/components/single/course_thumb_img.dart';
import 'package:kzn/ui/routes/subscription_check_route.dart';
import 'package:kzn/utils/utils.dart';
import 'package:provider/provider.dart';

import '../../../data/image.dart';

class CourseThumb extends StatefulWidget {
  final Course course;
  CourseThumb({required this.course});

  @override
  State<CourseThumb> createState() => _CourseThumbState();
}

class _CourseThumbState extends State<CourseThumb> {
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
          return GestureDetector(
            onTap: () async {
              print("CourseThumb onTap");
              Provider.of<CourseProvider>(context, listen: false)
                  .setCourseDetail(widget.course);
              Navigator.pushNamed(context, SubscriptionCheckRoute.routeName);
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                FrameThumbImg(
                  frameSize: snap.data!,
                ),
                largerThanTablet(width)
                    ? LTablet(widget: widget)
                    : MobileAndTablet(widget: widget),
                // Align(
                //   alignment: Alignment.bottomCenter,
                //   child: Container(
                //     width: double.infinity,
                // color: Color.fromRGBO(38, 38, 38, 0.4),
                // padding: EdgeInsets.all(8.0),
                // margin: EdgeInsets.all(0.0),

                // child: Text(course.name,
                //   style: TextStyle(color: Colors.white, fontSize: 24),),
                // ),
                // ),
              ],
            ),
          );
        });
  }
}

class MobileAndTablet extends StatelessWidget {
  const MobileAndTablet({
    super.key,
    required this.widget,
  });

  final CourseThumb widget;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 16.5,
      right: 16.5,
      top: 30.5,
      bottom: 30.5,
      /* left: 23,
      right: 23,
      top: 30,
      bottom: 30, */
      child: Image.network(
        widget.course.coverImgUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}

class LTablet extends StatelessWidget {
  const LTablet({
    super.key,
    required this.widget,
  });

  final CourseThumb widget;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 23.5,
      right: 23.5,
      top: 45.5,
      bottom: 45.5,
      /* left: 23,
      right: 23,
      top: 30,
      bottom: 30, */
      child: Image.network(
        widget.course.coverImgUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}
