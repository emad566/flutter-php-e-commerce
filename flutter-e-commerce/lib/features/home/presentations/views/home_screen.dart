import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/features/home/presentations/view_models/controllers/home_controller.dart';
import 'package:flutter_e_commerce/features/home/presentations/views/widgets/categories_list_view.dart';
import 'package:flutter_e_commerce/features/home/presentations/views/widgets/home_ads_bar.dart';
import 'package:flutter_e_commerce/features/home/presentations/views/widgets/home_search_bar.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeControllerImp());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
        child: Column(
          children: [
            HomeSearchBar(controller: controller),
            const SizedBox(height: 15,),
            const HomeAdsBar(),
            const SizedBox(height: 15,),
            const CategoriesListView(),
          ],
        ),
      ),
    );
  }
}



