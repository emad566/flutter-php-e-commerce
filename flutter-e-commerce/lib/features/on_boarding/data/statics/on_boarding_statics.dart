import 'package:flutter_e_commerce/core/constants/app_paths.dart';
import 'package:flutter_e_commerce/core/localization/en_tr.dart';
import 'package:flutter_e_commerce/features/on_boarding/data/models/on_boarding_model.dart';

abstract class OnBoardingStatics{
  static List<OnBoardingModel> onBoardingList = [
    OnBoardingModel(
        title: enTr["2"], body: enTr["3"], image: AppPaths.onBoardingImageOne),
    OnBoardingModel(
        title: enTr["4"], body: enTr["5"], image: AppPaths.onBoardingImageTwo),
    OnBoardingModel(
        title: enTr["6"], body: enTr["7"], image: AppPaths.onBoardingImageThree),
  ];
}
