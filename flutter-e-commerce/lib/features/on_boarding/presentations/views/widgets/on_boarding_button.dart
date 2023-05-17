import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/services/size_config.dart';
import 'package:flutter_e_commerce/core/services/theme_colors.dart';
import 'package:flutter_e_commerce/features/on_boarding/presentations/view_models/controllers/on_boarding_controller_imp.dart';
import 'package:get/get.dart';

class OnBoardingButton extends GetView<OnBoardingControllerImp>{
  const OnBoardingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth * 0.70,
      margin: const EdgeInsets.only(bottom: 20),
      child: MaterialButton(
        onPressed: (){
          controller.next();
        },
        height: 40,
        color: ThemeColors.primaryClr,
        child: Text(
          '8'.tr,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: ThemeColors.white,
          ),
        ),
      ),
    );
  }
}
