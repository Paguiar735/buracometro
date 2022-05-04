import 'dart:ui';

import 'package:flutter/cupertino.dart';

mixin AppThemes {
  static const Color highLightColor = Color(0xFFFFA92C);
  static const Color secondaryGrayColor = Color(0xFF979797);
}

mixin AppStyles {
  static const TextStyle bigTitleTextStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle normalTextStyle = TextStyle(
    fontSize: 20,
  );
}