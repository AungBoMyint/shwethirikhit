import 'package:flutter/material.dart';

extension buttonExtension on ElevatedButton {
  Widget withColor(Color color, {OutlinedBorder? shape, double? elevation}) {
    return ElevatedButtonTheme(
      data: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: shape,
        elevation: elevation,
      )),
      child: this,
    );
  }
}

extension container on SizedBox {
  Widget withColor(Color color, {BorderRadiusGeometry? borderRadius}) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: borderRadius,
      ),
      child: this,
    );
  }
}

extension textField on TextFormField {
  Widget withRadius(BorderRadiusGeometry borderRadius) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: this,
    );
  }
}

extension ex on int {
  Widget h() {
    return SizedBox(height: this.roundToDouble());
  }

  Widget w() {
    return SizedBox(width: this.roundToDouble());
  }
}
