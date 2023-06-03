import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:get/get.dart';
import 'package:kzn/model/category.dart';
import 'dart:developer' as developer;
import '../../consultant_appointant/controller/home_controller.dart';
import '../../services/database/query.dart';
import '../controller/aff_home_controller.dart';
import '../controller/affirmations_controller.dart';
import '../widgets/widgets.dart';
import 'music_playlist.dart';

class AffirmationsCategoryViewAll extends GetView<HomeController> {
  const AffirmationsCategoryViewAll({super.key});

  @override
  Widget build(BuildContext context) {
    final AffHomeController affHomeController = Get.find();

    return Scaffold(
      appBar: createAppBar('Affirmations Categories'),
      body: FirestoreQueryBuilder<Category>(
        query: affirmationsCategoryQuery,
        builder: (context, snapshot, _) {
          return GridView.builder(
            physics: const BouncingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 5 / 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: snapshot.docs.length,
            itemBuilder: (context, index) {
              if (snapshot.hasMore && index + 1 == snapshot.docs.length) {
                // Tell FirestoreQueryBuilder to try to obtain more items.
                // It is safe to call this function from within the build method.
                snapshot.fetchMore();
              }

              final category = snapshot.docs[index].data();
              return InkWell(
                onTap: () {
                  affHomeController.justPause();
                  Get.put(AffirmationsController());
                  Navigator.push(
                      context, route(MusicPlayList(category: category)));
                },
                child: Container(
                  color: Colors.blueGrey.shade400,
                  child: Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: LayoutBuilder(builder: (context, constraints) {
                            final height = constraints.maxHeight;
                            final width = constraints.maxWidth;
                            developer.log(
                                "Aff Grid's height: $height \n width: $width");
                            return CachedNetworkImage(
                              imageUrl: category.image,
                              fit: BoxFit.cover,
                              height: height,
                              width: width,
                              cacheKey: category.image,
                            );
                          })),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            category.name,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
