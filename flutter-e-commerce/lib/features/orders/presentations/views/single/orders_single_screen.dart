import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/localization/app_lang_keys.dart';
import 'package:flutter_e_commerce/core/shared/widgets/custom_app_bar.dart';
import 'package:flutter_e_commerce/features/orders/presentations/view_models/controllers/orders_single_controller.dart';
import 'package:flutter_e_commerce/features/orders/presentations/views/single/widgets/order_address.dart';
import 'package:flutter_e_commerce/features/orders/presentations/views/single/widgets/order_items_list.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrdersSingleScreen extends StatelessWidget {
  const OrdersSingleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OrdersSingleControllerImp controller = Get.put(OrdersSingleControllerImp());
    return Scaffold(
      appBar: customAppBar(title: '${AppLangKeys.orderNumber.tr}: ${controller.item.ordersId}'),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const OrderItemsList(),
              const OrderAddress(),
              if(controller.item.ordersAddress != null)
              SizedBox(
                height: Get.height*.5,
                child: GoogleMap(
                  indoorViewEnabled: true,
                  markers: {controller.marker, },
                  mapType: MapType.normal,
                  initialCameraPosition: controller.initialCameraPosition,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


