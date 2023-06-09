import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/services/theme_colors.dart';
import 'package:flutter_e_commerce/features/on_boarding/data/statics/on_boarding_statics.dart';
import 'package:flutter_e_commerce/features/on_boarding/presentations/view_models/controllers/on_boarding_controller_imp.dart';
import 'package:get/get.dart';

class OnBoardingDotController extends StatelessWidget {
  const OnBoardingDotController({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(
      builder: (controller) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...OnBoardingStatics.onBoardingList.asMap().keys.map(
                  (key) => AnimatedContainer(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    duration: const Duration(milliseconds: 900),
                    height: 6,
                    width: key == controller.currentPage ? 6 * 4 : 6,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ThemeColors.primaryClr),
                  ),
                ),
          ],
        );
      },
    );
  }
}
