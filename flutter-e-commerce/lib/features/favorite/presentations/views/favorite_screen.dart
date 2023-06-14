import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/shared/widgets/home_search_bar.dart';
import 'package:flutter_e_commerce/features/favorite/presentations/view_models/controllers/favorite_controller.dart';
import 'package:flutter_e_commerce/features/favorite/presentations/views/widgets/favorite_items_list_grid.dart';
import 'package:get/get.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FavoriteControllerImp controller = Get.put(FavoriteControllerImp());
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeSearchBar(controller: controller.searchController, inputKey: controller.searchKey,),
            const FavoriteItemsListGrid()
          ],
        ),
      ),
    );
  }
}



