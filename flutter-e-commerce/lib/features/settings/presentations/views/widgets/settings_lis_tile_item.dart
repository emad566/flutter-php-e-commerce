import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/constants/app_styles.dart';
import 'package:flutter_e_commerce/core/services/theme_colors.dart';

class SettingsLisTileItem extends StatelessWidget {
  const SettingsLisTileItem({
    super.key, required this.title, required this.iconData, required this.onTap,
  });
  final String title;
  final IconData iconData;
  final Function onTap;


  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: AppStyles.style18Bold.copyWith(color: ThemeColors.tripleText),
      ),
      trailing: Icon(iconData, size: 35, color: ThemeColors.primaryClr,),
      onTap: ()=>onTap(),
    );
  }
}
