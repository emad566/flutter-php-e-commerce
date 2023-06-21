import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/localization/app_lang_keys.dart';
import 'package:flutter_e_commerce/core/shared/widgets/custom_app_bar.dart';
import 'package:flutter_e_commerce/core/shared/widgets/home_search_bar.dart';
import 'package:flutter_e_commerce/features/items/presentations/views/offers/widgets/offers_items_list_grid.dart';
import 'package:flutter_e_commerce/features/search/presentations/view_models/controllers/search_controller.dart';
import 'package:flutter_e_commerce/features/search/presentations/views/search_screen.dart';
import 'package:get/get.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: AppLangKeys.sales.tr),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: GetBuilder<SearchControllerImp>(
            init: SearchControllerImp(),
            builder: (controller) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HomeSearchBar(),
                  (controller.searchController.text == '') ?
                  const OffersItemsListGrid()
                      : const SearchScreen(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
