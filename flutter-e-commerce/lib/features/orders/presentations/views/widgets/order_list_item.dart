import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/localization/app_lang_keys.dart';
import 'package:flutter_e_commerce/core/shared/widgets/custom_button.dart';
import 'package:flutter_e_commerce/core/shared/widgets/custom_divider.dart';
import 'package:flutter_e_commerce/core/shared/widgets/section_title.dart';
import 'package:flutter_e_commerce/features/orders/data/models/order_model.dart';
import 'package:flutter_e_commerce/features/orders/presentations/views/widgets/order_field_item.dart';
import 'package:get/get.dart';

class OrderListItem extends StatelessWidget {
  const OrderListItem({Key? key, required this.item}) : super(key: key);

  final OrderModel item;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin:
      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionTitle(
                title:
                '${AppLangKeys.orderNumber.tr}: ${item.ordersId}'),
            OrderFieldItem(
              label: '${AppLangKeys.orderType.tr}:',
              value: item.ordersType!,
            ),
            OrderFieldItem(
              label: '${AppLangKeys.orderPrice.tr}:',
              value: item.ordersPrice!,
            ),
            OrderFieldItem(
              label: '${AppLangKeys.deliveryPrice.tr}:',
              value: '20 \$',
            ),
            OrderFieldItem(
              label: '${AppLangKeys.paymentMethod.tr}:',
              value: item.ordersPaymentmethod!,
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
                      '${AppLangKeys.totalPrice.tr}:${item.ordersPrice} \$'),
                ),
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: 50,
                    child: CustomButton(
                      text: AppLangKeys.details.tr,
                      onPress: (){},
                      width: 70,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
