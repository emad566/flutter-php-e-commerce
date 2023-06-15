import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/shared/widgets/home_search_bar.dart';
import 'package:flutter_e_commerce/features/home/presentations/views/widgets/home_body.dart';
import 'package:flutter_e_commerce/features/search/presentations/view_models/controllers/search_controller.dart';
import 'package:flutter_e_commerce/features/search/presentations/views/search_screen.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
        child: GetBuilder<SearchControllerImp>(
          init: SearchControllerImp(),
          builder: (controller) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HomeSearchBar(),
                (controller.searchController.text == '') ?
                const HomeBody()
                    : const SearchScreen(),
              ],
            );
          },
        ),
      ),
    );
  }
}




