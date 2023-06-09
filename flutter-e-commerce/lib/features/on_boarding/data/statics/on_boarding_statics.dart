import 'package:flutter_e_commerce/core/constants/app_paths.dart';
import 'package:flutter_e_commerce/features/on_boarding/data/models/on_boarding_model.dart';
import 'package:get/get.dart';

class OnBoardingStatics {
  static List<OnBoardingModel> get onBoardingList => [
        OnBoardingModel(
            title: '2'.tr, body: '3'.tr, image: AppPaths.onBoardingImageOne),
        OnBoardingModel(
            title: '4'.tr, body: '5'.tr, image: AppPaths.onBoardingImageTwo),
        OnBoardingModel(
            title: '6'.tr, body: '7'.tr, image: AppPaths.onBoardingImageThree),
        OnBoardingModel(
            title: '6'.tr, body: '7'.tr, image: AppPaths.onBoardingImageFour),
      ];
}
