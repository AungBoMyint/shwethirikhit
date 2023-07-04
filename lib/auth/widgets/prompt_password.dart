import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kzn/auth/controller/auth_controller.dart';
import 'package:kzn/data/constant.dart';
import 'package:kzn/utils/extensions.dart';

import '../../utils/utils.dart';

promptPasswordForm(BuildContext context) {
  final size = MediaQuery.of(context).size;
  showGeneralDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.black.withOpacity(0.5),
    pageBuilder: (context, __, ___) {
      return Center(
          child: SizedBox(
        height: size.height * 0.25,
        width: size.width * 0.8,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: PasswordForm(),
            ),
          ),
        ),
      ));
    },
  );
}

class PasswordForm extends StatefulWidget {
  const PasswordForm({
    super.key,
  });

  @override
  State<PasswordForm> createState() => _PasswordFormState();
}

class _PasswordFormState extends State<PasswordForm> {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController passwordTextController = TextEditingController();

  @override
  void dispose() {
    passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AuthController _authController = Get.find();
    var dropDownBorder = const OutlineInputBorder(
        borderSide: BorderSide(
      color: Colors.black,
    ));
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              "Please enter your password!",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            verticalSpace(15),
            TextFormField(
              validator: (v) => stringValidator("Password", v),
              controller: passwordTextController,
              decoration: InputDecoration(
                border: dropDownBorder,
                disabledBorder: dropDownBorder,
                focusedBorder: dropDownBorder,
                enabledBorder: dropDownBorder,
                labelText: "Password",
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
            ),
            verticalSpace(25),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState?.validate() == true) {
                  Navigator.pop(context);
                  _authController.startEmailSignIn(
                    password: passwordTextController.text,
                  );
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  "Submit",
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ).withColor(mainColor),
          ],
        ),
      ),
    );
  }
}
