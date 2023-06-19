import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/shared/widgets/button_bottom_nav.dart';
import 'package:flutter_e_commerce/core/shared/widgets/handle_loading.dart';
import 'package:flutter_e_commerce/features/checkout/presentations/view_models/controllers/checkout_controller.dart';
import 'package:flutter_e_commerce/features/checkout/presentations/views/widgets/select_address.dart';
import 'package:flutter_e_commerce/features/checkout/presentations/views/widgets/select_delivery_type.dart';
import 'package:flutter_e_commerce/features/checkout/presentations/views/widgets/select_payment_type.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'.tr),
      ),
      bottomNavigationBar: GetBuilder<CheckoutControllerImp>(
        init: CheckoutControllerImp(),
        builder: (controller) {
          return HandleLoading(
            state: controller.state,
            child: ButtonBottomNav(
              title: 'Confirm'.tr,
              onPress: () => controller.store(),
            ),
          );
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GetBuilder<CheckoutControllerImp>(
            init: CheckoutControllerImp(),
            builder: (controller) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SelectPaymentType(),
                  SelectDeliveryType(),
                  SelectAddress()
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}


