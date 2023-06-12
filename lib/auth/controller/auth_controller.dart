import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:email_validator/email_validator.dart' as package;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kzn/auth/validator/multiple_choose_validator.dart';
import 'package:kzn/auth/validator/phone_validator.dart';
import 'package:kzn/utils/utils.dart';
import 'package:kzn/vlog/vlog_controller.dart';

import '../../ui/routes/main_route.dart';
import '../validator/choose_one_validator.dart';
import '../validator/email_validator.dart' as own;
import '../validator/string_validator.dart';

class AuthController extends GetxController {
  final VlogController vlogController = Get.find();
  var formIndex = 0.obs;

  Rxn<Either<None, StringValidator>> stringValidator =
      Rxn<Either<None, StringValidator>>(left(None()));
  Rxn<Either<None, PhoneValidator>> phoneValidator =
      Rxn<Either<None, PhoneValidator>>(left(None()));
  Rxn<Either<None, own.EmailValidator>> emailValidator =
      Rxn<Either<None, own.EmailValidator>>(left(None()));
  Rxn<Either<None, ChooseOneValidator>> chooseOneValidator =
      Rxn<Either<None, ChooseOneValidator>>(left(None()));
  Rxn<Either<None, MultipleChooseValidator>> multipleChooseValidator =
      Rxn<Either<None, MultipleChooseValidator>>(left(None()));
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  var chooseOne = "".obs;
  RxList<String> multipleChoose = <String>[].obs;

  PageController pageController = PageController(initialPage: 0);

  void validateString(String value) {
    if (value.isEmpty) {
      stringValidator.value = right(StringValidator.emptyOrNull());
    } else if (value.removeAllWhitespace.length < 4) {
      stringValidator.value = right(StringValidator.tooShort());
    } else {
      stringValidator.value = left(None());
    }
  }

  void validatePhone(String value) {
    RegExp regex = RegExp(r'^09[9|6|2|7|4][0-9]{8}$');

    if (value.isEmpty) {
      phoneValidator.value = right(PhoneValidator.emptyOrNull());
    } else if (!regex.hasMatch(value)) {
      phoneValidator.value = right(PhoneValidator.invalid());
    } else if (value.length != 11) {
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

  void validateChooseOne() {
    if (chooseOne.isEmpty) {
      chooseOneValidator.value = right(ChooseOneValidator.needToChoose());
    } else {
      chooseOneValidator.value = left(None());
    }
  }

  void validateMultipleChoose() {
    if (multipleChoose.isEmpty) {
      multipleChooseValidator.value =
          right(MultipleChooseValidator.needToChoose());
    } else if (multipleChoose.length < 3) {
      multipleChooseValidator.value = right(MultipleChooseValidator.lessThan());
    } else {
      multipleChooseValidator.value = left(None());
    }
  }

  void changeFormIndex(int v) => formIndex.value = v;
  void changeChooseOne(String v) => chooseOne.value = v;
  void changeMultipleChoose(String v) {
    if (multipleChoose.contains(v)) {
      multipleChoose.remove(v);
    } else {
      multipleChoose.add(v);
    }
  }

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
      case 3:
        validateChooseOne();
        if (chooseOneValidator.value!.isLeft()) {
          return pageController.jumpToPage(3);
        }
        break;
      case 4:
        validateMultipleChoose();
        if (multipleChooseValidator.value!.isLeft()) {
          Navigator.of(globalKey.currentContext!)
              .pushReplacementNamed(MainRoute.routeName);
          vlogController.playVideo();
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
