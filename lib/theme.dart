import 'package:flutter/material.dart';

// main theme colors
class ThemeColors {
  static final Color backgroundColor = Color(0xFFF1F1F1);
  static final Color primaryColor = Color(0xFF0F111A);
  static final Color accentColor = Color(0xFFFF4151);
}

// dynamic spacing depeding on screen size
class Spacing {
  static double xl(context) {
    return MediaQuery.of(context).size.height * 0.2;
  }

  static double l(context) {
    return MediaQuery.of(context).size.height * 0.1;
  }

  static double m(context) {
    return MediaQuery.of(context).size.height * 0.07;
  }

  static double s(context) {
    return MediaQuery.of(context).size.height * 0.05;
  }

  static double sm(context) {
    return MediaQuery.of(context).size.height * 0.03;
  }
}
