import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/constants/api_links.dart';
import 'package:flutter_e_commerce/core/constants/app_paths.dart';
import 'package:flutter_e_commerce/core/constants/app_styles.dart';
import 'package:flutter_e_commerce/core/functions/translate.dart';
import 'package:flutter_e_commerce/core/services/size_config.dart';
import 'package:flutter_e_commerce/core/services/theme_colors.dart';
import 'package:flutter_e_commerce/features/home/data/models/home_model/item_view_model.dart';
import 'package:flutter_e_commerce/features/items/presentations/view_models/controllers/items_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_e_commerce/features/items/presentations/views/list/widgets/item_favorite_icon.dart';
import 'package:get/get.dart';

class OffersItemListViewItem extends StatelessWidget {
  const OffersItemListViewItem({
    super.key, required this.item,
  });

  final ItemViewModel item;

  @override
  Widget build(BuildContext context) {
    ItemsControllerImp controller = Get.put(ItemsControllerImp());
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Card(
        elevation: 5,
        child: InkWell(
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
                        width: SizeConfig.screenWidth*0.8 - 60,
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


                        ItemFavoriteIcon(item: item, size: 45,),
                      ],
                    )
                  ],
                ),
              ),
              if(item.itemsDiscount>0.0)
              Positioned(
                top: 10,
                left: 10,
                child: Image.asset(AppPaths.saleOne, width: 70,),
              ),

              if(item.itemsDiscount>0.0)
                Positioned(
                  top: 43,
                  left: 30,
                  child: RotationTransition(
                    turns: const AlwaysStoppedAnimation(-15 / 360),
                    child: SizedBox(
                      width: 45,
                      child: Text(
                        '${item.itemsDiscount.round()} %',
                        style: AppStyles.style20Bold.copyWith(color: ThemeColors.white.withOpacity(.8)),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
