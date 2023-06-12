import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/constants/app_styles.dart';
import 'package:flutter_e_commerce/core/functions/translate.dart';
import 'package:flutter_e_commerce/core/services/theme_colors.dart';
import 'package:flutter_e_commerce/features/home/data/models/home_model/category_model.dart';
import 'package:flutter_e_commerce/features/items/presentations/view_models/controllers/items_controller.dart';
import 'package:get/get.dart';

class ItemsCategoriesListView extends StatelessWidget {
  const ItemsCategoriesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ItemsControllerImp>(
      init: ItemsControllerImp(),
      builder: (controller) {
      return SizedBox(
        height: 50,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: controller.categories.length,
          itemBuilder: (BuildContext context, int index){
            CategoryModel item = controller.categories[index];
            return InkWell(
              onTap: (){
                controller.updateSelectedCategoryIndex(index);
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                decoration: BoxDecoration(
                  border: controller.selectedCategoryIndex == index? Border(
                    bottom: BorderSide(color: ThemeColors.thirdClr, width: 3),
                  ) : null,
                ),
                child: Text(
                  translate(item.categoriesNameAr, item.categoriesName),
                  style: AppStyles.style20Bold,
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index){
            return const SizedBox(width: 10,);
          },
        ),
      );
    });
  }
}