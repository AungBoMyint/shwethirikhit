import 'dart:developer';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';
import '../model/category.dart';
import '../model/therapy_video.dart';
import '../services/database/query.dart';
import "colors.dart" as color;
import 'therapy_controller.dart';

class VideoInfo extends StatefulWidget {
  final Category category;
  const VideoInfo({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  State<VideoInfo> createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {
  final TherapyController controller = Get.find();

  @override
  void dispose() {
    controller.reset();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(85, 38, 38, 1),
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 0.2 /* 0 */,
                  horizontal: 0.2 /* 0.w */,
                ),
                child: Obx(() {
                  return ListView(shrinkWrap: true, children: [
                    controller.selectedVideo.value == null
                        ? Container(
                            padding:
                                EdgeInsets.only(top: 30, left: 30, right: 30),
                            height: 300,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Get.back();
                                      },
                                      child: Icon(Icons.arrow_back_ios,
                                          size: 20,
                                          color: color
                                              .AppColor.secondPageIconColor),
                                    ),
                                    Expanded(child: Container()),
                                    SizedBox(
                                      width: 30,
                                      child: ElevatedButton(
                                        style: ButtonStyle(
                                          alignment: Alignment.center,
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.transparent),
                                          elevation: MaterialStateProperty
                                              .resolveWith<double>(
                                            // As you said you dont need elevation. I'm returning 0 in both case
                                            (Set<MaterialState> states) {
                                              if (states.contains(
                                                  MaterialState.disabled)) {
                                                return 0;
                                              }
                                              return 0; // Defer to the widget's default.
                                            },
                                          ),
                                        ),
                                        onPressed: () async {
                                          try {
                                            await launch(
                                                'https://m.me/selfmasterywithkhit');
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
                                SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  "Increased Self-Esteem and Achieve Your True Potential.",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color:
                                          color.AppColor.secondPageTitleColor),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Be YOU that you've always wanted to be...",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color:
                                          color.AppColor.secondPageTitleColor),
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: 90,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          gradient: LinearGradient(
                                            colors: [
                                              color.AppColor
                                                  .secondPageContainerGradient1stColor,
                                              color.AppColor
                                                  .secondPageContainerGradient2ndColor
                                            ],
                                            begin: Alignment.bottomLeft,
                                            end: Alignment.topRight,
                                          )),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.person_2_outlined,
                                            size: 20,
                                            color: color
                                                .AppColor.secondPageIconColor,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: color.AppColor
                                                    .secondPageIconColor),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                      child: Container(
                                        width: 200,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            gradient: LinearGradient(
                                              colors: [
                                                color.AppColor
                                                    .secondPageContainerGradient1stColor,
                                                color.AppColor
                                                    .secondPageContainerGradient2ndColor
                                              ],
                                              begin: Alignment.bottomLeft,
                                              end: Alignment.topRight,
                                            )),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.video_collection_outlined,
                                              size: 20,
                                              color: color
                                                  .AppColor.secondPageIconColor,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Container(
                                              width: 100,
                                              child: Text(
                                                widget.category.name,
                                                overflow: TextOverflow.fade,
                                                maxLines: 1,
                                                softWrap: false,
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: color.AppColor
                                                        .secondPageIconColor),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ))
                        :
                        //Video
                        Container(
                            padding: EdgeInsets.only(top: 5, bottom: 20),
                            child: Column(
                              children: [
                                Container(
                                    padding:
                                        EdgeInsets.only(left: 20, right: 20),
                                    margin: EdgeInsets.only(bottom: 5),
                                    child: Row(
                                      children: [
                                        InkWell(
                                            onTap: () {
                                              Get.back();
                                            },
                                            child: Icon(Icons.arrow_back_ios,
                                                size: 20,
                                                color: color.AppColor
                                                    .secondPageTopIconColor)),
                                        Expanded(child: Container()),
                                        SizedBox(
                                          width: 40,
                                          child: ElevatedButton(
                                            style: ButtonStyle(
                                              alignment: Alignment.center,
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      Colors.transparent),
                                              elevation: MaterialStateProperty
                                                  .resolveWith<double>(
                                                // As you said you dont need elevation. I'm returning 0 in both case
                                                (Set<MaterialState> states) {
                                                  if (states.contains(
                                                      MaterialState.disabled)) {
                                                    return 0;
                                                  }
                                                  return 0; // Defer to the widget's default.
                                                },
                                              ),
                                            ),
                                            onPressed: () async {
                                              try {
                                                await launch(
                                                    'https://m.me/selfmasterywithkhit');
                                              } catch (e) {
                                                print(e);
                                              }
                                            },
                                            child: FaIcon(
                                              FontAwesomeIcons
                                                  .facebookMessenger,
                                              color: Colors.blue,
                                              size: 23,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )),
                                //Video
                                Container(
                                    width: 325,
                                    height: 200,
                                    child: controller.selectedVideo.value ==
                                            null
                                        ? Container()
                                        : AspectRatio(
                                            aspectRatio: controller
                                                    .chewieController
                                                    .value
                                                    ?.videoPlayerController
                                                    .value
                                                    .aspectRatio ??
                                                0,
                                            child: controller.isLoading.value
                                                ? Shimmer.fromColors(
                                                    baseColor:
                                                        Colors.grey.shade300,
                                                    highlightColor:
                                                        Colors.white,
                                                    child: Container(
                                                      color: Colors.white,
                                                    ),
                                                  )
                                                : Chewie(
                                                    controller: controller
                                                        .chewieController
                                                        .value!,
                                                  ),
                                          )),
                                /*  _controlView(context), */
                              ],
                            )),
                    //Current Play Video Title
                    controller.selectedVideo.value == null
                        ? const SizedBox()
                        : Container(
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(85, 38, 38, 1),
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(70))),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Text(
                                      controller.selectedVideo.value?.title ??
                                          "",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Expanded(child: Container()),
                                    SizedBox(
                                      width: 20,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                  ]);
                }),
              ),
            ),
            Positioned(
              left: 0,
              top: controller.selectedVideo.value == null ? 300 : 325,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 25,
                ),
                child: Center(
                  child: LayoutBuilder(builder: (context, constraints) {
                    final height = constraints.maxHeight;
                    log("ListView.builder's Height: $height");
                    return SizedBox(
                      height: size.height,
                      width: size.width,
                      child: FirestoreListView<TherapyVideo>(
                        pageSize: 5,
                        query: therapyVideosQuery(widget.category.id),
                        itemBuilder: (context, snapshot) {
                          // Data is now typed!
                          var video = snapshot.data();
                          return _buildCard(context, video);
                        },
                      ),
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildCard(BuildContext context, TherapyVideo item) {
    return GestureDetector(
        onTap: () {
          controller.changeSelectedVideo(item);
        },
        child: Container(
          color: Color.fromRGBO(85, 38, 38, 1),
          margin: EdgeInsets.only(bottom: 20),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 80,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Color(0xFFeaeefc),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "Video ${item.order}",
                        style: TextStyle(color: Color(0xFF839fed)),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      for (int i = 0; i < 70; i++)
                        i.isEven
                            ? Container(
                                width: 3,
                                height: 1,
                                decoration: BoxDecoration(
                                    color: Color(0xFF839fed),
                                    borderRadius: BorderRadius.circular(2)),
                              )
                            : Container(
                                width: 3, height: 1, color: Colors.white)
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 18,
              ),
              Row(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: NetworkImage(item.image),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          width: 160,
                          child: Text(
                            "${item.title}",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(
                                color: Colors.white,
                                wordSpacing: 1,
                                letterSpacing: 1,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 3),
                        child: Text(
                          "${item.minutes}",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ));
  }
}

/* class Video {
  String? title;
  String? time;
  String? thumbnail;
  String? videoUrl;

  Video({
    this.title,
    this.time,
    this.thumbnail,
    this.videoUrl,
  });

  factory Video.fromJson(Map<String, dynamic> json) => Video(
        title: json["title"],
        time: json["time"],
        thumbnail: json["thumbnail"],
        videoUrl: json["videoUrl"],
      );
}
 */