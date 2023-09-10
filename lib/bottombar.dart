import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kzn/consultant_appointant/controller/home_controller.dart';
import 'package:kzn/data/constant.dart';
import 'package:kzn/ui/routes/main_route.dart';
import 'affirmations/controller/aff_home_controller.dart';
import 'affirmations/screens/app.dart';
import 'consultant_appointant/screen/view/home.dart';
import 'controller/main_controller.dart';
import 'therapy/therapy.dart';
import 'vlog/vlog.dart';
import 'vlog/vlog_controller.dart';

class BottomBar extends StatefulWidget {
  static final routeName = "bottomBar";
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  List<Widget> _widgetOption = <Widget>[
    // getHomeWidget(),
    HomeView(),
    Vlog(),
    MainRoute(),
    Therapy(),
    Aff(),
  ];

  @override
  Widget build(BuildContext context) {
    final HomeController _homeController = Get.find();
    final AffHomeController affHomeController = Get.find();
    return Scaffold(
      backgroundColor: Color(0xFFEBDFD5),
      body: Obx(() {
        final currentIndex = _homeController.currentIndex.value;
        return _widgetOption[currentIndex];
      }),
      bottomNavigationBar: Obx(() {
        final currentIndex = _homeController.currentIndex.value;
        return new Theme(
          data: Theme.of(context).copyWith(
            // sets the background color of the `BottomNavigationBar`
            canvasColor: mainThemeColor,
          ),
          child: BottomNavigationBar(
            onTap: (v) {
              affHomeController.justPause();
              log("*****On Tap Call");
              //Everytime Nav change
              if (v != 1) {
                //if Nav is not Vlog,need to despose VlogController
                Get.delete<VlogController>(force: true);
              } else {
                Get.put(VlogController());
              }
              _homeController.changeCurrentIndex(v);
            },
            items: [
              // BottomNavigationBarItem(icon: Icon(Icons.video_collection_outlined), label: 'Vlog'),
              BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/news.png',
                    height: 24,
                  ),
                  label: 'News'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.video_collection_outlined, size: 26.0),
                  label: 'Vlog'),
              BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/learning.png',
                    height: 23,
                  ),
                  label: 'Learning'),
              BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/therapy.png',
                    height: 24,
                  ),
                  label: 'Therapy'),
              BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/affirmations.png',
                    height: 24,
                  ),
                  label: 'Affirmations'),
            ],
            currentIndex: currentIndex,
            selectedItemColor: secondMainThemeColor,
            unselectedItemColor: secondMainThemeColor,
          ),
        );
      }),
    );
  }
}
