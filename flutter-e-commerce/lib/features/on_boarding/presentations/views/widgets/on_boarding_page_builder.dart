import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/constants/app_styles.dart';
import 'package:flutter_e_commerce/core/services/size_config.dart';
import 'package:flutter_e_commerce/core/services/theme_colors.dart';
import 'package:flutter_e_commerce/features/on_boarding/data/models/on_boarding_model.dart';
import 'package:flutter_e_commerce/features/on_boarding/data/statics/on_boarding_statics.dart';
import 'package:flutter_e_commerce/features/on_boarding/presentations/view_models/controllers/on_boarding_controller_imp.dart';
import 'package:get/get.dart';


class OnBoardingPageBuilder extends GetView<OnBoardingControllerImp> {
  const OnBoardingPageBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (index){
        controller.onPageChanged(index);
      },
      itemCount: OnBoardingStatics.onBoardingList.length,
      itemBuilder: (BuildContext context, int index){
        OnBoardingModel onBoardingList = OnBoardingStatics.onBoardingList[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              onBoardingList.title!,
              style: AppStyles.style20Bold,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 80,),
            Image.asset(
              onBoardingList.image!,
              width: 200,
              height: SizeConfig.screenHeight * 0.30,
            ),
            const SizedBox(height: 80,),
            Text(
              onBoardingList.body!,
              style: AppStyles.style18.copyWith(
                color: ThemeColors.secondaryText,
                height: 2,
              ),
              textAlign: TextAlign.center ,
            ),
          ],
        );
      },
    );
  }
}
