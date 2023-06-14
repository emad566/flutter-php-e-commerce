import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/constants/app_styles.dart';
import 'package:flutter_e_commerce/core/functions/translate.dart';
import 'package:flutter_e_commerce/core/services/theme_colors.dart';
import 'package:flutter_e_commerce/features/home/data/models/home_model/item_view_model.dart';

class ItemSingleDetails extends StatelessWidget {
  const ItemSingleDetails({
    super.key,
    required this.single,
  });

  final ItemViewModel single;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          '${single.itemsPrice} \$',
          style: AppStyles.style22Bold.copyWith(color: ThemeColors.primaryClr),
          textAlign: TextAlign.end,
        ),
        const SizedBox(height: 15,),
        Text(
          translate(single.itemsNameAr, single.itemsName),
          style: AppStyles.style18Bold.copyWith(
            color: ThemeColors.primaryClr,
          ),
          textAlign: TextAlign.start,
        ),
        const SizedBox(height: 15,),
        Text(
          translate(single.itemsDescAr, single.itemsDesc),
          style: AppStyles.style16Bold.copyWith(
            color: ThemeColors.tripleText,
          ),
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}

