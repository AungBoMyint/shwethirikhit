import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:get/get.dart';
import 'package:kzn/model/category.dart';
import 'package:kzn/therapy/therapy_video.dart';
import 'package:shimmer/shimmer.dart';
import '../consultant_appointant/controller/home_controller.dart';
import '../controller/main_controller.dart';
import '../services/database/query.dart';
import 'colors.dart' as color;
import 'dart:developer' as developer;
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Therapy extends StatefulWidget {
  const Therapy({Key? key}) : super(key: key);

  @override
  _TherapyState createState() => _TherapyState();
}

class _TherapyState extends State<Therapy> {
  @override
  Widget build(BuildContext context) {
    final HomeController _homeController = Get.find();
    return SafeArea(
        child: Scaffold(
      backgroundColor: color.AppColor.homePageBackground,
      body: CustomScrollView(slivers: [
        SliverPadding(
            padding: EdgeInsets.symmetric(
              vertical: 0,
              horizontal: 30,
            ),
            sliver: SliverToBoxAdapter(
                child: Container(
              margin: EdgeInsets.only(top: 30),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: new AssetImage('assets/user.png'),
                    radius: 15,
                    // child: new Container(
                    //   padding: const EdgeInsets.all(0.0),
                    //   child: new Text('Sight'),
                    // ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Shwe Thiri Khit',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      wordSpacing: 1,
                      letterSpacing: 1,
                    ),
                  ),
                  SizedBox(
                    width: 90,
                  ),
                  SizedBox(
                    width: 40,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        alignment: Alignment.center,
                        backgroundColor:
                            MaterialStateProperty.all(Colors.transparent),
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
              ),
            ))),
        SliverPadding(
          padding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
          sliver: SliverToBoxAdapter(
            child: Row(
              children: [
                Expanded(child: Container()),
              ],
            ),
          ),
        ),
        SliverPadding(
            padding: EdgeInsets.symmetric(
              vertical: 0,
              horizontal: 30,
            ),
            sliver: SliverToBoxAdapter(
                child: Container(
              width: MediaQuery.of(context).size.width,
              height: 220,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    color.AppColor.gradientFirst.withOpacity(0.8),
                    color.AppColor.gradientSecond.withOpacity(0.9),
                  ], begin: Alignment.bottomLeft, end: Alignment.centerRight),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                      topRight: Radius.circular(80)),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(5, 10),
                        blurRadius: 20,
                        color: color.AppColor.gradientSecond.withOpacity(0.2))
                  ]),
              child: Container(
                padding: const EdgeInsets.only(left: 10, top: 10, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Image.asset('assets/intro-illustration1.png'),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Text(
                            "Increased Self-Esteem and Achieve Your True Potential.Be YOU that you've always wanted to be...",
                            style: TextStyle(
                                wordSpacing: 1,
                                letterSpacing: 1,
                                fontSize: 14,
                                color:
                                    color.AppColor.homePageContainerTextSmall),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Text(
                            "Shwe Thiri Khit",
                            style: TextStyle(
                                wordSpacing: 1,
                                letterSpacing: 1,
                                fontSize: 14,
                                color:
                                    color.AppColor.homePageContainerTextSmall),
                          ),
                        ),
                        Expanded(child: Container()),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60),
                              boxShadow: [
                                BoxShadow(
                                    color: color.AppColor.gradientFirst,
                                    blurRadius: 10,
                                    offset: Offset(4, 8))
                              ]),
                          child: InkWell(
                            onTap: () {
                              /* ///
                              TODO
                              Get.to(() => VideoInfo()); */
                            },
                            child: Icon(
                              Icons.play_circle_fill,
                              color: Colors.white,
                              size: 60,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ))),
        SliverPadding(
            padding: EdgeInsets.symmetric(
              vertical: 30,
              horizontal: 30,
            ),
            sliver: SliverToBoxAdapter(
                child: Container(
              child: Text(
                "Healing & Theraputic Activities",
                //textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18,
                    letterSpacing: 1,
                    wordSpacing: 1,
                    fontWeight: FontWeight.bold,
                    color: color.AppColor.homePageTitle),
              ),
            ))),
        SliverPadding(
          padding: EdgeInsets.symmetric(
            vertical: 0,
            horizontal: 30,
          ),
          sliver: FirestoreQueryBuilder<Category>(
            query: therapyCategoryQuery,
            builder: (context, snapshot, _) {
              if (snapshot.hasData) {
                return DataSliverGrid(
                  snapshot: snapshot,
                );
              }
              if (snapshot.hasError) {
                return ErrorWidget("Error");
              }
              return LoadingSliverGrid();
            },
          ),
        ),
      ]),
    ));
  }
}

class LoadingSliverGrid extends StatelessWidget {
  const LoadingSliverGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 1,
        ),
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.white,
              child: Container(
                height: 200,
                padding: EdgeInsets.only(bottom: 5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 3,
                          offset: Offset(5, 5),
                          color:
                              color.AppColor.gradientSecond.withOpacity(0.1)),
                      BoxShadow(
                          blurRadius: 3,
                          offset: Offset(-5, -5),
                          color: color.AppColor.gradientSecond.withOpacity(0.1))
                    ]),
              ),
            );
          },
          childCount: 10,
        ));
  }
}

class DataSliverGrid extends StatelessWidget {
  final FirestoreQueryBuilderSnapshot<Category> snapshot;
  const DataSliverGrid({
    super.key,
    required this.snapshot,
  });

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 1,
        ),
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            if (snapshot.hasMore && index + 1 == snapshot.docs.length) {
              snapshot.fetchMore();
            }

            final category = snapshot.docs[index].data();
            return InkWell(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => VideoInfo(
                    category: category,
                  ),
                ),
              ),
              child: LayoutBuilder(builder: (context, constraints) {
                final height = constraints.maxHeight;
                final width = constraints.maxWidth;
                developer
                    .log("Therapy's Image height: $height \n width: $width");
                return Container(
                  height: 200,
                  padding: EdgeInsets.only(bottom: 5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(
                          category.image,
                          cacheKey: category.image,
                          maxHeight: height.round(),
                          maxWidth: width.round(),
                        ),
                      ),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 3,
                            offset: Offset(5, 5),
                            color:
                                color.AppColor.gradientSecond.withOpacity(0.1)),
                        BoxShadow(
                            blurRadius: 3,
                            offset: Offset(-5, -5),
                            color:
                                color.AppColor.gradientSecond.withOpacity(0.1))
                      ]),
                  child: Center(
                    child: Align(
                      child: Text("",
                          style: TextStyle(
                              fontSize: 20,
                              color: color.AppColor.homePageDetail)),
                      alignment: Alignment.topCenter,
                    ),
                  ),
                );
              }),
            );
          },
          childCount: snapshot.docs.length,
        ));
  }
}

class Info {
  String? title;
  String? img;

  Info({
    this.title,
    this.img,
  });

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        title: json["title"],
        img: json["img"],
      );
}
