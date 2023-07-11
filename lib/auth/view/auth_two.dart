import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kzn/auth/controller/auth_controller.dart';
import 'package:kzn/auth/view/sms_page.dart';
import 'package:kzn/data/constant.dart';
import 'package:kzn/data/image.dart';
import 'package:kzn/utils/extensions.dart';
import 'package:get/get.dart';

import '../../utils/utils.dart';

class AuthTwo extends StatelessWidget {
  const AuthTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find();
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          25.h(),
          //Fill your number or email
          Text(
            "Fill your number or email",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          10.h(),
          //Image
          Image.asset(
            AppImage.auth_two,
            width: size.width * 0.8,
            height: size.height * 0.4,
          ),
          10.h(),
          //Button
          SizedBox(
            width: size.width * 0.8,
            height: 50,
            child: Obx(() {
              final formIndex = authController.formIndex.value;
              return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  button(
                    text: "Phone Number",
                    padding: 15,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                    onPressed: () => authController.changeFormIndex(0),
                  ).withColor(
                    formIndex == 0
                        ? selectedButtonColor
                        : unSelectedButtonColor,
                    elevation: formIndex == 0 ? 3 : 0,
                  ),
                  Expanded(
                    child: button(
                      text: "Email",
                      padding: 15,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                      onPressed: () => authController.changeFormIndex(1),
                    ).withColor(
                      formIndex == 1
                          ? selectedButtonColor
                          : unSelectedButtonColor,
                      elevation: formIndex == 1 ? 3 : 0,
                    ),
                  ),
                ],
              );
            }),
          ).withColor(
            Color(0xFFCCBFAE),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),

          10.h(),
          //TextField
          SizedBox(
            width: size.width * 0.8,
            height: 50,
            child: Obx(() {
              final formIndex = authController.formIndex.value;
              return formIndex == 0
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: TextFormField(
                            initialValue: "+95",
                            readOnly: true,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: InputBorder.none,
                            ),
                          ).withRadius(BorderRadius.all(Radius.circular(5))),
                        ),
                        15.w(),
                        Expanded(
                          flex: 4,
                          child: TextFormField(
                            controller: authController.phoneController,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: InputBorder.none,
                              hintText: "09987654321",
                            ),
                          ).withRadius(BorderRadius.all(Radius.circular(5))),
                        ),
                      ],
                    )
                  : TextFormField(
                      controller: authController.emailController,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: InputBorder.none,
                        hintText: "example@gmail.com",
                      ),
                    ).withRadius(BorderRadius.all(Radius.circular(5)));
            }),
          ),
          5.h(),
          //Error
          Obx(() {
            final formIndex = authController.formIndex.value;
            final phoneValidator = authController.phoneValidator.value!;
            final emailValidator = authController.emailValidator.value!;
            return formIndex == 0
                ? phoneValidator.fold(
                    (l) => 10.h(),
                    (r) => r.map(
                      invalid: (invalid) =>
                          ErrorText(string: "Phone number is invalid."),
                      lessThan: (lessThan) =>
                          ErrorText(string: "Phone number must be 9 digits."),
                      emptyOrNull: (emptyOrNull) =>
                          ErrorText(string: "Phone number is required."),
                    ),
                  )
                : emailValidator.fold(
                    (l) => 10.h(),
                    (r) => r.map(
                      valid: (valid) => 10.h(),
                      invalid: (invalid) =>
                          ErrorText(string: "Email is invalid."),
                      emptyOrNull: (emptyOrNull) =>
                          ErrorText(string: "Email is required."),
                    ),
                  );
          }),
          20.h(),
          //Next button
          Obx(() {
            final formIndex = authController.formIndex.value;
            return SizedBox(
              width: size.width * 0.8,
              child: button(
                onPressed: () {
                  authController.onPageChanged(1);
                },
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
            );
          }),
          10.h(),
          //or sign in with
          Text(
            "or sign in with",
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
          ),
          10.h(),
          SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /* ThirdPartyAuthButton(
                  onTap: () => log("***FB Login***"),
                  assetImage: AppImage.facebook,
                ),
                15.w(), */
                ThirdPartyAuthButton(
                  onTap: () => authController.signInWithGoogle(),
                  assetImage: AppImage.google,
                ),
                15.w(),
                ThirdPartyAuthButton(
                  onTap: () => authController.signInWithApple(),
                  assetImage: AppImage.apple,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ThirdPartyAuthButton extends StatelessWidget {
  const ThirdPartyAuthButton({
    Key? key,
    required this.onTap,
    required this.assetImage,
  }) : super(key: key);

  final void Function()? onTap;
  final String assetImage;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(100)),
        child: Image.asset(
          assetImage,
        ),
      ),
    );
  }
}
