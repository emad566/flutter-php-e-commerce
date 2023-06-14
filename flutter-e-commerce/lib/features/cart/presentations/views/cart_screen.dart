import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/shared/widgets/button_bottom_nav.dart';
import 'package:flutter_e_commerce/features/cart/presentations/view_models/controllers/cart_controller.dart';
import 'package:flutter_e_commerce/features/cart/presentations/views/widgets/cart_header.dart';
import 'package:flutter_e_commerce/features/cart/presentations/views/widgets/cart_item.dart';
import 'package:flutter_e_commerce/features/cart/presentations/views/widgets/cart_price_dart.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartControllerImp controller = Get.put(CartControllerImp());
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const CartHeader(),
          const SizedBox(
            height: 10,
          ),
          const SingleChildScrollView(
            child: CartItem(),
          ),
          const Spacer(),
          const CartPrice(),
          ButtonBottomNav(
            title: 'Confirm'.tr,
            onPress: () {},
          ),
          const SizedBox(height: 60,),
        ],
      ),
    );
  }
}
