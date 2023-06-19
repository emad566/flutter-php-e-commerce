import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/constants/app_styles.dart';
import 'package:flutter_e_commerce/core/services/theme_colors.dart';
import 'package:get/get.dart';

class CartHeader extends StatelessWidget {
  const CartHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // IconButton(
        //   onPressed: ()=>Get.back(),
        //   icon: Icon(Icons.arrow_back, size: 35, color: ThemeColors.tripleText,),
        // ),
        Expanded(
          child: Text(
            'My Cart'.tr,
            style: AppStyles.style26Bold.copyWith(color: ThemeColors.tripleText),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
