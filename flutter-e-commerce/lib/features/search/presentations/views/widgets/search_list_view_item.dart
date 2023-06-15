import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/constants/api_links.dart';
import 'package:flutter_e_commerce/core/constants/app_styles.dart';
import 'package:flutter_e_commerce/core/functions/translate.dart';
import 'package:flutter_e_commerce/core/services/size_config.dart';
import 'package:flutter_e_commerce/core/services/theme_colors.dart';
import 'package:flutter_e_commerce/features/home/data/models/home_model/item_view_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_e_commerce/features/search/presentations/view_models/controllers/search_controller.dart';
import 'package:flutter_e_commerce/features/search/presentations/views/widgets/search_item_favorite_icon.dart';
import 'package:get/get.dart';

class SearchListViewItem extends StatelessWidget {
  const SearchListViewItem({
    super.key, required this.item,
  });

  final ItemViewModel item;

  @override
  Widget build(BuildContext context) {
    SearchControllerImp controller = Get.put(Get.put(SearchControllerImp()));
    return InkWell(
      onTap: (){
        controller.goToItem(item);
      },
      child: Container(
        padding: const EdgeInsets.all(10.0),
        color: ThemeColors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Hero(
              tag: item.itemsId,
              child: CachedNetworkImage(
                imageUrl: "${ApiLinks.baseURL}upload/items/${item.itemsImage}",
                width: SizeConfig.screenWidth*0.5 - 60,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(height: 10,),
            Text(
              translate(item.itemsNameAr, item.itemsName),
              style: AppStyles.style14Bold.copyWith(color: ThemeColors.primaryText),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10,),
            Text(
              translate(item.categoriesNameAr, item.categoriesName),
              style: AppStyles.style14Bold.copyWith(color: ThemeColors.secondaryText),
              textAlign: TextAlign.center,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${item.itemsPrice} \$',
                  style: AppStyles.style16Bold.copyWith(color: ThemeColors.secondClr),
                  textAlign: TextAlign.center,
                ),

                SearchItemFavoriteIcon(item: item),
              ],
            )
          ],
        ),
      ),
    );
  }
}
