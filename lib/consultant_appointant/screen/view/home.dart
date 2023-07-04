import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:kzn/model/category.dart';
import 'package:shimmer/shimmer.dart';
import '../../../controller/main_controller.dart';
import '../../../model/type.dart';
import '../../../services/database/query.dart';
import '../../controller/home_controller.dart';
import '../../model/expert.dart';
import '../../widget/general_card.dart';
import '../../widget/pick_up.dart';
import '../view_all/view/view_all.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int current = 0;
    final isTablet = MediaQuery.of(context).size.width > 510;
    final HomeController _homeController = Get.find();
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        ///Pickup
        SliverToBoxAdapter(
          child: Container(
            height: isTablet ? 450 : 220,
            margin: EdgeInsets.only(top: 40),
            child: FirestoreListView<Category>(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 20),
              physics: const BouncingScrollPhysics(),
              query: homeCategoryQuery,
              loadingBuilder: (context) => SliderLoadingWidget(),
              errorBuilder: (context, error, stackTrace) => ErrorWidget(error),
              itemBuilder: (context, snapshot) {
                final category = snapshot.data();
                return PickUp(
                  current: category.order ?? 1,
                  category: category,
                );
              },
            ),
          ),
        ),
        //Type
        SliverToBoxAdapter(
          child: FirestoreListView<ItemType>(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            query: homeTypeQuery,
            /* loadingBuilder: (context) => MyCustomLoadingIndicator(), */
            errorBuilder: (context, error, stackTrace) => ErrorWidget(error),
            itemBuilder: (context, snapshot) {
              final type = snapshot.data();
              return CustomScrollView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 5),
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
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      margin: EdgeInsets.only(top: 20),
                      height: 190,
                      child: FirestoreListView<ExpertModel>(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        query: expertQuery(type.id),
                        errorBuilder: (context, error, stackTrace) =>
                            ErrorWidget(error),
                        itemBuilder: (context, snapshot) {
                          final expertModel = snapshot.data();
                          return GeneralCard(
                            expertModel: expertModel,
                          );
                        },
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

class SliderLoadingWidget extends StatelessWidget {
  const SliderLoadingWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.width > 400;

    return Shimmer.fromColors(
      child: Container(
        width: MediaQuery.of(context).size.width - 40,
        height: isTablet ? 500 : 220,
        margin: EdgeInsets.only(right: 20),
        child: Card(
          elevation: 2,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.white,
    );
  }
}
