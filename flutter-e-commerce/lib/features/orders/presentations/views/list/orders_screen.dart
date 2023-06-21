import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/localization/app_lang_keys.dart';
import 'package:flutter_e_commerce/core/shared/widgets/custom_app_bar.dart';
import 'package:flutter_e_commerce/core/shared/widgets/handle_loading.dart';
import 'package:flutter_e_commerce/features/orders/data/models/order_model.dart';
import 'package:flutter_e_commerce/features/orders/presentations/view_models/controllers/orders_controller.dart';
import 'package:flutter_e_commerce/features/orders/presentations/views/list/widgets/order_list_item.dart';
import 'package:get/get.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: AppLangKeys.orders.tr),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: GetBuilder<OrdersControllerImp>(
            init: OrdersControllerImp(),
            builder: (controller) {
              return HandleLoading(
                state: controller.state,
                child: ListView.builder(
                  itemCount: controller.items.length,
                  itemBuilder: (context, index) {
                    OrderModel item = controller.items[index];
                    return OrderListItem(item: item);
                  },
                ),
              );
            }),
      ),
    );
  }
}

