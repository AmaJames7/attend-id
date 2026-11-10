import 'package:flutter/material.dart';

class AdaptiveSize {
  static const double smallPhone = 360; // iPhone SE, small Android
  static const double phone = 400; // Standard phones (iPhone 12/13/14)
  static const double largePhone = 480; // iPhone Plus/Max, larger Android
  static const double phablet = 600; // Large phones, small tablets
  static const double tablet = 768; // Standard tablets
  static const double largeTablet = 900; // iPad Pro, large tablets
  static const double desktop = 1024; // Desktops (in portrait)

  static double padding(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    if (width < smallPhone) {
      return 15;
    } else if (width < phone) {
      return 16;
    } else if (width < largePhone) {
      return 16;
    } else if (width < phablet) {
      return 32;
    } else if (width < tablet) {
      return 46;
    } else if (width < largeTablet) {
      return 56;
    } else if (width < desktop) {
      return 66;
    } else {
      return 86;
    }
  }
}
