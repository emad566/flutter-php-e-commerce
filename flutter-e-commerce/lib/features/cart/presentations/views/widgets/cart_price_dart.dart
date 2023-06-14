import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/constants/app_styles.dart';
import 'package:flutter_e_commerce/core/services/theme_colors.dart';
import 'package:get/get.dart';

class CartPrice extends StatelessWidget {
  const CartPrice({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
          visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
          dense:true,
          title: Text(
            'Price'.tr,
            style: AppStyles.style16Bold.copyWith(color: ThemeColors.tripleText),
          ),
          trailing: Text(
            '1200 \$',
            style: AppStyles.style16Bold.copyWith(color: ThemeColors.tripleText),
          ),
        ),
        ListTile(
          dense:true,
          contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
          visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
          title: Text(
            'Shipping'.tr,
            style: AppStyles.style16Bold.copyWith(color: ThemeColors.tripleText),
          ),
          trailing: Text(
            '50 \$',
            style: AppStyles.style16Bold.copyWith(color: ThemeColors.tripleText),
          ),
        ),
        Divider(height: 10, color: ThemeColors.black,),
        ListTile(
          title: Text(
            'Total Price'.tr,
            style: AppStyles.style16Bold.copyWith(color: ThemeColors.tripleText),
          ),
          trailing: Text(
            '1250 \$',
            style: AppStyles.style18Bold.copyWith(color: ThemeColors.secondClr),
          ),
        ),
      ],
    );
  }
}
