import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/services/theme_colors.dart';

// ignore: must_be_immutable
class AppFieldIcon extends StatelessWidget {
  AppFieldIcon({
    super.key,
    required this.iconData,
    this.size = 27,
    this.color,
  });

  final IconData iconData;
  final double size;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return Icon(
      iconData,
      size: size,
      color: color?? ThemeColors.primaryClr,
    );
  }
}
