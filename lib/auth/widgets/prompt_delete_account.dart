import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kzn/auth/controller/auth_controller.dart';
import 'package:kzn/utils/extensions.dart';
import 'package:kzn/utils/utils.dart';

import '../../data/constant.dart';

Future<void> promptDeleteAccount(BuildContext context) async {
  final AuthController _authController = Get.find();
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        content: Text(
          "Are you sure you want to delete account?",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          //Delete
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _authController.deleteAccount();
            },
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                "Yes",
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ).withColor(Colors.red, elevation: 0),
          horizontalSpace(25),
          //No
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                "No",
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ).withColor(mainColor, elevation: 0),
        ],
      );
    },
  );
}
