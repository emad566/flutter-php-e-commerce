import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/services/size_config.dart';
import 'package:flutter_e_commerce/core/services/theme_colors.dart';
import 'package:flutter_e_commerce/core/shared/widgets/app_field_icon.dart';
import 'package:flutter_e_commerce/core/shared/widgets/button_bottom_nav.dart';
import 'package:flutter_e_commerce/core/shared/widgets/custom_button.dart';
import 'package:flutter_e_commerce/core/shared/widgets/custom_text_field.dart';
import 'package:flutter_e_commerce/core/shared/widgets/handle_loading.dart';
import 'package:flutter_e_commerce/features/cart/presentations/view_models/controllers/cart_controller.dart';
import 'package:flutter_e_commerce/features/cart/presentations/views/widgets/cart_header.dart';
import 'package:flutter_e_commerce/features/cart/presentations/views/widgets/cart_items_list.dart';
import 'package:flutter_e_commerce/features/cart/presentations/views/widgets/cart_price_dart.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const CartHeader(),
            const SizedBox(
              height: 10,
            ),
            const CartItemsList(),
            const SizedBox(height: 50,),
            const CartApplyCoupon(),
            const SizedBox(height: 20,),
            const CartPrice(),
            ButtonBottomNav(
              title: 'Confirm'.tr,
              onPress: () {},
            ),
            const SizedBox(
              height: 60,
            ),
          ],
        ),
      ),
    );
  }
}

class CartApplyCoupon extends StatelessWidget {
  const CartApplyCoupon({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartControllerImp>(
      init: CartControllerImp(),
      builder: (controller) {
        return HandleLoading(
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
                  inputKey: controller.couponKey,
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
