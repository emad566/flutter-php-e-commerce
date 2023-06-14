import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/services/theme_colors.dart';
import 'package:flutter_e_commerce/features/favorite/presentations/view_models/controllers/favorite_controller.dart';
import 'package:flutter_e_commerce/features/home/data/models/home_model/item_view_model.dart';
import 'package:get/get.dart';

class RemoveFavoriteIcon extends StatelessWidget {
  const RemoveFavoriteIcon({
    super.key,
    required this.item,
  });

  final ItemViewModel item;

  @override
  Widget build(BuildContext context) {
    FavoriteControllerImp controller = Get.put(FavoriteControllerImp());
    return InkWell(
      onTap: () {
        controller.removeFavorite(item);
      },
      child: Icon(
        Icons.delete_forever,
        size: 30,
        color: ThemeColors.secondClr,
      ),
    );
  }
}