import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/shared/widgets/home_search_bar.dart';
import 'package:flutter_e_commerce/features/items/presentations/views/widgets/items_categories_list_view.dart';
import 'package:flutter_e_commerce/features/items/presentations/view_models/controllers/items_controller.dart';
import 'package:flutter_e_commerce/features/items/presentations/views/widgets/items_list_grid.dart';
import 'package:get/get.dart';

class ItemsScreen extends StatelessWidget {
  const ItemsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ItemsController controller = Get.put(ItemsControllerImp());

    return Scaffold(
      backgroundColor: const Color(0XffEEeeEE),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeSearchBar(controller: controller.searchController, inputKey: controller.searchKey,),
              const SizedBox(height: 20,),
              const ItemsCategoriesListView(),
              const ItemsListGrid(),
            ],
          ),
        ),
      ),
    );
  }
}
