import 'package:flutter/material.dart';

///[page] is Target Route Page
MaterialPageRoute route(Widget page) =>
    MaterialPageRoute(builder: (context) => page);

AppBar createAppBar(String message) {
  return AppBar(
    backgroundColor: Color.fromRGBO(85, 38, 38, 1),
    elevation: 0.0,
    title: Text(
      message,
      style: TextStyle(wordSpacing: 1, letterSpacing: 1),
    ),
  );
}
