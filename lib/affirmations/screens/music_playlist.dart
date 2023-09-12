import 'dart:developer';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:kzn/affirmations/controller/aff_home_controller.dart';
import 'package:rive/rive.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kzn/consultant_appointant/controller/home_controller.dart';
import 'package:kzn/data/constant.dart';
import 'package:kzn/model/category.dart';

import '../../model/type.dart';
import '../../services/database/query.dart';
import '../../utils/utils.dart';
import '../controller/affirmations_controller.dart';
import '../models/music.dart';
import '../models/playerstatus.dart';

class MusicPlayList extends StatefulWidget {
  final Category? category;
  final ItemType? type;
  const MusicPlayList({
    super.key,
    this.category,
    this.type,
  });

  @override
  State<MusicPlayList> createState() => _MusicPlayListState();
}

class _MusicPlayListState extends State<MusicPlayList> {
  @override
  void dispose() {
    Get.delete<AffirmationsController>();
    super.dispose();
  }

  final AffHomeController affHomeController = Get.find();
  Widget miniPlayer(Music? music, bool isPlaying) {
    if (music == null) {
      return SizedBox();
    }
    Size deviceSize = MediaQuery.of(context).size;
    return AnimatedContainer(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: mainThemeColor,
      ),
      duration: const Duration(milliseconds: 500),
      width: deviceSize.width,
      height: 150,
      padding: const EdgeInsets.only(
        top: 15,
        left: 15,
        right: 15,
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 80,
                width: 80,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  child: Image.network(
                    music.image.replaceAll("'", ""),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              horizontalSpace(10),
              Expanded(
                child: Text(
                  music.name,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      wordSpacing: 1,
                      letterSpacing: 1),
                ),
              ),
              IconButton(
                  onPressed: () => affHomeController.setSelectedMusic(music),
                  icon: isPlaying
                      ? Icon(Icons.pause, color: Color.fromRGBO(85, 38, 38, 1))
                      : Icon(Icons.play_arrow,
                          color: Color.fromRGBO(85, 38, 38, 1))),
            ],
          ),
          verticalSpace(10),
          Expanded(child: audioProgressBar()),
        ],
      ),
    );
  }

  Widget audioProgressBar() {
    return Obx(
      () {
        final theme = Theme.of(Get.context!);
        final progress = affHomeController.streamPosition.value;
        final buffered = affHomeController.streamBuffer.value;
        final total = affHomeController.streamDuration.value;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: ProgressBar(
            barHeight: 2,
            thumbRadius: 8,
            progress: progress,
            timeLabelPadding: 5,
            thumbColor: Color.fromRGBO(85, 38, 38, 1),
            progressBarColor: Color.fromRGBO(85, 38, 38, 1),
            baseBarColor: Colors.white,
            bufferedBarColor: Color.fromRGBO(85, 38, 38, 1).withOpacity(0.5),
            buffered: buffered,
            total: total,
            timeLabelTextStyle: TextStyle(
              color: Color.fromRGBO(85, 38, 38, 1),
            ),
            onSeek: (duration) {
              affHomeController.player.seek(duration);
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();
    final AffHomeController afController = Get.find();
    final query = widget.category == null
        ? affirmationsTypeMusicsQuery(widget.type!.id)
        : affirmationsCategoryMusicsQuery(widget.category!.id);
    Future<int> musicCount() async {
      final result = await query.get();
      return result.size;
    }

    Future<Music?> getFirstMusic() async {
      final result = await query.get();
      if (result.docs.isNotEmpty) {
        return result.docs.first.data();
      }
      return null;
    }

    final size = MediaQuery.of(context).size;

    return Scaffold(
      /* appBar: createAppBar(""), */
      backgroundColor: Color.fromRGBO(85, 38, 38, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(85, 38, 38, 1),
        automaticallyImplyLeading: true,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: Column(
          /* shrinkWrap: true, */
          /* physics: NeverScrollableScrollPhysics(), */
          children: [
            SizedBox(
              height: size.width > 415 ? 180 : 100,
              child: LayoutBuilder(builder: (context, constraints) {
                final width = constraints.maxWidth;
                return Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: SizedBox(
                    width: width,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //Category or Tag Image
                        Container(
                          width: size.width > 415 ? width / 4 : width / 3,
                          height: size.width > 415 ? 180 : 100,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              image: DecorationImage(
                                image: CachedNetworkImageProvider(
                                  widget.category == null
                                      ? musicCover
                                      : widget.category!.image,
                                  cacheKey: widget.category == null
                                      ? musicCover
                                      : widget.category!.image,
                                ),
                                fit: BoxFit.cover,
                                /*  width: width / 3,
                              height: 150, */
                              )),
                        ),
                        const SizedBox(width: 20),
                        //Right Text
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.category?.name ??
                                    widget.type?.name ??
                                    "",
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                  wordSpacing: 1,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 10),
                              FutureBuilder<int>(
                                future: musicCount(),
                                builder:
                                    (context, AsyncSnapshot<int> snapshot) {
                                  return Text(
                                    "${snapshot.data} songs",
                                    style: TextStyle(color: Colors.white),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
            verticalSpace(10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: SizedBox(
                  width: 200,
                  child: FutureBuilder<Music?>(
                    future: getFirstMusic(),
                    builder: (context, AsyncSnapshot<Music?> snapshot) {
                      if (snapshot.hasData && !(snapshot.data == null)) {
                        return Obx(() {
                          final music = afController.selectedMusic.value;
                          final isPlaying = afController.isPlaying.value;
                          return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: mainThemeColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                            ),
                            onPressed: () {
                              if (music == null) {
                                afController.setSelectedMusic(snapshot.data!);
                              } else {
                                afController.setSelectedMusic(music);
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  isPlaying
                                      ? Icon(
                                          FontAwesomeIcons.pause,
                                          color: secondMainThemeColor,
                                        )
                                      : Icon(
                                          FontAwesomeIcons.play,
                                          color: secondMainThemeColor,
                                        ),
                                  const SizedBox(width: 10),
                                  Text("Play",
                                      style: TextStyle(
                                        color: secondMainThemeColor,
                                      )),
                                ],
                              ),
                            ),
                          );
                        });
                      }
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: logoColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                FontAwesomeIcons.play,
                                color: Colors.white,
                              ),
                              const SizedBox(width: 10),
                              Text("Play",
                                  style: TextStyle(
                                    color: Colors.white,
                                  )),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Obx(() {
                /* final state = afController.playerStatus.value!
                    .getOrElse(() => PlayerStatus.nothing()); */
                final selectedMusic = afController.selectedMusic.value;
                final isPlaying = afController.isPlaying.value;
                return FirestoreQueryBuilder<Music>(
                  query: query,
                  builder: (context, snapshot, _) {
                    return CustomScrollView(
                      slivers: [
                        SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              if (snapshot.hasMore &&
                                  index + 1 == snapshot.docs.length) {
                                snapshot.fetchMore();
                              }

                              final music = snapshot.docs[index].data();
                              final isSelected = !(selectedMusic == null) &&
                                  (selectedMusic.id == music.id);
                              return LayoutBuilder(
                                  builder: (context, constraints) {
                                final width = constraints.maxWidth;
                                return InkWell(
                                  onTap: () {
                                    afController.setSelectedMusic(music);
                                    /*    //show bottom sheet
                                    Get.bottomSheet(
                                      Obx(() {
                                        final music = affHomeController
                                            .selectedMusic.value;
                                        final isPlaying =
                                            affHomeController.isPlaying.value;
                                        return miniPlayer(music, isPlaying);
                                      }),
                                    );
                                   */
                                  },
                                  child: Container(
                                    width: width,
                                    padding: EdgeInsets.symmetric(
                                      vertical: 10,
                                      horizontal: 10,
                                    ),
                                    /* color: isSelected
                                        ? Colors.white
                                        : Color(0xFFEAE1D7), */
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        //Leading Number
                                        Text(
                                          "( ${index + 1} )",
                                          style: TextStyle(
                                              color: Colors.white,
                                              /*   fontSize: 18,
                                              fontWeight: FontWeight.bold, */
                                              letterSpacing: 1,
                                              wordSpacing: 1),
                                        ),
                                        horizontalSpace(20),
                                        //Music Title
                                        Expanded(
                                            child: Text(
                                          music.name,
                                          style: TextStyle(
                                              color: Colors.white,
                                              /*  fontSize: 18, */
/*                                               fontWeight: FontWeight.bold,
 */
                                              letterSpacing: 1,
                                              wordSpacing: 1),
                                        )),
                                        horizontalSpace(20),
                                        /* //Play Icon and animation
                                        isPlaying &&
                                                !(selectedMusic == null) &&
                                                (selectedMusic.id == music.id)
                                            ? playingAnimation()
                                            : pauseImage(), */
                                      ],
                                    ),
                                  ),
                                );
                              });
                            },
                            childCount: snapshot.docs.length,
                          ),
                        ),
                      ],
                    );
                  },
                );
              }),
            )
          ],
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Obx(() {
            final music = affHomeController.selectedMusic.value;
            final isPlaying = affHomeController.isPlaying.value;
            return miniPlayer(music, isPlaying);
          }),
        ],
      ),
    );
  }
}

linerProgress() => SizedBox(
      height: 5,
      child: LinearProgressIndicator(
          backgroundColor: Color(0xFFEAE1D7), color: logoColor),
    );
circularProgress() => SizedBox(
      height: 15,
      width: 15,
      child: CircularProgressIndicator(color: logoColor),
    );

pauseImage() => Image.asset(playIcon, width: 15, height: 15);
playingAnimation() => SizedBox(
    width: 30,
    height: 30,
    child: RiveAnimation.asset(
      soundWaveAnimation,
      fit: BoxFit.cover,
    ));
