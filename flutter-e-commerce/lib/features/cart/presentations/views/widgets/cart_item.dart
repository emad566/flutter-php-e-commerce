import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/constants/api_links.dart';
import 'package:flutter_e_commerce/core/constants/app_styles.dart';
import 'package:flutter_e_commerce/core/functions/translate.dart';
import 'package:flutter_e_commerce/core/services/theme_colors.dart';
import 'package:flutter_e_commerce/features/home/data/models/home_model/item_view_model.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.item,
  });

  final ItemViewModel item;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: CachedNetworkImage(
              imageUrl: "${ApiLinks.baseURL}upload/items/${item.itemsImage}",
              fit: BoxFit.fill,
              height: 100,
            ),
          ),
          Expanded(
            flex: 7,
            child: ListTile(
              title: Text(
                translate(item.itemsNameAr, item.itemsName),
                style: AppStyles.style18Bold.copyWith(color: ThemeColors.black),
              ),
              subtitle: Text(
                '${item.itemsPrice} \$',
                style: AppStyles.style18Bold
                    .copyWith(color: ThemeColors.tripleText),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 38,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.add,
                        size: 25,
                        color: ThemeColors.secondClr,
                      ),
                    ),
                  ),
                  Text(
                    item.cartCount.toString(),
                    style: AppStyles.style22Bold
                        .copyWith(color: ThemeColors.black),
                  ),
                  SizedBox(
                    height: 30,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.remove,
                        size: 25,
                        color: ThemeColors.secondClr,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
