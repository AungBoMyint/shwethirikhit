import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kzn/consultant_appointant/screen/view_all/view/view_all.dart';
import 'package:flutterfire_ui/firestore.dart';
import '../../../controller/main_controller.dart';
import '../../../services/database/query.dart';
import '../../controller/home_controller.dart';
import '../../widget/general_card.dart';
import '../../widget/pick_up.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MainController mainController = Get.find();
    int current = 0;
    final isTablet = MediaQuery.of(context).size.width > 510;
    final HomeController _homeController = Get.find();
    return ListView(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      padding: const EdgeInsets.only(bottom: 20),
      children: [
        ///Pickup
        Container(
          height: isTablet ? 500 : 220,
          margin: EdgeInsets.only(top: 40),
          child: Obx(
            () => ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 20),
              itemCount: _homeController.homeCategories.length,
              itemBuilder: (_, i) => PickUp(
                current: i,
                category: _homeController.homeCategories[i],
              ),
            ),
          ),
        ),

        ListView.builder(
          shrinkWrap: true,
          reverse: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _homeController.homeTypes.length,
          itemBuilder: (context, i) {
            final type = _homeController.homeTypes[i];
            return ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        type.name,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => ViewAllScreen(typeString: type.id));
                        },
                        child: Text(
                          "See All",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  height: 190,
                  child: Obx(
                    () => ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.only(left: 20),
                      itemCount: _homeController.getByType(type.id).length > 10
                          ? 10
                          : _homeController.getByType(type.id).length,
                      itemBuilder: (_, j) {
                        debugPrint(
                            "Type Data Length: ${_homeController.experts.length}");
                        return GeneralCard(
                          expertModel: _homeController.getByType(type.id)[j],
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          },
        ),

        /*   ///Category 1 start
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Consultant",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () {
                  mainController.importAllData();
                  /* Get.to(() => ViewAllScreen(typeString: 'Consultant')); */
                },
                child: Text(
                  "See All",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20),
          height: 190,
          child: Obx(
            () => ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 20),
              itemCount: _homeController.getByType('Consultant').length > 10
                  ? 10
                  : _homeController.getByType('Consultant').length,
              itemBuilder: (_, i) => GeneralCard(
                expertModel: _homeController.getByType('Consultant')[i],
              ),
            ),
          ),
        ),

        ///Category 1 end
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Drawing",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => ViewAllScreen(typeString: 'Drawing'));
                },
                child: Text(
                  "See All",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20),
          height: 210,
          child: Obx(
            () => ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 20),
              itemCount: _homeController.getByType('Drawing').length > 10
                  ? 10
                  : _homeController.getByType('Drawing').length,
              itemBuilder: (_, i) => GeneralCard(
                expertModel: _homeController.getByType('Drawing')[i],
              ),
            ),
          ),
        ),

        ///Category 1 start
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Fashion Tips",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => ViewAllScreen(typeString: 'Fashion Tips'));
                },
                child: Text(
                  "See All",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20),
          height: 210,
          child: Obx(() {
            debugPrint(
                "****HousingCarttypelength: ${_homeController.getByType('Fashion Tips').length}");
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 20),
              itemCount: _homeController.getByType('Fashion Tips').length > 10
                  ? 10
                  : _homeController.getByType('Fashion Tips').length,
              itemBuilder: (_, i) => GeneralCard(
                expertModel: _homeController.getByType('Fashion Tips')[i],
              ),
            );
          }),
        ),

        ///Category 1 end
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Color",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => ViewAllScreen(typeString: 'Color'));
                },
                child: Text(
                  "See All",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20),
          height: 210,
          child: Obx(() {
            debugPrint(
                "****HousingCarttypelength: ${_homeController.getByType('Color').length}");
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 20),
              itemCount: _homeController.getByType('Color').length > 10
                  ? 10
                  : _homeController.getByType('Color').length,
              itemBuilder: (_, i) => GeneralCard(
                expertModel: _homeController.getByType('Color')[i],
              ),
            );
          }),
        ),

        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "History",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => ViewAllScreen(typeString: 'History'));
                },
                child: Text(
                  "See All",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20),
          height: 210,
          child: Obx(
            () => ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 20),
              itemCount: _homeController.getByType('History').length > 10
                  ? 10
                  : _homeController.getByType('History').length,
              itemBuilder: (_, i) => GeneralCard(
                expertModel: _homeController.getByType('History')[i],
              ),
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Materials",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => ViewAllScreen(typeString: 'Materials'));
                },
                child: Text(
                  "See All",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20),
          height: 210,
          child: Obx(
            () => ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 20),
              itemCount: _homeController.getByType('Materials').length > 10
                  ? 10
                  : _homeController.getByType('Materials').length,
              itemBuilder: (_, i) => GeneralCard(
                expertModel: _homeController.getByType('Materials')[i],
              ),
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Update Information",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => ViewAllScreen(typeString: 'Update Information'));
                },
                child: Text(
                  "See All",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20),
          height: 210,
          child: Obx(
            () => ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 20),
              itemCount:
                  _homeController.getByType('Update Information').length > 10
                      ? 10
                      : _homeController.getByType('Update Information').length,
              itemBuilder: (_, i) => GeneralCard(
                expertModel: _homeController.getByType('Update Information')[i],
              ),
            ),
          ),
        ),
       */
      ],
    );
  }
}
