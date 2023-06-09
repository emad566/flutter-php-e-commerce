import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/constants/app_styles.dart';
import 'package:flutter_e_commerce/core/services/theme_colors.dart';
import 'package:flutter_e_commerce/features/home/presentations/view_models/controllers/home_controller.dart';
import 'package:flutter_e_commerce/features/home/presentations/views/widgets/categories_list_view.dart';
import 'package:flutter_e_commerce/features/home/presentations/views/widgets/home_ads_bar.dart';
import 'package:flutter_e_commerce/features/home/presentations/views/widgets/home_search_bar.dart';
import 'package:flutter_e_commerce/features/home/presentations/views/widgets/items_list_view.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeControllerImp());
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeSearchBar(controller: controller),
          const SizedBox(height: 20,),
          const HomeAdsBar(),
          const SizedBox(height: 20,),
          const CategoriesListView(),
          const SizedBox(height: 10,),
          Text('Products For You', style: AppStyles.style20Bold.copyWith(color: ThemeColors.secondClr),),
          const SizedBox(height: 10,),
          const ItemsListView(),
        ],
      ),
    );
  }
}



