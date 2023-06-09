import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/constants/app_colors.dart';
import 'package:flutter_e_commerce/core/constants/app_styles.dart';
import 'package:flutter_e_commerce/core/services/theme_colors.dart';

class HomeAdsBar extends StatelessWidget {
  const HomeAdsBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: AppColors.primaryClr,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('A summer surprise', style: AppStyles.style20Bold.copyWith(color: ThemeColors.white),),
              const SizedBox(height: 20,),
              Text('Cashback 20%', style: AppStyles.style26.copyWith(color: ThemeColors.white),),
            ],
          ),
        ),
        Positioned(
          top: -15,
          right: -15,
          child: CircleAvatar(
            radius: 65,
            backgroundColor: ThemeColors.secondClr,
          ),
        ),
      ],
    );
  }
}