import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../../consultant_appointant/controller/home_controller.dart';
import '../widgets/widgets.dart';

class AffirmationsCategoryViewAll extends GetView<HomeController> {
  const AffirmationsCategoryViewAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar('Affirmations Categories'),
      body: GridView.builder(
        physics: const BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 5 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          final category = controller.affirmationsCategories[index];
          return Container(
            color: Colors.blueGrey.shade400,
            child: Row(
              children: [
                Expanded(
                    flex: 2,
                    child: Image.network(category.image, fit: BoxFit.cover)),
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
          );
        },
        itemCount: controller.affirmationsCategories.length,
      ),
    );
  }
}
