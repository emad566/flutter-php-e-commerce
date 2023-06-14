import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/constants/app_paths.dart';
import 'package:flutter_e_commerce/core/constants/app_styles.dart';
import 'package:flutter_e_commerce/core/services/theme_colors.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Image.asset(AppPaths.logo, fit: BoxFit.fill, height: 100,),
          ),
          Expanded(
            flex: 7,
            child: ListTile(
              title: Text(
                'MackBook M2 Max',
                style: AppStyles.style18Bold.copyWith(color:  ThemeColors.black),
              ),
              subtitle: Text(
                '150 \$',
                style: AppStyles.style18Bold.copyWith(color:  ThemeColors.tripleText),
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
                      onPressed: (){},
                      icon: Icon(Icons.add, size: 25, color: ThemeColors.secondClr,),
                    ),
                  ),

                  Text(
                    '2',
                    style: AppStyles.style22Bold.copyWith(color:  ThemeColors.black),
                  ),
                  SizedBox(
                    height: 30,
                    child: IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.remove, size: 25, color: ThemeColors.secondClr,),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 10,),
        ],
      ),
    );
  }
}
