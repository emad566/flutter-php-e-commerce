import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/constants/app_styles.dart';
import 'package:flutter_e_commerce/core/functions/translate.dart';
import 'package:flutter_e_commerce/core/services/theme_colors.dart';
import 'package:flutter_e_commerce/features/home/data/models/home_model/item_view_model.dart';
import 'package:flutter_e_commerce/features/item_single/presentations/view_models/controllers/item_single_controller.dart';
import 'package:get/get.dart';

class ItemSingleDetails extends StatelessWidget {
  const ItemSingleDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ItemSingleControllerImp controller = Get.put(ItemSingleControllerImp());
    ItemViewModel single = controller.single;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          '${single.itemsPriceDiscount} \$',
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

