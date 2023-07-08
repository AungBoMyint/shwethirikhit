import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
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
        body: LayoutBuilder(builder: (context, constrains) {
          return Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 0.2 /* 0 */,
                    /* horizontal: 0.2 /* 0.w */, */
                  ),
                  child: Obx(() {
                    return ListView(
                      children: [
                        controller.selectedVideo.value == null
                            ? Container(
                                padding: EdgeInsets.only(
                                    top: 30, left: 30, right: 30),
                                height: ResponsiveBreakpoints.of(context)
                                        .largerThan(MOBILE)
                                    ? 400
                                    : 300,
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
                                              color: color.AppColor
                                                  .secondPageIconColor),
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
                                              FontAwesomeIcons
                                                  .facebookMessenger,
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
                                          color: color
                                              .AppColor.secondPageTitleColor),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Be YOU that you've always wanted to be...",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: color
                                              .AppColor.secondPageTitleColor),
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
                                                Icons.person,
                                                size: 20,
                                                color: color.AppColor
                                                    .secondPageIconColor,
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
                                                  Icons
                                                      .video_collection_outlined,
                                                  size: 20,
                                                  color: color.AppColor
                                                      .secondPageIconColor,
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
                                        padding: EdgeInsets.only(
                                            left: 20, right: 20),
                                        /* margin: EdgeInsets.only(bottom: 5), */
                                        child: Row(
                                          children: [
                                            InkWell(
                                                onTap: () {
                                                  Get.back();
                                                },
                                                child: Icon(
                                                    Icons.arrow_back_ios,
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
                                                  elevation:
                                                      MaterialStateProperty
                                                          .resolveWith<double>(
                                                    // As you said you dont need elevation. I'm returning 0 in both case
                                                    (Set<MaterialState>
                                                        states) {
                                                      if (states.contains(
                                                          MaterialState
                                                              .disabled)) {
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
                                    Obx(() {
                                      return Container(
                                        width: ResponsiveBreakpoints.of(context)
                                                .largerThan(MOBILE)
                                            ? 800
                                            : constrains.maxWidth,
                                        height:
                                            ResponsiveBreakpoints.of(context)
                                                    .largerThan(MOBILE)
                                                ? 380
                                                : 200,
                                        child: controller.selectedVideo.value ==
                                                null
                                            ? Container()
                                            : controller.isLoading.value
                                                ? Shimmer.fromColors(
                                                    baseColor:
                                                        Colors.grey.shade300,
                                                    highlightColor:
                                                        Colors.white,
                                                    child: Container(
                                                      color: Colors.white,
                                                    ),
                                                  )
                                                : Expanded(
                                                    child: Chewie(
                                                      controller: controller
                                                          .chewieController
                                                          .value!,
                                                    ),
                                                  ),
                                      );
                                    }),
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
                                          controller
                                                  .selectedVideo.value?.title ??
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
                      ],
                    );
                  }),
                ),
              ),
              Obx(() {
                return Positioned(
                  left: 0,
                  top: controller.selectedVideo.value == null
                      ? 300
                      : ResponsiveBreakpoints.of(context).largerThan(MOBILE)
                          ? 500
                          : 330,
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
                          child: FirestoreQueryBuilder<TherapyVideo>(
                            pageSize: 5,
                            query: therapyVideosQuery(widget.category.id),
                            builder: (context, snapshot, _) {
                              return CustomScrollView(
                                slivers: [
                                  SliverList(
                                    delegate: SliverChildBuilderDelegate(
                                      (context, index) {
                                        if (snapshot.hasMore &&
                                            index + 1 == snapshot.docs.length) {
                                          // Tell FirestoreQueryBuilder to try to obtain more items.
                                          // It is safe to call this function from within the build method.
                                          snapshot.fetchMore();
                                        }

                                        // Data is now typed!
                                        var video = snapshot.docs[index].data();
                                        return _buildCard(
                                            context, video, index);
                                      },
                                      childCount: snapshot.docs.length,
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        );
                      }),
                    ),
                  ),
                );
              }),
            ],
          );
        }),
      ),
    );
  }

  _buildCard(BuildContext context, TherapyVideo item, int index) {
    final total =
        ResponsiveBreakpoints.of(context).largerThan(MOBILE) ? 200 : 70;
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
                        "Video ${index + 1}",
                        style: TextStyle(color: Color(0xFF839fed)),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      for (int i = 0; i < total; i++)
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
                            image: CachedNetworkImageProvider(
                              item.image,
                              maxHeight: 80,
                              maxWidth: 80,
                              cacheKey: item.image,
                            ),
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
                          width: ResponsiveBreakpoints.of(context)
                                  .largerThan(MOBILE)
                              ? 250
                              : 160,
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
                          "${item.minutes} Mins",
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