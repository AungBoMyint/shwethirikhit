import 'dart:async';

import 'package:flutter/material.dart';

class Debouncer {
  final int milliseconds;
  Timer? timer;

  Debouncer({required this.milliseconds, this.timer});

  run(VoidCallback action) {
    if (!(null == timer)) {
      timer?.cancel();
    }
    timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
