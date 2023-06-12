import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:email_validator/email_validator.dart' as package;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kzn/auth/validator/phone_validator.dart';

import '../validator/email_validator.dart' as own;
import '../validator/string_validator.dart';

class AuthController extends GetxController {
  var formIndex = 0.obs;
  Rxn<Either<None, StringValidator>> stringValidator =
      Rxn<Either<None, StringValidator>>(left(None()));
  Rxn<Either<None, PhoneValidator>> phoneValidator =
      Rxn<Either<None, PhoneValidator>>(left(None()));
  Rxn<Either<None, own.EmailValidator>> emailValidator =
      Rxn<Either<None, own.EmailValidator>>(left(None()));
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  PageController pageController = PageController(initialPage: 0);

  void validateString(String value) {
    if (value.isEmpty) {
      stringValidator.value = right(StringValidator.emptyOrNull());
    } else {
      stringValidator.value = left(None());
    }
  }

  void validatePhone(String value) {
    if (value.isEmpty) {
      phoneValidator.value = right(PhoneValidator.emptyOrNull());
    } else if (value.length != 9) {
      phoneValidator.value = right(PhoneValidator.lessThan());
    } else {
      phoneValidator.value = left(None());
    }
  }

  void validateEmail(String value) {
    if (value.isEmpty) {
      emailValidator.value = right(own.EmailValidator.emptyOrNull());
    } else if (package.EmailValidator.validate(value) == false) {
      emailValidator.value = right(own.EmailValidator.invalid());
    } else {
      emailValidator.value = left(None());
    }
  }

  void changeFormIndex(int v) => formIndex.value = v;
  void onPageChanged(int v) {
    log("Change Page");
    switch (v) {
      case 1:
        validateString(nameController.text);
        if (stringValidator.value?.isLeft() == true) {
          pageController.jumpToPage(v);
          return;
        }
        break;
      case 2:
        formIndex == 0
            ? validatePhone(phoneController.text)
            : validateEmail(emailController.text);
        if ((formIndex == 0
                ? phoneValidator.value!.isLeft()
                : emailValidator.value!.isLeft()) ==
            true) {
          pageController.jumpToPage(v);
          return;
        }
        break;
      default:
    }
    /* pageController.animateTo(
      v + 0.0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    ); */
  }
}
