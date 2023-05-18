import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../consultant_appointant/controller/home_controller.dart';
import '../../model/category.dart';
import '../models/music.dart';
import '../widgets/widgets.dart';
import 'category_viewall.dart';
import 'music_playlist.dart';

class AffHome extends GetView<HomeController> {
  Function _miniPlayer;
  AffHome(this._miniPlayer); // Dart Constructor ShortHand
  // const Home({Key? key}) : super(key: key);
  Widget createCategory(Category category, BuildContext context) {
    return InkWell(
      onTap: () =>
          Navigator.push(context, route(MusicPlayList(category: category))),
      child: Container(
        color: Colors.blueGrey.shade400,
        child: Row(
          children: [
            Expanded(
                flex: 2,
                child: Image.network(category.image, fit: BoxFit.fitHeight)),
            Expanded(
              child: Text(
                category.name,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(width: 10),
          ],
        ),
      ),
    );
  }

  List<Widget> createListOfCategories(BuildContext context) {
    // Convert Data to Widget Using map function
    List<Widget> categories = controller.affirmationsCategories.isNotEmpty
        ? List.generate(6, (index) {
            return createCategory(
                controller.affirmationsCategories[index], context);
          }).toList()
        : [];
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

  Widget createGrid(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
      height: 250,
      child: GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        childAspectRatio: 5 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: createListOfCategories(context),
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
            Align(
              alignment: Alignment.bottomRight,
              child: IconButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (c) => AffirmationsCategoryViewAll(),
                  ),
                ),
                icon: Icon(
                  FontAwesomeIcons.chevronRight,
                  color: Colors.white,
                  size: 15,
                ),
              ),
            ),
            createGrid(context),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: TextButton(
                              onPressed: () => Navigator.push(
                                  context, route(MusicPlayList(type: affType))),
                              child: Text(
                                "See All",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    letterSpacing: 1,
                                    wordSpacing: 1),
                              ),
                            ),
                          ),
                        ],
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
