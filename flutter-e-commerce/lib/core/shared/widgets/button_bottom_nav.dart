import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/constants/app_styles.dart';
import 'package:flutter_e_commerce/core/services/theme_colors.dart';

class ButtonBottomNav extends StatelessWidget {
  const ButtonBottomNav({
    super.key, required this.title, required this.onPress,
  });
  final String title;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: 40,
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: ThemeColors.secondClr,
        onPressed: ()=>onPress(),
        child: Text(
          title,
          style: AppStyles.style18Bold.copyWith(
            color: ThemeColors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
