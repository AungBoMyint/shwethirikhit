import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kzn/ui/routes/main_route.dart';
import 'affirmations/screens/app.dart';
import 'consultant_appointant/screen/view/home.dart';
import 'controller/main_controller.dart';
import 'therapy/therapy.dart';
import 'vlog/vlog.dart';

class BottomBar extends StatefulWidget {
  static final routeName = "bottomBar";
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currentindex = 1;

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
    final MainController mainController = Get.find();
    return Scaffold(
      body: _widgetOption.elementAt(_currentindex),
      bottomNavigationBar: BottomNavigationBar(
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
          /*  BottomNavigationBarItem(
            label: 'Coming Classes',
            icon: Stack(
              children: <Widget>[
                Icon(Icons.doorbell),
                new Positioned(
                  right: 0,
                  child: new Container(
                    padding: EdgeInsets.all(1),
                    decoration: new BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    constraints: BoxConstraints(
                      minWidth: 14,
                      minHeight: 14,
                    ),
                    child: new Text('New',
                        style: new TextStyle(color: Colors.white, fontSize: 8),
                        textAlign: TextAlign.center),
                  ),
                ),
              ],
            ),
          ), */
        ],
        currentIndex: _currentindex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        onTap: _changeItem,
      ),
    );
  }

  void _changeItem(int value) {
    setState(() {
      _currentindex = value;
    });
  }
}
