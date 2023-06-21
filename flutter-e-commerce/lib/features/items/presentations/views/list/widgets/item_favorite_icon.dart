import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/services/theme_colors.dart';
import 'package:flutter_e_commerce/core/shared/widgets/handle_loading.dart';
import 'package:flutter_e_commerce/features/home/data/models/home_model/item_view_model.dart';
import 'package:flutter_e_commerce/features/items/presentations/view_models/controllers/items_controller.dart';
import 'package:get/get.dart';

class ItemFavoriteIcon extends StatelessWidget {
  const ItemFavoriteIcon({
    super.key,
    required this.item,
    this.size =30,
  });

  final ItemViewModel item;
  final double size;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ItemsControllerImp>(
      init: ItemsControllerImp(),
      builder: (controllerFavorite) {
        return HandleLoading(
          size: size,
          state: controllerFavorite.state,
          loadingLevel: 1,
          child: InkWell(
            onTap: () {
              controllerFavorite.toggleFavorite(item);
            },
            child: Icon(
              item.favorite
                  ? Icons.favorite
                  : Icons.favorite_border_outlined,
              size: size-10,
              color: ThemeColors.secondClr,
            ),
          ),
        );
      },
    );
  }
}