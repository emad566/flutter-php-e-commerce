import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/constants/app_styles.dart';
import 'package:flutter_e_commerce/core/localization/app_lang_keys.dart';
import 'package:flutter_e_commerce/core/services/theme_colors.dart';
import 'package:flutter_e_commerce/core/shared/widgets/section_title.dart';
import 'package:flutter_e_commerce/features/checkout/presentations/view_models/controllers/checkout_controller.dart';
import 'package:get/get.dart';

class SelectPaymentType extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  SelectPaymentType({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    CheckoutControllerImp controller = Get.put(CheckoutControllerImp());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SectionTitle(title: AppLangKeys.choosePaymentMethod.tr),
        InkWell(
          onTap: ()=>controller.setPaymentType('0'),
          child: Card(
            elevation: 5,
            child: Container(
              padding: const EdgeInsets.symmetric(
                  vertical: 5, horizontal: 20),
              decoration: BoxDecoration(
                color: controller.paymentType == '0'? ThemeColors.secondClr : ThemeColors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Row(
                children: [
                  if(controller.paymentType == '0')
                    Icon(Icons.check_circle_outline, size: 30, color: ThemeColors.white,),
                  const SizedBox(width: 20,),
                  Text(
                    AppLangKeys.cash.tr,
                    style: AppStyles.style18Bold.copyWith(
                      color: controller.paymentType == '0'
                          ? ThemeColors.white
                          : ThemeColors.secondClr,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 10,),
        InkWell(
          onTap: ()=>controller.setPaymentType('1'),
          child: Card(
            elevation: 5,
            child: Container(
              padding: const EdgeInsets.symmetric(
                  vertical: 5, horizontal: 20),
              decoration: BoxDecoration(
                color: controller.paymentType == '1'? ThemeColors.secondClr : ThemeColors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Row(
                children: [
                  if(controller.paymentType == '1')
                    Icon(Icons.check_circle_outline, size: 30, color: ThemeColors.white,),
                  const SizedBox(width: 20,),
                  Text(
                    AppLangKeys.cardsPayment.tr,
                    style: AppStyles.style18Bold.copyWith(
                      color: controller.paymentType == '1'
                          ? ThemeColors.white
                          : ThemeColors.secondClr,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
