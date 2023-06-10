import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/constants/api_links.dart';
import 'package:flutter_e_commerce/core/constants/app_styles.dart';
import 'package:flutter_e_commerce/core/services/theme_colors.dart';
import 'package:flutter_e_commerce/core/shared/widgets/handle_loading.dart';
import 'package:flutter_e_commerce/features/home/data/models/home_model/item_view_model.dart';
import 'package:flutter_e_commerce/features/home/presentations/view_models/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ItemsListView extends StatelessWidget {
  const ItemsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return HandleLoading(
        state: controller.state,
        child: SizedBox(
          height: 170,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: controller.items.length,
            itemBuilder: (BuildContext context, int index){
              ItemViewModel item = controller.items[index];
              return Stack(
                children: [
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      child: CachedNetworkImage(
                        imageUrl: "${ApiLinks.baseURL}upload/items/${item.itemsImage}",
                        height: 100,
                        width: 170,
                      ),
                    ),
                  ),
                  Container(
                    width: 210,
                    height: 120,
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: ThemeColors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),

                  Positioned(
                    top: 10,
                    left: 10,
                    child: Text(
                      item.itemsName,
                      style: AppStyles.style20Bold.copyWith(
                        color: ThemeColors.white,
                      ),
                    ),
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