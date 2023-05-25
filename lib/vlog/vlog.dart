import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kzn/vlog/vlog_controller.dart';
import 'package:shimmer/shimmer.dart';
import 'dart:developer';
import '../consultant_appointant/controller/home_controller.dart';
import '../data/constant.dart';
import '../model/vlog_video.dart';

class Vlog extends GetView<VlogController> {
  final HomeController _homeController = Get.find();

  /*  nestedAppBar(width, height) {
    return /* NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            backgroundColor: Color(0xFFEAE1D7),
            expandedHeight: 230,
            pinned: true,
            automaticallyImplyLeading: false,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Obx(() {
                if (controller.isLoading.value &&
                    (controller.chewieController.value == null)) {
                  return Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.white,
                    child: Container(
                      width: width,
                      color: Colors.white,
                    ),
                  );
                }
                return Chewie(
                  controller: controller.chewieController.value!,
                );
              }),
            ),
          ),
        
        ];
      },
      body:  */Column(
        children: [
          SliverAppBar(
            backgroundColor: Color(0xFFEAE1D7),
            expandedHeight: 230,
            pinned: true,
            automaticallyImplyLeading: false,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Obx(() {
                if (controller.isLoading.value &&
                    (controller.chewieController.value == null)) {
                  return Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.white,
                    child: Container(
                      width: width,
                      color: Colors.white,
                    ),
                  );
                }
                return Chewie(
                  controller: controller.chewieController.value!,
                );
              }),
            ),
          ),
        
          ListView(
            shrinkWrap: true,
            children: <Widget>[
              Container(
                // color: Colors.black,
                color: Color.fromRGBO(85, 38, 38, 1),
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Obx(() {
                        if (controller.isLoading.value &&
                            controller.selectedVideo.value == null) {
                          return Shimmer.fromColors(
                            baseColor: Colors.grey.shade300,
                            highlightColor: Colors.white,
                            child: Container(
                              height: 20,
                              width: 100,
                              color: Colors.white,
                            ),
                          );
                        }
                        return Text(
                          controller.selectedVideo.value!.title,
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Signika Negative',
                              fontWeight: FontWeight.w700,
                              fontSize: 16.0),
                        );
                      }),
                    ),
                  ],
                ),
              ),
              Obx(() {
                if (controller.isLoading.value) {
                  return Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.white,
                      child: ListView.separated(
                        separatorBuilder: (context, i) {
                          return const SizedBox(height: 10);
                        },
                        shrinkWrap: true,
                        primary: false,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          return Container(
                            width: 120.0,
                            height: 80.0,
                            color: Colors.white,
                          );
                        },
                      ));
                }
                return ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _homeController.vlogVideos.length,
                  itemBuilder: (context, index) {
                    final vlogVideo = _homeController.vlogVideos[index];
                    return getLessonTile(vlogVideo.title, vlogVideo.image, 'locked',
                        width, vlogVideo);
                  },
                );
              }),
            ],
          /* ), */
    ),
        ],
      );
  
  } */

  getLessonTile(
      String title, String img, String status, double width, VlogVideo video) {
    return InkWell(
      onTap: () => controller.changeSelectedVideo(video),
      child: Container(
        color: Color.fromRGBO(85, 38, 38, 1), // Will work
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 120.0,
              height: 80.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(img),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            Expanded(
              child: Container(
                color: Color.fromRGBO(85, 38, 38, 1),
                width: width - 120.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, bottom: 4.0, right: 8.0, left: 8.0),
                      child: Text(
                        title,
                        maxLines: 1,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                          fontFamily: 'Signika Negative',
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 0.0, right: 8.0, left: 8.0, bottom: 8.0),
                      child: Text(
                        '5 Mins',
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 12.0,
                          height: 1.6,
                          color: Colors.white,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(
                    //       top: 0.0, right: 8.0, left: 8.0, bottom: 8.0),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.start,
                    //     crossAxisAlignment: CrossAxisAlignment.center,
                    //     children: <Widget>[
                    //       Icon(
                    //         (status == 'locked') ? Icons.lock : Icons.lock_open,
                    //         size: 20.0,
                    //       ),
                    //       SizedBox(width: 3.0),
                    //       Text((status == 'locked') ? 'Locked' : 'Unlocked'),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 4,
              child: AppBar(
                excludeHeaderSemantics: true,
                backgroundColor: Color(0xFFEAE1D7),
                toolbarHeight: 230,
                /* pinned: true, */
                /* automaticallyImplyLeading: false, */
                /* leading: IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ), */
                flexibleSpace: FlexibleSpaceBarSettings(
                  currentExtent: 230,
                  maxExtent: 230,
                  minExtent: 230,
                  toolbarOpacity: 1,
                  child: FlexibleSpaceBar(
                    background: Obx(() {
                      if (controller.isLoading.value &&
                          (controller.chewieController.value == null)) {
                        return Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.white,
                          child: Container(
                            width: width,
                            color: Colors.white,
                          ),
                        );
                      }
                      return Chewie(
                        controller: controller.chewieController.value!,
                      );
                    }),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  Container(
                    // color: Colors.black,
                    color: Color.fromRGBO(85, 38, 38, 1),
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Obx(() {
                            if (controller.isLoading.value &&
                                controller.selectedVideo.value == null) {
                              return Shimmer.fromColors(
                                baseColor: Colors.grey.shade300,
                                highlightColor: Colors.white,
                                child: Container(
                                  height: 20,
                                  width: 100,
                                  color: Colors.white,
                                ),
                              );
                            }
                            return Text(
                              controller.selectedVideo.value!.title,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Signika Negative',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16.0),
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                  Obx(() {
                    if (controller.isLoading.value) {
                      return Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.white,
                          child: ListView.separated(
                            separatorBuilder: (context, i) {
                              return const SizedBox(height: 10);
                            },
                            shrinkWrap: true,
                            primary: false,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 6,
                            itemBuilder: (context, index) {
                              return Container(
                                width: 120.0,
                                height: 80.0,
                                color: Colors.white,
                              );
                            },
                          ));
                    }
                    return ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _homeController.vlogVideos.length,
                      itemBuilder: (context, index) {
                        final vlogVideo = _homeController.vlogVideos[index];
                        return getLessonTile(vlogVideo.title, vlogVideo.image,
                            'locked', width, vlogVideo);
                      },
                    );
                  }),
                ],
                /* ), */
              ),
            ),
          ],
        ),
      ),
    );
  }
}
