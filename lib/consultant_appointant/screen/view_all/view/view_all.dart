import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kzn/data/constant.dart';
import 'package:kzn/utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../data/image.dart';
import '../../../../services/database/query.dart';
import '../../../controller/home_controller.dart';
import '../../../data/constant.dart';
import '../../../model/expert.dart';
import '../../../widget/general_card.dart';

class ViewAllScreen extends StatelessWidget {
  final String typeString;
  const ViewAllScreen({
    Key? key,
    required this.typeString,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController _homeController = Get.find();
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: mainThemeColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: mainThemeColor,
        elevation: 0,
        title: Text(
          "Shwe Thiri Khit",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            wordSpacing: 2,
            letterSpacing: 2,
          ),
        ),
        // centerTitle: true,
        actions: [
          SizedBox(
            width: 25,
            child: InkWell(
              onTap: () async {
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
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 5, right: 5),
        child: FirestoreQueryBuilder<ExpertModel>(
          query: expertQuery(typeString),
          builder: (context, snapshot, _) {
            // ...

            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: largerThanMobile(width) ? 3 : 2,
                crossAxisSpacing: 3,
                mainAxisSpacing: 3,
                childAspectRatio: 1,
              ),
              itemCount: snapshot.docs.length,
              itemBuilder: (context, index) {
                // if we reached the end of the currently obtained items, we try to
                // obtain more items
                if (snapshot.hasMore && index + 1 == snapshot.docs.length) {
                  // Tell FirestoreQueryBuilder to try to obtain more items.
                  // It is safe to call this function from within the build method.
                  snapshot.fetchMore();
                }

                final expertModel = snapshot.docs[index].data();

                return GeneralCard(
                  expertModel: expertModel,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
