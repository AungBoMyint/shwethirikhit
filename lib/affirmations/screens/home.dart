import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kzn/data/constant.dart';
import 'package:kzn/model/type.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:developer' as developer;
import '../../consultant_appointant/controller/home_controller.dart';
import '../../data/image.dart';
import '../../model/category.dart';
import '../../services/database/query.dart';
import '../../utils/utils.dart';
import '../controller/aff_home_controller.dart';
import '../controller/affirmations_controller.dart';
import '../models/music.dart';
import '../widgets/widgets.dart';
import 'category_viewall.dart';
import 'music_playlist.dart';

class AffHome extends GetView<HomeController> {
  final AffHomeController affHomeController = Get.find();
  Function _miniPlayer;
  AffHome(this._miniPlayer); // Dart Constructor ShortHand
  // const Home({Key? key}) : super(key: key);
  Widget createCategory(Category category, BuildContext context) {
    return InkWell(
      onTap: () {
        affHomeController.justPause();
        Get.put(AffirmationsController());
        Navigator.push(context, route(MusicPlayList(category: category)));
      },
      child: Container(
        color: mainThemeColor,
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: LayoutBuilder(builder: (context, constraints) {
                final height = constraints.maxHeight;
                final width = constraints.maxWidth;
                developer.log("Aff Grid's height: $height \n width: $width");
                return CachedNetworkImage(
                  imageUrl: category.image,
                  fit: BoxFit.fitHeight,
                  height: height,
                  width: width,
                  cacheKey: category.image,
                );
              }),
            ),
            Expanded(
              child: Text(
                category.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(width: 10),
          ],
        ),
      ),
    );
  }

  Widget createMusic(Music music) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: SizedBox(
        width: 160,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 160,
              width: 160,
              child: InkWell(
                onTap: () {
                  affHomeController.setSelectedMusic(music);
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: music.image.replaceAll("'", ""),
                    fit: BoxFit.fitHeight,
                    height: 160,
                    width: 160,
                    cacheKey: music.image.replaceAll("'", ""),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Text(
                music.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.white, letterSpacing: 0.5, wordSpacing: 0.5),
              ),
            ),
            Text(music.desc,
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 0.5,
                  wordSpacing: 0.5,
                ))
          ],
        ),
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
          width: 60,
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
            child: Image.asset(
              AppImage.messenger,
              /* width: 23,
                  height: 23, */
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Container(
        color: Color.fromRGBO(85, 38, 38, 1),
        child: CustomScrollView(
          shrinkWrap: true,
          /* physics: const NeverScrollableScrollPhysics(), */
          slivers: [
            SliverToBoxAdapter(
              child: createAppBar(
                'Shwe Thiri Khit',
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 5,
              ),
            ),
            SliverToBoxAdapter(
              child: Align(
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
            ),
            //Category
            SliverToBoxAdapter(
              child: FirestoreQueryBuilder<Category>(
                query: affirmationsCategoryQuery,
                builder: (context, snapshot, _) {
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: largerThanMobile(width) ? 3 : 2,
                      childAspectRatio: 5 / 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount:
                        snapshot.docs.length > 6 ? 6 : snapshot.docs.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      if (snapshot.hasMore &&
                          index + 1 == snapshot.docs.length) {
                        // Tell FirestoreQueryBuilder to try to obtain more items.
                        // It is safe to call this function from within the build method.
                        snapshot.fetchMore();
                      }

                      final category = snapshot.docs[index].data();

                      return createCategory(category, context);
                    },
                  );
                },
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 10,
              ),
            ),
            //Music List
            SliverToBoxAdapter(
              child: FirestoreListView<ItemType>(
                shrinkWrap: true,
                loadingBuilder: (_) => LoadingWidget(),
                physics: const NeverScrollableScrollPhysics(),
                query: affirmationsTypeQuery,
                errorBuilder: (context, error, stackTrace) =>
                    ErrorWidget(error),
                itemBuilder: (context, snapshot) {
                  final affType = snapshot.data();
                  return Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                affType.name,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1,
                                    wordSpacing: 1),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: TextButton(
                                onPressed: () {
                                  affHomeController.justPause();
                                  Get.put(AffirmationsController());
                                  Navigator.push(context,
                                      route(MusicPlayList(type: affType)));
                                },
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
                          height: 260,
                          child: FirestoreListView<Music>(
                            query: affirmationsTypeMusicsQuery(affType.id),
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            errorBuilder: (context, error, stackTrace) =>
                                ErrorWidget(error),
                            itemBuilder: (context, snapshot) {
                              final music = snapshot.data();
                              return createMusic(music);
                            },
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(85, 38, 38, 1),
    );
  }
}
