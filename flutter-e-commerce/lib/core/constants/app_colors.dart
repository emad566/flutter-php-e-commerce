import 'package:flutter/material.dart';

abstract class AppColors {
  //Generic Colors
  static const Color white = Colors.white;
  static const Color black = Colors.black;

  //Light Mode
  static const Color primaryText = Colors.black;
  static const Color secondaryText = Color(0xff8e8e8e);
  static const Color tripleText = Color.fromARGB(255, 66, 66, 66);
  static const Color primaryBg = Color(0xffF8F9FD) ;
  static const Color primaryClr = Color(0xffe74c3c);
  static const Color secondClr = Color(0xffc0392b);
  static const Color fourthClr = Color(0xff0d3056);
  static const Color thirdClr = Color.fromARGB(255, 255, 179, 170);

  //DarkMode Mode
  static const Color darkPrimaryText = Colors.white;
  static Color darkSecondaryText = Colors.white.withOpacity(0.5);
  static const Color darkTripleText = Color(0xFF666666);
  static const Color darkPrimaryBg = Color(0xFF100b20);
  static const Color darkPrimaryClr = Color(0xffe74c3c);
  static const Color darkSecondClr = Color(0xffc0392b);
  static const Color darkFourthClr = Color(0xff0d3056);
  static const Color darkThirdClr = Color.fromARGB(255, 255, 179, 170);
}
