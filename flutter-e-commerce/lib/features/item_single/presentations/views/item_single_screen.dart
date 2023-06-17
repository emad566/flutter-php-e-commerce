import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/localization/app_lang_keys.dart';
import 'package:flutter_e_commerce/core/shared/widgets/button_bottom_nav.dart';
import 'package:flutter_e_commerce/core/shared/widgets/handle_loading.dart';
import 'package:flutter_e_commerce/features/home/data/models/home_model/item_view_model.dart';
import 'package:flutter_e_commerce/features/item_single/presentations/view_models/controllers/item_single_controller.dart';
import 'package:flutter_e_commerce/features/item_single/presentations/views/widgets/item_single_color.dart';
import 'package:flutter_e_commerce/features/item_single/presentations/views/widgets/item_single_header.dart';
import 'package:get/get.dart';

import 'widgets/item_single_details.dart';

class ItemSingleScreen extends StatelessWidget {
  const ItemSingleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0XffEEeeEE),
      bottomNavigationBar: GetBuilder<ItemSingleControllerImp>(
        init: ItemSingleControllerImp(),
        builder: (controller) {
          ItemViewModel single = controller.single;
          return HandleLoading(
            loadingLevel: 2,
            state: controller.state,
            child: ButtonBottomNav(
              title: single.cartCount==0? AppLangKeys.addToCart.tr : AppLangKeys.removeFromCart.tr,
              onPress: ()=>controller.addToCart(single.itemsId, single.cartCount==0? 1 : 0),
            ),
          );
        },
      ),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ItemSingleHeader(),
            SizedBox(
              height: 100,
            ),
            ItemSingleDetails(),
            SizedBox(
              height: 15,
            ),
            ItemSingleColor()
          ],
        ),
      ),
    );
  }
}
