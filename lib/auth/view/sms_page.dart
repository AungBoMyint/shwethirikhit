import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kzn/auth/controller/auth_controller.dart';
import 'package:kzn/data/constant.dart';
import 'package:kzn/services/utils/fun.dart';
import 'package:kzn/utils/utils.dart';
import 'package:pinput/pinput.dart';
import 'package:timer_count_down/timer_count_down.dart';

class SMSPage extends StatefulWidget {
  const SMSPage({super.key, this.codeResend, this.submit});
  static final routeName = "sms_page";

  final void Function()? codeResend;
  final void Function()? submit;

  @override
  State<SMSPage> createState() => _SMSPageState();
}

class _SMSPageState extends State<SMSPage> {
  bool isTimer = true;

  void startTimer() {
    if (mounted) {
      isTimer = true;
    }
  }

  void endTimer() {
    if (mounted) {
      setState(() {
        isTimer = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find();
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
          fontSize: 20, color: Colors.black, fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: mainColor),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              verticalSpace(45),
              Text(
                "Verification",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              verticalSpace(25),
              Text(
                "Enter the code sent to the number",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey.shade600,
                ),
              ),
              verticalSpace(25),
              Text(
                authController.phoneController.text,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              verticalSpace(80),
              Center(
                child: Pinput(
                  length: 6,
                  controller: authController.pinController,
                  defaultPinTheme: defaultPinTheme,
                  focusedPinTheme: focusedPinTheme,
                  submittedPinTheme: submittedPinTheme,
                  validator: (s) => numberValidator(
                    key: "Pin",
                    digit: 6,
                    value: s,
                  ),
                  pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                  showCursor: true,
                  androidSmsAutofillMethod: AndroidSmsAutofillMethod.none,
                  onCompleted: (pin) {
                    if (!(widget.submit == null)) {
                      widget.submit!();
                    }
                  },
                ),
              ),
              verticalSpace(25),
              isTimer
                  ? Countdown(
                      seconds: 60,
                      build: (BuildContext context, double time) =>
                          Text(time.toString()),
                      interval: Duration(seconds: 1),
                      onFinished: () {
                        endTimer();
                      },
                    )
                  : SizedBox(
                      height: 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Don't receive code?",
                          ),
                          TextButton(
                            onPressed: widget.codeResend,
                            child: Text(
                              "Resend",
                              style: TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
