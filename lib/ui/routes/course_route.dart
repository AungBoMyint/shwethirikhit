import 'package:flutter/material.dart';
import 'package:kzn/data/constant.dart';
import 'package:kzn/providers/course_provider.dart';
import 'package:kzn/ui/components/single/lesson_card.dart';
import 'package:kzn/ui/components/single/lesson_video_player.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/image.dart';
import '../../utils/utils.dart';

class CourseRoute extends StatefulWidget {
  static const routeName = '/course_route';
  @override
  _CourseRouteState createState() => _CourseRouteState();
}

class _CourseRouteState extends State<CourseRoute> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: mainThemeColor,
        appBar: AppBar(
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: mainThemeColor,
          title: Text(
            Provider.of<CourseProvider>(context, listen: true).course!.name,
            style: TextStyle(fontSize: 14.0, color: Colors.black),
          ),
          actions: [
            SizedBox(
              width: 25,
              child: InkWell(
                onTap: () async {
                  try {
                    await launch('https://m.me/selfmasterywithkhit');
                  } catch (e) {
                    print(e);
                  }
                },
                child: Image.asset(
                  AppImage.messenger,
                  /* width: 23,
                                          height: 23, */
                ),
              ),
            ),
            horizontalSpace(20),
          ],
        ),
        body: Column(
          children: [
            LessonVideoPlayer(),
            //Placeholder(fallbackHeight: 300,),
            Expanded(
                child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) => LessonCard(
                          lesson:
                              Provider.of<CourseProvider>(context, listen: true)
                                  .course!
                                  .lessonSet[index],
                        ),
                    separatorBuilder: (context, index) => Divider(),
                    itemCount:
                        Provider.of<CourseProvider>(context, listen: true)
                            .course!
                            .lessonSet
                            .length))
          ],
        ),
      ),
    );
  }
}
