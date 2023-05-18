import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kzn/consultant_appointant/controller/home_controller.dart';
import 'package:kzn/data/constant.dart';
import 'package:kzn/model/category.dart';

import '../../model/type.dart';
import '../controller/affirmations_controller.dart';
import '../widgets/widgets.dart';

class MusicPlayList extends GetView<HomeController> {
  final Category? category;
  final ItemType? type;
  const MusicPlayList({
    super.key,
    this.category,
    this.type,
  });

  @override
  Widget build(BuildContext context) {
    final AffirmationsController afController = Get.find();
    final musics = category == null
        ? controller.getMusicByType(type!.id)
        : controller.getMusicByCategory(category!.id);
    return Scaffold(
      /* appBar: createAppBar(""), */
      appBar: AppBar(
        backgroundColor: Colors.white,
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
                            category == null ? musicCover : category!.image,
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
                            category?.name ?? type?.name ?? "",
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
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
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
                            color: Colors.black,
                          ),
                          const SizedBox(width: 10),
                          Text("Play",
                              style: TextStyle(
                                color: Colors.black,
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Obx(() {
              final selectedMusic = afController.selectedMusic.value;
              return ListView.separated(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: musics.length,
                separatorBuilder: (context, index) {
                  final currentMusic = musics[index];
                  if (!(selectedMusic == null) &&
                      (selectedMusic.id == currentMusic.id &&
                          afController.playerLoading.value)) {
                    return SizedBox(
                      height: 15,
                      child: LinearProgressIndicator(),
                    );
                  }
                  return const SizedBox(height: 15);
                },
                itemBuilder: (context, index) {
                  final music = musics[index];
                  return ListTile(
                    onTap: () => afController.setSelectedMusic(music),
                    leading: Text("${index + 1}"),
                    title: Text(music.name),
                    subtitle: Text(music.desc),
                    trailing: Text("${index + 2}"),
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
