import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/constants/app_styles.dart';
import 'package:flutter_e_commerce/core/services/theme_colors.dart';
import 'package:get/get.dart';

class ItemSingleBottomNav extends StatelessWidget {
  const ItemSingleBottomNav({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: 40,
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: ThemeColors.secondClr,
        onPressed: (){},
        child: Text(
          'Add to Cart'.tr,
          style: AppStyles.style18Bold.copyWith(
            color: ThemeColors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
