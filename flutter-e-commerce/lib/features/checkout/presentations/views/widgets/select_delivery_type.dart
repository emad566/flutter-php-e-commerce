import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/constants/app_paths.dart';
import 'package:flutter_e_commerce/core/localization/app_lang_keys.dart';
import 'package:flutter_e_commerce/core/services/theme_colors.dart';
import 'package:flutter_e_commerce/core/shared/widgets/section_title.dart';
import 'package:flutter_e_commerce/features/checkout/presentations/view_models/controllers/checkout_controller.dart';
import 'package:get/get.dart';

class SelectDeliveryType extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  SelectDeliveryType({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    CheckoutControllerImp controller = Get.put(CheckoutControllerImp());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(title: AppLangKeys.chooseDeliveryType.tr),
        Row(
          children: [
            InkWell(
              onTap: () => controller.setDeliveryType('delivery'),
              child: Container(
                padding: const EdgeInsets.all(30),
                color: controller.deliveryType == 'delivery'
                    ? ThemeColors.secondClr
                    : ThemeColors.tripleText,
                child:Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Image.asset(
                      AppPaths.deliveryImage2,
                      width: 80,
                    ),
                    if (controller.deliveryType == 'delivery')
                      Positioned(
                        top: -15,
                        left: -15,
                        child: Icon(
                          Icons.check_circle_outline,
                          size: 30,
                          color: ThemeColors.white,
                        ),
                      ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            InkWell(
              onTap: () => controller.setDeliveryType('thru'),
              child: Container(
                padding: const EdgeInsets.all(30),
                color: controller.deliveryType == 'thru'
                    ? ThemeColors.secondClr
                    : ThemeColors.tripleText,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Image.asset(
                      AppPaths.drivethruImage,
                      width: 80,
                    ),
                    if (controller.deliveryType == 'thru')
                      Positioned(
                        top: -15,
                        left: -15,
                        child: Icon(
                          Icons.check_circle_outline,
                          size: 30,
                          color: ThemeColors.white,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
