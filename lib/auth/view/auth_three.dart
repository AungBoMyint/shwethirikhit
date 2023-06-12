import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kzn/auth/controller/auth_controller.dart';
import 'package:kzn/auth/view/auth_one.dart';
import 'package:kzn/data/constant.dart';
import 'package:kzn/utils/extensions.dart';

import '../../utils/utils.dart';

class AuthThree extends StatelessWidget {
  const AuthThree({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find();
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          25.h(),
          //Fill your number or email
          Text(
            "I am _____ years of age.",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          25.h(),
          Expanded(child: Obx(() {
            final chooseOne = authController.chooseOne.value;
            return Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: ListView.separated(
                itemCount: yearsList.length,
                separatorBuilder: (context, index) {
                  return 10.h();
                },
                itemBuilder: (context, index) {
                  final year = yearsList[index];
                  return ListTile(
                    selectedColor: Colors.white,
                    onTap: () => authController.changeChooseOne(year),
                    title: Text(
                      year,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    trailing: chooseOne == year
                        ? CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.red,
                            child: Icon(
                              FontAwesomeIcons.check,
                              color: Colors.white,
                            ),
                          )
                        : EmptyWidget(),
                  ).withColor(
                    Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  );
                },
              ),
            );
          })),
          5.h(),
          //Error
          Obx(() {
            final chooseOneValidator = authController.chooseOneValidator.value!;
            return chooseOneValidator.fold(
              (l) => 10.h(),
              (r) => r.map(
                  needToChoose: (needToChoose) =>
                      ErrorText(string: "You need to choose one.")),
            );
          }),
          20.h(),
          //Next button
          SizedBox(
            width: size.width * 0.8,
            child: button(
              onPressed: () => authController.onPageChanged(3),
              text: "Next",
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
    );
  }
}
