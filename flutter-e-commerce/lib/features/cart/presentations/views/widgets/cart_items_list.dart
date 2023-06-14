import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/shared/widgets/handle_loading.dart';
import 'package:flutter_e_commerce/features/cart/presentations/view_models/controllers/cart_controller.dart';
import 'package:flutter_e_commerce/features/cart/presentations/views/widgets/cart_item.dart';
import 'package:get/get.dart';

class CartItemsList extends StatelessWidget {
  const CartItemsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GetBuilder<CartControllerImp>(
        init: CartControllerImp(),
        builder: (controller) {
          return HandleLoading(
            state: controller.state,
            child: Column(
              children: controller.items.map((item) => CartItem(item: item)).toList(),
            ),
          );
        },
      ),
    );
  }
}
