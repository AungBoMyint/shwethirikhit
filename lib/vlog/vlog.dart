import 'package:cached_network_image/cached_network_image.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kzn/utils/utils.dart';
import 'package:kzn/vlog/vlog_controller.dart';
import 'package:shimmer/shimmer.dart';
import '../consultant_appointant/controller/home_controller.dart';
import '../data/constant.dart';
import '../model/vlog_video.dart';

class Vlog extends StatefulWidget {
  const Vlog({super.key});

  @override
  State<Vlog> createState() => _VlogState();
}

class _VlogState extends State<Vlog> {
  @override
  void initState() {
    Get.put(VlogController());
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<VlogController>();
    super.dispose();
  }

  final HomeController _homeController = Get.find();
  getLessonTile(
      String title, String img, String status, double width, VlogVideo video) {
    final VlogController controller = Get.find();
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
                  image: CachedNetworkImageProvider(img,
                      maxHeight: 80, maxWidth: 120, cacheKey: img),
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
                        '${video.minutes} Mins',
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 12.0,
                          height: 1.6,
                          color: Colors.white,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
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
    final size = MediaQuery.of(context).size;
    double width = size.width;
    final VlogController controller = Get.find();
    return SafeArea(
      child: Scaffold(
        backgroundColor: logoColor,
        body: Column(
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              /* Expanded(
              flex: largerThanMobile(width) ? 4 : 3, */
              child: AppBar(
                excludeHeaderSemantics: true,
                backgroundColor: Color(0xFFEAE1D7),
                toolbarHeight: 230,
                flexibleSpace: FlexibleSpaceBarSettings(
                  currentExtent: 230,
                  maxExtent: 230,
                  minExtent: 230,
                  toolbarOpacity: 1,
                  child: FlexibleSpaceBar(
                    background: Obx(() {
                      if (controller.isLoading.value ||
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
            verticalSpace(10),
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
            Expanded(
              flex: 6,
              child: CustomScrollView(
                slivers: <Widget>[
                  //Selected Video Title
                  /*  SliverToBoxAdapter(
                    child: Padding(
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
                  ),
 */
                  SliverList(
                      delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final vlogVideo = _homeController.vlogVideos[index];
                      return getLessonTile(vlogVideo.title, vlogVideo.image,
                          'locked', width, vlogVideo);
                    },
                    childCount: _homeController.vlogVideos.length,
                  )),
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
