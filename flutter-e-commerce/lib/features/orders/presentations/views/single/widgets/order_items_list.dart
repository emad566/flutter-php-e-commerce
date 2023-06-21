import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/constants/app_styles.dart';
import 'package:flutter_e_commerce/core/functions/translate.dart';
import 'package:flutter_e_commerce/core/localization/app_lang_keys.dart';
import 'package:flutter_e_commerce/core/shared/widgets/custom_divider.dart';
import 'package:flutter_e_commerce/core/shared/widgets/handle_loading.dart';
import 'package:flutter_e_commerce/features/orders/presentations/view_models/controllers/orders_single_controller.dart';
import 'package:get/get.dart';

class OrderItemsList extends StatelessWidget {
  const OrderItemsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrdersSingleControllerImp>(
        init: OrdersSingleControllerImp(),
        builder: (controller) {
          return HandleLoading(
            state: controller.state,
            child: Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Table(
                  children: [
                    TableRow(
                        children: [
                          Text(AppLangKeys.type.tr, textAlign: TextAlign.start, style: AppStyles.style16Bold,),
                          Text(AppLangKeys.count.tr, textAlign: TextAlign.center, style: AppStyles.style16Bold,),
                          Text(AppLangKeys.price.tr, textAlign: TextAlign.center, style: AppStyles.style16Bold,),
                        ]
                    ),
                    ...controller.items.map((e) => TableRow(children: [
                      Text(translate(e.itemsNameAr, e.itemsName), textAlign: TextAlign.start,),
                      Text(e.cartCount.toString(), textAlign: TextAlign.center,),
                      Text(e.itemsPrice.toString(), textAlign: TextAlign.center,),
                    ],),).toList(),
                    const TableRow(
                        children: [
                          CustomDivider(),
                          CustomDivider(),
                          CustomDivider(),
                        ]
                    ),
                    TableRow(
                        children: [
                          Text(AppLangKeys.shipping.tr, textAlign: TextAlign.start,),
                          const Text('', textAlign: TextAlign.center,),
                          Text('${controller.item.ordersPricedelivery} \$', textAlign: TextAlign.center,),
                        ]
                    ),
                    TableRow(
                        children: [
                          Text(AppLangKeys.discount.tr, textAlign: TextAlign.start,),
                          const Text('', textAlign: TextAlign.center,),
                          Text('${controller.item.coupondiscount} \$', textAlign: TextAlign.center,),
                        ]
                    ),
                    TableRow(
                        children: [
                          Text(AppLangKeys.totalPrice.tr, textAlign: TextAlign.start, style: AppStyles.style16Bold,),
                          Text('', textAlign: TextAlign.center, style: AppStyles.style16Bold,),
                          Text('${controller.item.ordersTotalprice} \$', textAlign: TextAlign.center, style: AppStyles.style16Bold,),
                        ]
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
