import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kzn/auth/controller/auth_controller.dart';
import 'package:kzn/auth/validator/multiple_choose_validator.dart';
import 'package:kzn/auth/view/auth_one.dart';
import 'package:kzn/data/constant.dart';
import 'package:kzn/utils/extensions.dart';

import '../../utils/utils.dart';

class AuthFour extends StatelessWidget {
  const AuthFour({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find();
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.8,
      height: size.height,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            25.h(),
            //Fill your number or email
            Text(
              "What areas you would like to improve in yourself?.",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ).withPadding(
              const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
            ),
            8.h(),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Choose one or more...",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ).withPadding(
                const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
              ),
            ),
            25.h(),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: areasList.length,
                shrinkWrap: true,
                separatorBuilder: (context, index) {
                  return 10.h();
                },
                itemBuilder: (context, index) {
                  final area = areasList[index];
                  return ListTile(
                    selectedColor: Colors.white,
                    onTap: () => authController.changeMultipleChoose(area),
                    title: Text(
                      area,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    trailing: Obx(() {
                      final multipleChoose = authController.multipleChoose;

                      return multipleChoose.contains(area)
                          ? CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.red,
                              child: Icon(
                                FontAwesomeIcons.check,
                                color: Colors.white,
                              ),
                            )
                          : EmptyWidget();
                    }),
                  ).withColor(
                    Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  );
                },
              ),
            ),
            5.h(),
            //Error
            Obx(() {
              final multipleChooseValidator =
                  authController.multipleChooseValidator.value!;
              return multipleChooseValidator.fold(
                (l) => 10.h(),
                (r) => r.map(
                    lessThan: (lessThan) =>
                        ErrorText(string: "You need to choose three or more."),
                    needToChoose: (needToChoose) => ErrorText(
                        string: "You need to choose at least 3 areas.")),
              );
            }),
            20.h(),
            //Next button
            SizedBox(
              width: size.width * 0.8,
              child: button(
                onPressed: () => authController.onPageChanged(4),
                text: "Continue",
                padding: 20,
              ).withColor(
                Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
            15.h(),
          ],
        ),
      ),
    );
  }
}
