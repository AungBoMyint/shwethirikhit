import 'dart:async';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:email_validator/email_validator.dart' as package;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kzn/auth/validator/multiple_choose_validator.dart';
import 'package:kzn/auth/validator/phone_validator.dart';
import 'package:kzn/auth/view/auth_page.dart';
import 'package:kzn/auth/view/sms_page.dart';
import 'package:kzn/auth/widgets/prompt_password.dart';
import 'package:kzn/data/models/auth_user.dart';
import 'package:kzn/intro/intro_one_screen.dart';
import 'package:kzn/services/database/reference.dart';
import 'package:kzn/utils/utils.dart';
import 'package:kzn/vlog/vlog_controller.dart';
import 'package:pinput/pinput.dart';

import '../../ui/routes/main_route.dart';
import '../validator/choose_one_validator.dart';
import '../validator/email_validator.dart' as own;
import '../validator/string_validator.dart';

class AuthController extends GetxController {
  final _firebaseAuth = FirebaseAuth.instance;
  final VlogController vlogController = Get.find();
  var formIndex = 0.obs;
  Rxn<AuthUser> currentUser = Rxn<AuthUser>();
  StreamSubscription? userSubscription;
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
  TextEditingController pinController = TextEditingController();
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
        if ((formIndex == 0) && phoneValidator.value!.isLeft()) {
          //phone is valid
          startPhoneSignIn();
        } else if ((formIndex != 0) && emailValidator.value!.isLeft()) {
          //email is valid
          //Prompt to input password
          //Then startEmailAuth
          promptPasswordForm(globalKey.currentState!.context);
        } else {
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
          changeAgeAreas();

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

  @override
  void onInit() {
    authListener();
    super.onInit();
  }

  Future<void> changeAgeAreas() async {
    showLoading(globalKey.currentState!.context);
    await userDocument(currentUser.value!.id).update(
      {
        "age": chooseOne.value,
        "areas": multipleChoose,
      },
    );
    hideLoading(globalKey.currentState!.context);
    Navigator.pushReplacementNamed(
      globalKey.currentState!.context,
      MainRoute.routeName,
    );
    vlogController.playVideo();
  }

  //Sign Out
  Future<void> logout() async {
    await _firebaseAuth.signOut();
    Navigator.pushNamedAndRemoveUntil(globalKey.currentState!.context,
        IntroOneScreen.routeName, ModalRoute.withName(MainRoute.routeName));
  }

  //Delete Account
  Future<void> deleteAccount() async {
    userDocument(currentUser.value!.id).delete().then((value) async {
      await _firebaseAuth.currentUser?.delete();
      Navigator.pushNamedAndRemoveUntil(globalKey.currentState!.context,
          IntroOneScreen.routeName, ModalRoute.withName(MainRoute.routeName));
    }).onError(
        (error, stackTrace) => errorSnap("Something was wrong with $error!."));
  }

  //Email Auth
  Future<void> startEmailSignIn({required String password}) async {
    showLoading(globalKey.currentState!.context);
    try {
      final userRef = await userCollection()
          .where("email", isEqualTo: emailController.text)
          .get();
      final userAlreadyExists = userRef.docs.isNotEmpty;
      if (userAlreadyExists) {
        //means login
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text,
          password: password,
        );
        hideLoading(globalKey.currentState!.context);
        Navigator.pushNamedAndRemoveUntil(globalKey.currentState!.context,
            MainRoute.routeName, ModalRoute.withName(IntroOneScreen.routeName));
        vlogController.playVideo();
      } else {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: password,
        );
        hideLoading(globalKey.currentState!.context);
        pageController.jumpToPage(2);
        Navigator.popUntil(
          globalKey.currentState!.context,
          ModalRoute.withName(AuthPage.routeName),
        );
      }
    } on FirebaseAuthException catch (e) {
      hideLoading(globalKey.currentState!.context);
      if (e.code == 'weak-password') {
        errorSnap("The password provided is too weak.");
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        errorSnap('The account already exists for that email.');
        print('The account already exists for that email.');
      } else {
        errorSnap("your password is something wrong.");
      }
    } catch (e) {
      hideLoading(globalKey.currentState!.context);
      errorSnap("Something was wrong.");
      print(e);
    }
  }

  Future<void> whethrePhoneSignInOrNot() async {
    final userRef = await userCollection()
        .where("phone", isEqualTo: phoneController.text)
        .get();
    final userAlreadyExists = userRef.docs.isNotEmpty;
    if (userAlreadyExists) {
      //means log in
      Navigator.pushNamedAndRemoveUntil(globalKey.currentState!.context,
          MainRoute.routeName, ModalRoute.withName(IntroOneScreen.routeName));
      vlogController.playVideo();
    } else {
      //means create new
      pageController.jumpToPage(2);
      Navigator.popUntil(
        globalKey.currentState!.context,
        ModalRoute.withName(AuthPage.routeName),
      );
    }
  }

  //Phone Auth
  Future<void> startPhoneSignIn({int? forceResentingToken}) async {
    final lastDigit = phoneController.text.substring(2);
    final phoneNumber = "+959" + lastDigit;
    await _firebaseAuth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      timeout: const Duration(seconds: 30),
      verificationCompleted: (PhoneAuthCredential credential) async {
        pinController.setText(credential.smsCode!);
        Navigator.of(globalKey.currentState!.context).pushNamed(
          SMSPage.routeName,
        );
        showLoading(globalKey.currentState!.context);
        await _firebaseAuth.signInWithCredential(credential);
        hideLoading(globalKey.currentState!.context);
        await whethrePhoneSignInOrNot();
      },
      verificationFailed: (FirebaseAuthException e) {
        errorSnap("$e");
      },
      codeSent: (String verificationId, int? resendToken) async {
        Navigator.of(globalKey.currentState!.context).push(
          MaterialPageRoute(
              builder: (context) => SMSPage(
                    codeResend: () {
                      startPhoneSignIn(forceResentingToken: resendToken);
                    },
                    submit: () async {
                      showLoading(context);
                      PhoneAuthCredential credential =
                          PhoneAuthProvider.credential(
                              verificationId: verificationId,
                              smsCode: pinController.text);

                      // Sign the user in (or link) with the credential
                      await _firebaseAuth.signInWithCredential(credential);
                      hideLoading(context);
                      await whethrePhoneSignInOrNot();
                    },
                  )),
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        log("Code AutoRetrieve Timeout: $verificationId");
      },
    );
  }

  authListener() {
    _firebaseAuth.userChanges().listen((User? user) async {
      if (user == null) {
        currentUser.value = null;
      } else {
        //we check doc already have,if not set or do nothing
        final userRef = await userDocument(user.uid).get();
        if (!userRef.exists) {
          currentUser.value = AuthUser(
            id: user.uid,
            name: nameController.text,
            isActive: false,
            phone: phoneController.text,
            email: emailController.text,
            areas: multipleChoose,
            age: chooseOne.value,
          );
          await userDocument(user.uid).set(currentUser.value!);
        }

        //if subscription is not null,set null or do nothing
        if (!(userSubscription == null)) {
          userSubscription?.cancel();
        } else {
          userSubscription =
              userDocument(user.uid).snapshots().listen((userSnap) {
            currentUser.value = userSnap.data();
          });
        }
      }
    });
  }
}
