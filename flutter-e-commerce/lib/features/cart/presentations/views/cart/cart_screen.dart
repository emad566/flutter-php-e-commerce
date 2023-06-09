import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/services/size_config.dart';
import 'package:flutter_e_commerce/core/shared/widgets/button_bottom_nav.dart';
import 'package:flutter_e_commerce/core/shared/widgets/custom_app_bar.dart';
import 'package:flutter_e_commerce/features/cart/presentations/view_models/controllers/cart_controller.dart';
import 'package:flutter_e_commerce/features/cart/presentations/views/cart/widgets/cart_apply_coupon.dart';
import 'package:flutter_e_commerce/features/cart/presentations/views/cart/widgets/cart_items_list.dart';
import 'package:flutter_e_commerce/features/cart/presentations/views/cart/widgets/cart_price_dart.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartControllerImp controller = Get.put(CartControllerImp());
    SizeConfig().init(context);
    return Scaffold(
      appBar: customAppBar(title: 'My Cart'.tr),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 10,
              ),
              const CartItemsList(),
              const SizedBox(height: 50,),
              CartApplyCoupon(),
              const SizedBox(height: 20,),
              const CartPrice(),
              const SizedBox(height: 20,),
              GetBuilder<CartControllerImp>(
                init: CartControllerImp(),
                builder: (controller){
                  return  (controller.items.isEmpty)? const Text('') : ButtonBottomNav(
                    title: 'Confirm'.tr,
                    onPress: () =>controller.goToCheckout(),
                  );
                },
              ),

              const SizedBox(
                height: 60,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

