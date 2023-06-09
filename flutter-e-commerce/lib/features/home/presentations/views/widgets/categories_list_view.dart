import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/constants/api_links.dart';
import 'package:flutter_e_commerce/core/constants/app_styles.dart';
import 'package:flutter_e_commerce/core/services/theme_colors.dart';
import 'package:flutter_e_commerce/core/shared/widgets/handle_loading.dart';
import 'package:flutter_e_commerce/features/home/data/models/home_model/category_model.dart';
import 'package:flutter_e_commerce/features/home/presentations/view_models/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return HandleLoading(
        state: controller.state,
        child: SizedBox(
          height: 105,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: controller.categories.length,
            itemBuilder: (BuildContext context, int index){
              CategoryModel item = controller.categories[index];
              return Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: ThemeColors.thirdClr,
                        borderRadius: BorderRadius.circular(20)),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    height: 80,
                    width: 80,
                    child: SvgPicture.network(
                      "${ApiLinks.baseURL}upload/categories/${item.categoriesImage}",
                      colorFilter: ColorFilter.mode(ThemeColors.secondClr, BlendMode.srcIn),
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Text(
                    item.categoriesName,
                    style: AppStyles.style16Bold,
                  )
                ],
              );
            },
            separatorBuilder: (BuildContext context, int index){
              return const SizedBox(width: 10,);
            },
          ),
        ),
      );
    });
  }
}