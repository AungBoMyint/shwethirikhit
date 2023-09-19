import 'package:flutter/material.dart';
import 'package:kzn/data/constant.dart';
import 'package:kzn/data/models/course.dart';
import 'package:kzn/providers/course_provider.dart';
import 'package:kzn/ui/components/combine/app_drawer.dart';
import 'package:kzn/ui/components/combine/course_list.dart';
import 'package:kzn/ui/components/combine/intro_slider.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../consultant_appointant/screen/view/home.dart';
import '../../data/image.dart';

class MainRoute extends StatefulWidget {
  static const routeName = '/main_route';

  @override
  _MainRouteState createState() => _MainRouteState();
}

class _MainRouteState extends State<MainRoute> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Provider.of<CourseProvider>(context, listen: false)
        .getCourseListForOneTime();

    //Provider.of<UserProvider>(context,listen: false).login(username: "admin", password: "admin");
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: logoColor,
        appBar: AppBar(
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.white),
            backgroundColor: logoColor,
            title: Text("Shwe Thiri Khit",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  letterSpacing: 1,
                  wordSpacing: 2,
                )),
            actions: [
              SizedBox(
                width: 40,
                child: IconButton(
                  onPressed: () async {
                    try {
                      await launch('https://m.me/selfmasterywithkhit');
                    } catch (e) {
                      print(e);
                    }
                  },
                  icon: Image.asset(
                    AppImage.messenger,
                    /* width: 23,
                  height: 23, */
                  ),
                ),
              ),
            ]),

        body: SingleChildScrollView(
          child: Column(
            /* shrinkWrap: true,
              primary: false, */
            children: [
              IntroSlider(
                photos: introSliderImages,
              ),
              Container(
                width: size.width,
                decoration: BoxDecoration(
                  color: Color(0xFFEAE1D7),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                    left: 20,
                  ),
                  child: Text(
                    "Courses for you",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              Container(
                color: Color(0xFFEAE1D7),
                child: _courseListFutureBuilder(),
              ),
              /* Expanded(
                child:  */
              /*  Container(
                color: Color(0xFFEAE1D7),
                child: _courseListFutureBuilder(),
              ), */
              /*  ), */
            ],
          ),
        ),

        drawer: AppDrawer(),
        // floatingActionButton: AppFab(),
      ),
    );
  }

  // 1 Course List Future Builder
  Widget _courseListFutureBuilder() {
    return FutureBuilder(
        future: Provider.of<CourseProvider>(context, listen: true).courseList,
        builder: (BuildContext context, AsyncSnapshot<List<Course>> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.length == 0) {
              return HomeView();
            } else {
              final courses = snapshot.data!.reversed.toList();
              return CourseList(courses: courses);
            }
          } else if (snapshot.hasError) {
            //_refreshController.refreshCompleted();
            return Container(
              child: Center(child: Text('error ${snapshot.error.toString()}')),
            );
          } else {
            //_refreshController.refreshCompleted();
            return HomeView();
          }
        });
  }
}
