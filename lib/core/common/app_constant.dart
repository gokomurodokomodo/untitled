import 'package:flutter/material.dart';

class AppConstant {
  AppConstant._();

  // constant
  static const debounceTimer = 1;
  static const animationTime = Duration(milliseconds: 250);
  static const animationCurve = Curves.ease;
  static const boxShadow = [
    BoxShadow(
      color: Color(0xffF2F4F7),
      blurRadius: 4,
      offset: Offset(0, 0), // Shadow position
    ),
    BoxShadow(
      color: Color.fromRGBO(16, 24, 40, 0.06),
      blurRadius: 2,
      offset: Offset(0, 1), // Shadow position
    ),
    BoxShadow(
      color: Color.fromRGBO(16, 24, 40, 0.10),
      blurRadius: 3,
      offset: Offset(0, 1), // Shadow position
    ),
  ];
  static const lightBoxShadow = [
    BoxShadow(
      offset: Offset(0, 1), // Horizontal and vertical offset
      blurRadius: 2, // Blur radius
      spreadRadius: 0, // Spread radius
      color: Color.fromRGBO(16, 24, 40, 0.05), // Color with opacity
    )
  ];
}
