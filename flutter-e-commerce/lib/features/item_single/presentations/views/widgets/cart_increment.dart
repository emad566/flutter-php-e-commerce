import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/constants/app_styles.dart';
import 'package:flutter_e_commerce/core/services/theme_colors.dart';
import 'package:flutter_e_commerce/features/home/data/models/home_model/item_view_model.dart';

class CartIncrement extends StatelessWidget {
  const CartIncrement({
    super.key,
    required this.single,
  });

  final ItemViewModel single;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: (){},
          icon: Icon(Icons.add, size: 35, color: ThemeColors.primaryClr,),
        ),
        CircleAvatar(
          backgroundColor: ThemeColors.primaryClr,
          child: Text(
            '8',
            style: AppStyles.style22Bold.copyWith(color: ThemeColors.white),
          ),
        ),
        IconButton(
          onPressed: (){},
          icon: Icon(Icons.remove, size: 35, color: ThemeColors.primaryClr,),
        ),
        const Spacer(),
        Text(
          '${single.itemsPrice} \$',
          style: AppStyles.style22Bold.copyWith(color: ThemeColors.primaryClr),
        )
      ],
    );
  }
}
