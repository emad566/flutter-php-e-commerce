import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/services/theme_colors.dart';
import 'package:flutter_e_commerce/core/shared/widgets/custom_input_field.dart';
import 'package:flutter_e_commerce/features/search/presentations/view_models/controllers/search_controller.dart';
import 'package:get/get.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({
    super.key,
    this.isSearchScreen = false,
  });

  final bool isSearchScreen;

  @override
  Widget build(BuildContext context) {
    SearchControllerImp controller = Get.put(SearchControllerImp());

    return Row(
      children: [
        if(isSearchScreen)
        IconButton(
          onPressed: ()=>controller.list(),
          icon: const Icon(Icons.arrow_back, size: 35,),
        ),
        const SizedBox(width: 10,),
        Expanded(
          child: CustomTextField(
            onChange: (val){
              if(val == '')controller.list();
            },
            isRequired: false,
            hintText: "Search".tr,
            controller: controller.searchController,
            inputKey: controller.searchKey,
            borderRadius: 5,
            borderColor: ThemeColors.primaryClr,
            prefixIcon: InkWell(
              onTap: ()=>controller.list(),
              child: const Icon(
                Icons.search,
                size: 35,
              ),
            ),
            fillColor: ThemeColors.fillClr,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 18, horizontal: 30),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: ThemeColors.fillClr,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: const Icon(
            Icons.notifications_active_outlined,
            size: 40,
          ),
        )
      ],
    );
  }
}
