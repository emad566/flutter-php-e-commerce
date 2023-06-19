import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/services/size_config.dart';
import 'package:flutter_e_commerce/core/shared/widgets/handle_loading.dart';
import 'package:flutter_e_commerce/features/home/data/models/home_model/item_view_model.dart';
import 'package:flutter_e_commerce/features/items/presentations/view_models/controllers/items_controller.dart';
import 'package:flutter_e_commerce/features/items/presentations/views/list/widgets/item_list_view_item.dart';
import 'package:get/get.dart';

class ItemsListGrid extends StatelessWidget {
  const ItemsListGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GetBuilder<ItemsControllerImp>(
      init: ItemsControllerImp(),
      builder: (controller) {
      return HandleLoading(
        size: 150,
        state: controller.state,
        child: SingleChildScrollView(
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.items.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.80,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (BuildContext context, index){
              ItemViewModel item = controller.items[index];

              return ItemListViewItem(item: item, controller: controller,);
            },
          ),
        ),
      );
    });
  }
}


