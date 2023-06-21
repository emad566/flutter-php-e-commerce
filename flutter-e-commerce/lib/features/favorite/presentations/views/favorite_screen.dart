import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/shared/widgets/custom_app_bar.dart';
import 'package:flutter_e_commerce/features/favorite/presentations/views/widgets/favorite_items_list_grid.dart';
import 'package:get/get.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'My Favorites'.tr),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // HomeSearchBar(),
              FavoriteItemsListGrid(),
            ],
          ),
        ),
      ),
    );
  }
}



