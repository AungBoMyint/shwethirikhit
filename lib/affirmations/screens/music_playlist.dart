import 'dart:developer';
import 'package:rive/rive.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kzn/consultant_appointant/controller/home_controller.dart';
import 'package:kzn/data/constant.dart';
import 'package:kzn/model/category.dart';

import '../../model/type.dart';
import '../controller/affirmations_controller.dart';
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

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();
    final AffirmationsController afController = Get.find();
    final musics = widget.category == null
        ? controller.getMusicByType(widget.type!.id)
        : controller.getMusicByCategory(widget.category!.id);
    return Scaffold(
      /* appBar: createAppBar(""), */
      backgroundColor: Color(0xFFEAE1D7),
      appBar: AppBar(
        backgroundColor: Color(0xFFEAE1D7),
        automaticallyImplyLeading: true,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            SizedBox(
              height: 150,
              child: LayoutBuilder(builder: (context, constraints) {
                final width = constraints.maxWidth;
                return Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //Category or Tag Image
                      SizedBox(
                        width: width / 2,
                        height: 150,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          child: Image.network(
                            widget.category == null
                                ? musicCover
                                : widget.category!.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      //Right Text
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.category?.name ?? widget.type?.name ?? "",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                              wordSpacing: 1,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "${musics.length} songs",
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: SizedBox(
                  width: 200,
                  child: Obx(() {
                    final music = afController.selectedMusic.value;
                    final isPlaying = afController.playerStatus.value!
                            .getOrElse(() => PlayerStatus.nothing()) ==
                        PlayerStatus.playing();
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: logoColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                      onPressed: () {
                        if (music == null) {
                          afController.setSelectedMusic(musics.first);
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
                                    color: Colors.white,
                                  )
                                : Icon(
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
                  }),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Obx(() {
              final state = afController.playerStatus.value!
                  .getOrElse(() => PlayerStatus.nothing());
              final selectedMusic = afController.selectedMusic.value;

              return ListView.separated(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: musics.length,
                separatorBuilder: (context, index) {
                  final currentMusic = musics[index];
                  final isSelected = !(selectedMusic == null) &&
                      (selectedMusic.id == currentMusic.id);
                  if (isSelected && state == PlayerStatus.loading()) {
                    return linerProgress();
                  }
                  return const Divider();
                },
                itemBuilder: (context, index) {
                  final music = musics[index];
                  final isSelected = !(selectedMusic == null) &&
                      (selectedMusic.id == music.id);
                  return Container(
                    color: isSelected ? Colors.white : Color(0xFFEAE1D7),
                    child: ListTile(
                      /* selected: isSelected,
                      selectedColor: Colors.white, */
                      onTap: () => afController.setSelectedMusic(music),
                      leading: Text("${index + 1}"),
                      /* isPlaying
                          ? Image.asset("assets/animations/cd.gif")
                          : Text("${index + 1}"),*/
                      title: Text(music.name),
                      subtitle: Text(music.desc),
                      trailing: afController.playerStatus.value!.fold(
                        (l) => const SizedBox(),
                        (r) => r.map(
                          loading: (v) => !(selectedMusic == null) &&
                                  (selectedMusic.id == music.id)
                              ? circularProgress()
                              : pauseImage(),
                          playing: (v) => !(selectedMusic == null) &&
                                  (selectedMusic.id == music.id)
                              ? playingAnimation()
                              : pauseImage(),
                          pause: (v) => pauseImage(),
                          nothing: (v) => pauseImage(),
                        ),
                      ),
                    ),
                  );
                },
              );
            })
          ],
        ),
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
