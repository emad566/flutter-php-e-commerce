import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/services/size_config.dart';
import 'package:flutter_e_commerce/core/shared/widgets/button_bottom_nav.dart';
import 'package:flutter_e_commerce/features/cart/presentations/view_models/controllers/cart_controller.dart';
import 'package:flutter_e_commerce/features/cart/presentations/views/widgets/cart_apply_coupon.dart';
import 'package:flutter_e_commerce/features/cart/presentations/views/widgets/cart_header.dart';
import 'package:flutter_e_commerce/features/cart/presentations/views/widgets/cart_items_list.dart';
import 'package:flutter_e_commerce/features/cart/presentations/views/widgets/cart_price_dart.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartControllerImp controller = Get.put(CartControllerImp());
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
              onPress: () =>controller.goToCheckout(),
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

