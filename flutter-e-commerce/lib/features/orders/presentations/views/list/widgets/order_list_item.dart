import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/localization/app_lang_keys.dart';
import 'package:flutter_e_commerce/core/shared/widgets/custom_button.dart';
import 'package:flutter_e_commerce/core/shared/widgets/custom_divider.dart';
import 'package:flutter_e_commerce/core/shared/widgets/section_title.dart';
import 'package:flutter_e_commerce/features/orders/data/models/order_model.dart';
import 'package:flutter_e_commerce/features/orders/presentations/view_models/controllers/orders_controller.dart';
import 'package:flutter_e_commerce/features/orders/presentations/views/list/widgets/order_field_item.dart';
import 'package:flutter_e_commerce/features/orders/presentations/views/list/widgets/order_rating.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class OrderListItem extends StatelessWidget {
  const OrderListItem({Key? key, required this.item}) : super(key: key);

  final OrderModel item;
  @override
  Widget build(BuildContext context) {
    OrdersControllerImp controller = Get.put(OrdersControllerImp());
    return Card(
      margin:
      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: SectionTitle(
                title: '${AppLangKeys.orderNumber.tr}: ${item.ordersId}',
              ),
              trailing: Text(Jiffy.parse(item.ordersDate.toString()).fromNow()),
            ),
            OrderFieldItem(
              label: '${AppLangKeys.orderType.tr}:',
              value: item.ordersType! == '0'? AppLangKeys.delivery.tr : AppLangKeys.fromStore.tr,
            ),
            OrderFieldItem(
              label: '${AppLangKeys.orderPrice.tr}:',
              value: item.ordersPrice!,
            ),
            OrderFieldItem(
              label: '${AppLangKeys.deliveryPrice.tr}:',
              value: '${item.ordersPricedelivery} \$',
            ),
            OrderFieldItem(
              label: '${AppLangKeys.discount.tr}:',
              value: '${item.coupondiscount} \$',
            ),
            OrderFieldItem(
              label: '${AppLangKeys.paymentMethod.tr}:',
              value: item.ordersPaymentmethod! == '0'? AppLangKeys.cash.tr : AppLangKeys.cardsPayment.tr,
            ),
            OrderFieldItem(
              label: '${AppLangKeys.orderStatus.tr}:',
              value: item.ordersStatus!.tr.toString(),
            ),
            const CustomDivider(),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: SectionTitle(
                      title:
                      '${AppLangKeys.totalPrice.tr}:${item.ordersTotalprice} \$'),
                ),
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: 50,
                    child: CustomButton(
                      text: AppLangKeys.details.tr,
                      onPress: ()=>controller.goToOrderSingleScreen(item),
                      width: 70,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15,),
            OrderRating(item: item),
          ],
        ),
      ),
    );
  }
}

