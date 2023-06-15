import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/constants/app_styles.dart';
import 'package:flutter_e_commerce/core/services/theme_colors.dart';
import 'package:get/get.dart';

class FavoritetHeader extends StatelessWidget {
  const FavoritetHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            'My Favorites'.tr,
            style: AppStyles.style26Bold.copyWith(color: ThemeColors.tripleText),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
