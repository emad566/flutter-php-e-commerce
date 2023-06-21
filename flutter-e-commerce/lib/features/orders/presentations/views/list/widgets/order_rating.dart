import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/constants/app_styles.dart';
import 'package:flutter_e_commerce/core/localization/app_lang_keys.dart';
import 'package:flutter_e_commerce/core/services/theme_colors.dart';
import 'package:flutter_e_commerce/features/orders/data/models/order_model.dart';
import 'package:flutter_e_commerce/features/orders/presentations/views/list/widgets/rating_dialog.dart';
import 'package:get/get.dart';

class OrderRating extends StatelessWidget {
  const OrderRating({
    super.key,
    required this.item,
  });
  final OrderModel item;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(AppLangKeys.rate.tr, style: AppStyles.style16Bold.copyWith(
              color: ThemeColors.tripleText
          ),),
        ),
        InkWell(
          onTap: ()=>showRatingDialog(item),
          child: Row(
            children: [
              Icon(Icons.star, size: 30, color: item.ordersRating!>0? Colors.yellow : ThemeColors.tripleText,),
              Icon(Icons.star, size: 30, color: item.ordersRating!>1? Colors.yellow : ThemeColors.tripleText,),
              Icon(Icons.star, size: 30, color: item.ordersRating!>2? Colors.yellow : ThemeColors.tripleText,),
              Icon(Icons.star, size: 30, color: item.ordersRating!>3? Colors.yellow : ThemeColors.tripleText,),
              Icon(Icons.star, size: 30, color: item.ordersRating!>4? Colors.yellow : ThemeColors.tripleText,),
            ],
          ),
        ),
      ],
    );
  }
}
