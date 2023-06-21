import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/services/size_config.dart';
import 'package:flutter_e_commerce/core/shared/widgets/handle_loading.dart';
import 'package:flutter_e_commerce/features/home/data/models/home_model/item_view_model.dart';
import 'package:flutter_e_commerce/features/items/presentations/view_models/controllers/offers_controller.dart';
import 'package:flutter_e_commerce/features/items/presentations/views/offers/widgets/offer_item_list_view_item.dart';
import 'package:get/get.dart';

class OffersItemsListGrid extends StatelessWidget {
  const OffersItemsListGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GetBuilder<OffersControllerImp>(
      init: OffersControllerImp(),
      builder: (controller) {
      return HandleLoading(
        size: 150,
        state: controller.state,
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controller.items.length,
          itemBuilder: (BuildContext context, index){
            ItemViewModel item = controller.items[index];
            return OffersItemListViewItem(item: item);
          },
        ),
      );
    });
  }
}


