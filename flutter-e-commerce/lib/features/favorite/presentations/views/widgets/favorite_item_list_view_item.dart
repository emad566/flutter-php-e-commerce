import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/constants/api_links.dart';
import 'package:flutter_e_commerce/core/constants/app_styles.dart';
import 'package:flutter_e_commerce/core/functions/translate.dart';
import 'package:flutter_e_commerce/core/services/size_config.dart';
import 'package:flutter_e_commerce/core/services/theme_colors.dart';
import 'package:flutter_e_commerce/features/favorite/presentations/view_models/controllers/favorite_controller.dart';
import 'package:flutter_e_commerce/features/favorite/presentations/views/widgets/remive_favorite_icon.dart';
import 'package:flutter_e_commerce/features/home/data/models/home_model/item_view_model.dart';
import 'package:cached_network_image/cached_network_image.dart';

class FavoriteItemListViewItem extends StatelessWidget {
  const FavoriteItemListViewItem({
    super.key,
    required this.item, required this.controller,
  });
  final FavoriteController controller;

  final ItemViewModel item;

  @override
  Widget build(BuildContext context) {
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
                  '${item.itemsDiscount} \$',
                  style: AppStyles.style16Bold.copyWith(color: ThemeColors.secondClr),
                  textAlign: TextAlign.center,
                ),

                RemoveFavoriteIcon(item: item),
              ],
            )
          ],
        ),
      ),
    );
  }
}
