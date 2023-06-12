import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kzn/data/image.dart';
import 'package:kzn/utils/extensions.dart';
import 'package:kzn/utils/utils.dart';

import '../controller/auth_controller.dart';

class AuthOne extends StatelessWidget {
  const AuthOne({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find();
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          25.h(),
          //What's your name
          Text(
            "What's your name?",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          10.h(),
          //Image
          Image.asset(
            AppImage.auth_one,
            width: size.width * 0.8,
            height: size.height * 0.5,
          ),
          20.h(),
          //TextField
          SizedBox(
            width: size.width * 0.8,
            height: 50,
            child: TextFormField(
              controller: authController.nameController,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: InputBorder.none,
                hintText: "Your name",
              ),
            ),
          ),
          5.h(),
          //Error
          Obx(() {
            final stringValidator = authController.stringValidator.value!;
            return stringValidator.fold(
              (l) => 10.h(),
              (r) => r.map(
                valid: (valid) => 10.h(),
                emptyOrNull: (emptyOrNull) =>
                    ErrorText(string: "Name is required."),
                tooShort: (tooShort) =>
                    ErrorText(string: "Your name is too short."),
              ),
            );
          }),
          20.h(),
          //Next button
          SizedBox(
            width: size.width * 0.8,
            child: ElevatedButton(
              onPressed: () => authController.onPageChanged(1),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("Next"),
              ),
            ).withColor(
              Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}
