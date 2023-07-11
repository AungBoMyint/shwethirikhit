import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kzn/data/constant.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

final GlobalKey<NavigatorState> globalKey = GlobalKey();
verticalSpace(double? height) => SizedBox(height: height ?? 20);
horizontalSpace(double? width) => SizedBox(width: width ?? 20);

class ErrorText extends StatelessWidget {
  final String string;
  const ErrorText({
    Key? key,
    required this.string,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.8,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          string,
          style: TextStyle(
            color: Colors.red,
          ),
          textAlign: TextAlign.left,
        ),
      ),
    );
  }
}

ElevatedButton button(
    {TextStyle? style,
    double? padding,
    required String text,
    required void Function()? onPressed}) {
  return ElevatedButton(
    onPressed: onPressed,
    child: Padding(
      padding: EdgeInsets.all(padding ?? 5.0),
      child: Text(
        text,
        style: style,
      ),
    ),
  );
}

showLoading(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.white.withOpacity(0),
    pageBuilder: (context, __, ___) {
      return Center(
          child: SizedBox(
        height: 50,
        width: 100,
        child: Center(
          child: LoadingAnimationWidget.flickr(
            leftDotColor: const Color(0xFF1A1A3F),
            rightDotColor: mainColor,
            size: 50,
          ),
        ),
      ));
    },
  );
}

hideLoading(BuildContext context) {
  Navigator.of(context).pop();
}

successSnap(String title, {String? message}) {
  Get.snackbar(
    title,
    message ?? "",
    backgroundColor: Colors.green,
    colorText: Colors.white,
  );
}

errorSnap(String title, {String? message}) {
  ScaffoldMessenger.of(globalKey.currentState!.context).showSnackBar(
    SnackBar(
        content: Text(
      title,
    )),
  );
}

String? stringValidator(String key, String? value) {
  if (value == null || value.isEmpty) {
    return "$key is required.";
  } else {
    return null;
  }
}

const MOBILE = 430;
const TABLET = 524;
const XTABLET = 800;
const DESKTOP = 1920;

bool largerThanMobile(double width) => width > MOBILE;

bool largerThanTablet(double width) => width > TABLET;

bool largerThanXTablet(double width) => width > XTABLET;

bool isMobile(double width) {
  return width <= MOBILE;
}

bool isTablet(double width) {
  return width > MOBILE && width <= TABLET;
}

bool isxTablet(double width) {
  return width > TABLET && width <= XTABLET;
}
