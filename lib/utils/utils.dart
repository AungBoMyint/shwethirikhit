import 'package:flutter/material.dart';

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
