import 'package:flutter/material.dart';

class ColorsManager {
  static const Color black = Color(0xFF191D2B);
  static const Color gray500 = Color(0xFF96A0B5);
  static const Color gray300 = Color(0xFFD0D5DC);
  static const Color gray200 = Color(0xFFE8EAEE);
  static const Color gray100 = Color(0xFFF6F7F8);
  static const Color gray600 = Color(0xFF697896);
  static const Color white = Color(0xFFFFFFFF);

  //container colors
  static const Color purple = Color(0xffD08CDF);
  static const Color purpleLight = Color(0xffF9F1FB);
  static const Color orange = Color(0xffFD7722);
  static const Color orangeLight = Color(0xffFEDFCC);
  static const Color green = Color(0xff5ECEB3);
  static const Color greenLight = Color(0xffEBF9F5);

  //container gradient colors
  static const List<Color> blueGradient = [
    Color(0xff3A9ADE),
    Color(0xff5EACE4),
  ];
  static const List<Color> greenGradient = [
    Color(0xff3F8B8D),
    Color(0xff58B2B4),
  ];
  static const List<Color> redGradient = [
    Color(0xffDD4A4A),
    Color(0xffE87777),
  ];
  static List<Color> grayGradient = [
    const Color(0xff191C2A).withOpacity(0.12),
    const Color(0xff191C2A).withOpacity(0.06),
  ];
}
