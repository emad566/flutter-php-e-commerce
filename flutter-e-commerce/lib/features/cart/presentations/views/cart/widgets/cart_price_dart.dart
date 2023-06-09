import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/constants/app_styles.dart';
import 'package:flutter_e_commerce/core/services/theme_colors.dart';
import 'package:flutter_e_commerce/features/cart/presentations/view_models/controllers/cart_controller.dart';
import 'package:get/get.dart';

class CartPrice extends StatelessWidget {
  const CartPrice({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartControllerImp>(
      init: CartControllerImp(),
      builder: (controller) {
        return Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: ThemeColors.primaryClr),
          ),
          child: Column(
            children: [
              ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
                dense: true,
                title: Text(
                  'Price'.tr,
                  style: AppStyles.style16Bold
                      .copyWith(color: ThemeColors.tripleText),
                ),
                trailing: Text(
                  '${controller.totalPrice} \$',
                  style: AppStyles.style16Bold
                      .copyWith(color: ThemeColors.tripleText),
                ),
              ),
              ListTile(
                dense: true,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
                title: Text(
                  'Shipping'.tr,
                  style: AppStyles.style16Bold
                      .copyWith(color: ThemeColors.tripleText),
                ),
                trailing: Text(
                  '${controller.shipping.toStringAsFixed(2)} \$',
                  style: AppStyles.style16Bold
                      .copyWith(color: ThemeColors.tripleText),
                ),
              ),
              ListTile(
                dense: true,
                contentPadding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
                title: Text(
                  'Discount'.tr,
                  style: AppStyles.style16Bold
                      .copyWith(color: ThemeColors.tripleText),
                ),
                trailing: Text(
                  '-${controller.discountValue.toStringAsFixed(2)} \$',
                  style: AppStyles.style16Bold
                      .copyWith(color: ThemeColors.tripleText),
                ),
              ),
              Container(
                width: double.infinity,
                height: 1,
                color: ThemeColors.tripleText,
              ),
              ListTile(
                dense: true,
                contentPadding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
                title: Text(
                  'Total Price'.tr,
                  style: AppStyles.style16Bold
                      .copyWith(color: ThemeColors.tripleText),
                ),
                trailing: Text(
                  '${controller.totalWithShipping} \$',
                  style: AppStyles.style18Bold
                      .copyWith(color: ThemeColors.secondClr),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
