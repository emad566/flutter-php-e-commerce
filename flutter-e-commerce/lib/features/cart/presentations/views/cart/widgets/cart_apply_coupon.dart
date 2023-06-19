import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/services/size_config.dart';
import 'package:flutter_e_commerce/core/services/theme_colors.dart';
import 'package:flutter_e_commerce/core/shared/widgets/app_field_icon.dart';
import 'package:flutter_e_commerce/core/shared/widgets/custom_button.dart';
import 'package:flutter_e_commerce/core/shared/widgets/custom_text_field.dart';
import 'package:flutter_e_commerce/core/shared/widgets/handle_loading.dart';
import 'package:flutter_e_commerce/features/cart/presentations/view_models/controllers/cart_controller.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CartApplyCoupon extends StatelessWidget {
  CartApplyCoupon({
    super.key,
  });

  GlobalKey<FormFieldState> couponKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartControllerImp>(
      init: CartControllerImp(),
      builder: (controller) {
        return (controller.items.isEmpty)? const Text('') : HandleLoading(
          state: controller.state,
          loadingLevel: 2,
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: CustomTextField(
                  borderRadius: 0,
                  hintText: 'Coupon'.tr,
                  prefixIcon: AppFieldIcon(iconData: Icons.vape_free),
                  controller: controller.couponController,
                  inputKey: couponKey,
                  borderColor: ThemeColors.secondClr,
                  isRequired: false,
                  onChange: (val){
                    if(val == '') controller.applyCoupon();
                  },
                ),
              ),
              Expanded(
                flex: 1,
                child: CustomButton(
                  text: 'Apply'.tr,
                  onPress: ()=>controller.applyCoupon(),
                  width: SizeConfig.screenWidth * 0.5,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
