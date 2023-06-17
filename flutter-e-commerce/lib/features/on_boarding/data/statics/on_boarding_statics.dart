import 'package:flutter_e_commerce/core/constants/app_paths.dart';
import 'package:flutter_e_commerce/core/localization/app_lang_keys.dart';
import 'package:flutter_e_commerce/features/on_boarding/data/models/on_boarding_model.dart';
import 'package:get/get.dart';

class OnBoardingStatics {
  static List<OnBoardingModel> get onBoardingList => [
        OnBoardingModel(
            title: AppLangKeys.t2.tr, body: AppLangKeys.t3.tr, image: AppPaths.onBoardingImageOne),
        OnBoardingModel(
            title: AppLangKeys.t4.tr, body: AppLangKeys.t5.tr, image: AppPaths.onBoardingImageTwo),
        OnBoardingModel(
            title: AppLangKeys.t6.tr, body: AppLangKeys.t7.tr, image: AppPaths.onBoardingImageThree),
        OnBoardingModel(
            title: AppLangKeys.t6.tr, body: AppLangKeys.t7.tr, image: AppPaths.onBoardingImageFour),
      ];
}
