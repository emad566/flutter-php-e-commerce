import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/constants/api_links.dart';
import 'package:flutter_e_commerce/core/services/theme_colors.dart';
import 'package:flutter_e_commerce/features/item_single/presentations/view_models/controllers/item_single_controller.dart';
import 'package:get/get.dart';

class ItemSingleHeader extends StatelessWidget {
  const ItemSingleHeader({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    ItemSingleControllerImp controller = Get.put(ItemSingleControllerImp());

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 200,
          decoration: BoxDecoration(
            color: ThemeColors.primaryClr,
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(50),
            ),
          ),
        ),
        Positioned(
          top: 75,
          left: Get.width * 0.095,
          child: Hero(
            tag: controller.single.itemsId,
            child: CachedNetworkImage(
              imageUrl: "${ApiLinks.baseURL}upload/items/${controller.single.itemsImage}",
              // height: 250,
              width: Get.width * 0.80,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ],
    );
  }
}
