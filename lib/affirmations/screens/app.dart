import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:kzn/affirmations/screens/search.dart';
import 'package:kzn/affirmations/screens/yourlibrary.dart';

import '../models/music.dart';
import 'home.dart';

class Aff extends StatefulWidget {
  const Aff({Key? key}) : super(key: key);

  @override
  _AffState createState() => _AffState();
}

class _AffState extends State<Aff> {
  AudioPlayer _audioPlayer = new AudioPlayer();
  var Tabs = [];
  int currentTabIndex = 0;
  bool isPlaying = false;
  Music? music;
  Widget miniPlayer(Music? music, {bool stop = false}) {
    this.music = music;

    if (music == null) {
      return SizedBox();
    }
    if (stop) {
      isPlaying = false;
      _audioPlayer.stop();
    }
    setState(() {});
    Size deviceSize = MediaQuery.of(context).size;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      color: Colors.blueGrey,
      width: deviceSize.width,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(music.image.replaceAll("'", ""), fit: BoxFit.cover),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                music.name,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    wordSpacing: 1,
                    letterSpacing: 1),
              ),
              SizedBox(
                height: 5,
              ),
              Text(music.desc,
                  style: TextStyle(
                      color: Colors.white, wordSpacing: 1, letterSpacing: 1)),
            ],
          ),
          SizedBox(
            width: 50,
          ),
          IconButton(
              onPressed: () async {
                isPlaying = !isPlaying;
                if (isPlaying) {
                  await _audioPlayer
                      .play(UrlSource(music.audioURL.replaceAll("'", "")));
                } else {
                  await _audioPlayer.pause();
                }
                setState(() {});
              },
              icon: isPlaying
                  ? Icon(Icons.pause, color: Colors.white)
                  : Icon(Icons.play_arrow, color: Colors.white))
        ],
      ),
    );
  }

  @override
  initState() {
    super.initState();
    Tabs = [AffHome(miniPlayer), Search(), YourLibrary()];
  }

  // UI Design Code Goes inside Build
  @override
  Widget build(BuildContext context) {
    print("Lets Build it");
    return Scaffold(
      body: Tabs[currentTabIndex],
      backgroundColor: Colors.black,
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          miniPlayer(music),
          // BottomNavigationBar(
          //   currentIndex: currentTabIndex,
          //   onTap: (currentIndex) {
          //     print("Current Index is $currentIndex");
          //     currentTabIndex = currentIndex;
          //     setState(() {}); // re-render
          //   },
          //   selectedLabelStyle: TextStyle(color: Colors.white),
          //   selectedItemColor: Colors.white,
          //   backgroundColor: Colors.black45,
          //   items: [
          //     BottomNavigationBarItem(
          //         icon: Icon(Icons.home, color: Colors.white), label: 'Home'),
          //     BottomNavigationBarItem(
          //       icon: Icon(Icons.search, color: Colors.white),
          //       label: 'Search',
          //     ),
          //     BottomNavigationBarItem(
          //         icon: Icon(Icons.library_books, color: Colors.white),
          //         label: 'Your Library')
          //   ],
          // )
        ],
      ),
    );
  }
}
