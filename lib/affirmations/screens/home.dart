import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../consultant_appointant/controller/home_controller.dart';
import '../../model/category.dart';
import '../models/music.dart';

class AffHome extends GetView<HomeController> {
  Function _miniPlayer;
  AffHome(this._miniPlayer); // Dart Constructor ShortHand
  // const Home({Key? key}) : super(key: key);
  Widget createCategory(Category category) {
    return Container(
        color: Colors.blueGrey.shade400,
        child: Row(
          children: [
            Image.network(category.image, fit: BoxFit.cover),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                category.name,
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ));
  }

  List<Widget> createListOfCategories() {
    // Convert Data to Widget Using map function
    List<Widget> categories = controller.affirmationsCategories
        .map((category) => createCategory(category))
        .toList();
    return categories;
  }

  Widget createMusic(Music music) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 160,
            width: 160,
            child: InkWell(
              onTap: () {
                _miniPlayer(music, stop: false);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  music.image.replaceAll("'", ""),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            music.name,
            style: TextStyle(
                color: Colors.white, letterSpacing: 0.5, wordSpacing: 0.5),
          ),
          Text(music.desc,
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 0.5,
                wordSpacing: 0.5,
              ))
        ],
      ),
    );
  }

  /* Widget createMusicList(String label) {
    List<Music> musicList = controller.musics;
    return Padding(
      padding: EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
                wordSpacing: 1),
          ),
          Container(
            height: 230,
            child: ListView.builder(
              //padding: EdgeInsets.all(5),
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, index) {
                return createMusic(musicList[index]);
              },
              itemCount: musicList.length,
            ),
          )
        ],
      ),
    );
  
  } */

  Widget createGrid() {
    return Container(
      padding: EdgeInsets.all(10),
      height: 280,
      child: GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        childAspectRatio: 5 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: createListOfCategories(),
        crossAxisCount: 2,
      ),
    );
  }

  Widget createAppBar(String message) {
    return AppBar(
      backgroundColor: Color.fromRGBO(85, 38, 38, 1),
      elevation: 0.0,
      title: Text(
        message,
        style: TextStyle(wordSpacing: 1, letterSpacing: 1),
      ),
      actions: [
        SizedBox(
          width: 90,
          child: ElevatedButton(
            style: ButtonStyle(
              alignment: Alignment.center,
              backgroundColor: MaterialStateProperty.all(Colors.transparent),
              elevation: MaterialStateProperty.resolveWith<double>(
                // As you said you dont need elevation. I'm returning 0 in both case
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.disabled)) {
                    return 0;
                  }
                  return 0; // Defer to the widget's default.
                },
              ),
            ),
            onPressed: () async {
              try {
                await launch('https://m.me/selfmasterywithkhit');
              } catch (e) {
                print(e);
              }
            },
            child: FaIcon(
              FontAwesomeIcons.facebookMessenger,
              color: Colors.blue,
              size: 23,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
          child: Container(
        color: Color.fromRGBO(85, 38, 38, 1),
        child: ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            createAppBar(
              'Shwe Thiri Khit',
            ),
            SizedBox(
              height: 5,
            ),
            createGrid(),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.affirmationsTypes.length,
              itemBuilder: (context, i) {
                final affType = controller.affirmationsTypes[i];
                return Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        affType.name,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                            wordSpacing: 1),
                      ),
                      Container(
                        height: 230,
                        child: ListView.builder(
                          //padding: EdgeInsets.all(5),
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (ctx, index) {
                            final music =
                                controller.getMusicByType(affType.id)[index];
                            return createMusic(music);
                          },
                          itemCount:
                              controller.getMusicByType(affType.id).length,
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ],
        ),
        // decoration: BoxDecoration(
        //   color: Color.fromRGBO(85,38,38, 1),
        //     gradient: LinearGradient(
        //         colors: [Colors.blueGrey.shade300, Colors.black],
        //         begin: Alignment.topLeft,
        //         end: Alignment.bottomRight,
        //         stops: [0.1, 0.3],
        //     ),
        //   ),
        //child: Text('Hello Flutter'),
        //color: Colors.orange,
      )),
    );
  }
}
