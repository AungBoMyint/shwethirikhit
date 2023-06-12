import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:kzn/auth/controller/auth_controller.dart';
import 'package:kzn/auth/view/auth_one.dart';
import 'package:kzn/auth/view/auth_two.dart';

import '../../therapy/colors.dart';

class AuthPage extends StatefulWidget {
  static final routeName = "authPage";
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final pages = [
    AuthOne(),
    AuthTwo(),
  ];
  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find();
    return Scaffold(
      backgroundColor: AppColor.homePageBackground,
      body: SafeArea(
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: authController.pageController,
          children: pages,
          onPageChanged: authController.onPageChanged,
        ),
      ),
    );
  }
}
