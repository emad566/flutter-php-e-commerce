import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/constants/app_styles.dart';
import 'package:flutter_e_commerce/features/orders/presentations/view_models/controllers/orders_single_controller.dart';
import 'package:get/get.dart';

class OrderAddress extends StatelessWidget {
  const OrderAddress({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    OrdersSingleControllerImp controller = Get.put(OrdersSingleControllerImp());

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: (controller.item.ordersAddress == null)? const Text(''): ListTile(
          title: Text(controller.item.addressName, style: AppStyles.style16Bold,),
          subtitle: Text('${controller.item.addressStreet}, ${controller.item.addressCity}', style: AppStyles.style16,),
        ),
      ),
    );
  }
}
