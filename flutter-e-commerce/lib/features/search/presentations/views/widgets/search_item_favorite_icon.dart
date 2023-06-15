import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/services/theme_colors.dart';
import 'package:flutter_e_commerce/core/shared/widgets/handle_loading.dart';
import 'package:flutter_e_commerce/features/home/data/models/home_model/item_view_model.dart';
import 'package:flutter_e_commerce/features/search/presentations/view_models/controllers/search_controller.dart';
import 'package:get/get.dart';

class SearchItemFavoriteIcon extends StatelessWidget {
  const SearchItemFavoriteIcon({
    super.key,
    required this.item,
  });

  final ItemViewModel item;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchControllerImp>(
      init: SearchControllerImp(),
      builder: (controllerFavorite) {
        return HandleLoading(
          size: 30,
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
              size: 20,
              color: ThemeColors.secondClr,
            ),
          ),
        );
      },
    );
  }
}