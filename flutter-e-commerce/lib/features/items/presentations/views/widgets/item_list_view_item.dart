import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/constants/api_links.dart';
import 'package:flutter_e_commerce/core/constants/app_paths.dart';
import 'package:flutter_e_commerce/core/constants/app_styles.dart';
import 'package:flutter_e_commerce/core/functions/translate.dart';
import 'package:flutter_e_commerce/core/services/size_config.dart';
import 'package:flutter_e_commerce/core/services/theme_colors.dart';
import 'package:flutter_e_commerce/features/home/data/models/home_model/item_view_model.dart';
import 'package:flutter_e_commerce/features/items/presentations/view_models/controllers/items_controller.dart';
import 'package:flutter_e_commerce/features/items/presentations/views/widgets/item_favorite_icon.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ItemListViewItem extends StatelessWidget {
  const ItemListViewItem({
    super.key,
    required this.item, required this.controller,
  });
  final ItemsControllerImp controller;

  final ItemViewModel item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        controller.goToItem(item);
      },
      child: Stack(
        children: [
          Container(
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
                      '${item.itemsPriceDiscount} \$',
                      style: AppStyles.style16Bold.copyWith(
                          color: ThemeColors.secondClr,
                      ),
                      textAlign: TextAlign.center,
                    ),


                    ItemFavoriteIcon(item: item),
                  ],
                )
              ],
            ),
          ),
          if(item.itemsDiscount>0.0)
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(AppPaths.saleOne, width: 70,),
          ),

          if(item.itemsDiscount>0.0)
            Positioned(
              top: 35,
              left: 22,
              child: RotationTransition(
                turns: new AlwaysStoppedAnimation(-15 / 360),
                child: Text(
                  '${item.itemsDiscount.round()} %',
                  style: AppStyles.style22Bold.copyWith(color: ThemeColors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
