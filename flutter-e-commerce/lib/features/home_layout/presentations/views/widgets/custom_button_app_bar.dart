import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/services/theme_colors.dart';

class CustomButtonAppBar extends StatelessWidget {
  final void Function()? onPressed;
  final String textButton;
  final IconData iconData;
  final bool? active   ;
  const CustomButtonAppBar(
      {Key? key,
      required this.textButton,
      required this.iconData,
      required this.onPressed,
      required this.active})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            iconData,
            color: active == true ? ThemeColors.secondClr : ThemeColors.thirdClr,
          ),
       Text(
          textButton,
          style: TextStyle(
            color:
                  active == true ? ThemeColors.secondClr : ThemeColors.thirdClr,
            ),
          ),
        ],
      ),
    );
  }
}
