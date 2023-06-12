import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/constants/app_styles.dart';
import 'package:flutter_e_commerce/core/services/theme_colors.dart';
import 'package:flutter_e_commerce/features/item_single/presentations/view_models/controllers/item_single_controller.dart';
import 'package:get/get.dart';

class ItemSingleColor extends StatelessWidget {
  const ItemSingleColor({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ItemSingleControllerImp>(
      init: ItemSingleControllerImp(),
      builder: (controller){
        return Row(
          children: [
            Text(
              'Color'.tr,
              style: AppStyles.style18Bold.copyWith(
                color: ThemeColors.primaryClr,
              ),
              textAlign: TextAlign.start,
            ),
            ...controller.colors.asMap().entries.map((e) =>
                InkWell(
                  onTap: ()=>controller.updateSelectedColor(e.key),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    width: 100,
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color:  e.value['value'],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if(e.key==controller.selectedColor)
                          Icon(Icons.check_circle_outline, size: 25, color: ThemeColors.white,),
                        const SizedBox(width: 5,),
                        Text(
                          '${e.value['title']}'.tr,
                          style: AppStyles.style16Bold.copyWith(color: ThemeColors.white),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                )).toList(),
          ],
        );
      },
    );
  }
}
