import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/constants/app_styles.dart';
import 'package:flutter_e_commerce/core/services/theme_colors.dart';
import 'package:flutter_e_commerce/features/home/presentations/views/widgets/categories_list_view.dart';
import 'package:flutter_e_commerce/features/home/presentations/views/widgets/home_ads_bar.dart';
import 'package:flutter_e_commerce/features/home/presentations/views/widgets/items_list_view.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20,),
        const HomeAdsBar(),
        const SizedBox(height: 20,),
        const CategoriesListView(),
        const SizedBox(height: 10,),
        Text('Products For You', style: AppStyles.style20Bold.copyWith(color: ThemeColors.secondClr),),
        const SizedBox(height: 10,),
        const ItemsListView(),
        Text('Products For You', style: AppStyles.style20Bold.copyWith(color: ThemeColors.secondClr),),
        const SizedBox(height: 10,),
        const ItemsListView(),
      ],
    );
  }
}
