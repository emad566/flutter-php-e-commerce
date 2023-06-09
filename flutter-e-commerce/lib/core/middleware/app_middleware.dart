import 'package:flutter/cupertino.dart';
import 'package:flutter_e_commerce/core/constants/app_chaches.dart';
import 'package:flutter_e_commerce/core/constants/app_route_keys.dart';
import 'package:flutter_e_commerce/core/services/cache_helper.dart';
import 'package:get/get.dart';

class AppMiddleware extends GetMiddleware {
  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    bool isShowOnBoardingScreen = CacheHelper.getData(AppCaches.isShowOnBoardingScreen) ?? true;


    if (isLogin()) {
      return const RouteSettings(name: AppRouteKeys.home);
    }

    if (!isShowOnBoardingScreen) {
      return const RouteSettings(name: AppRouteKeys.login);
    }
    return null;
  }

  bool isLogin() =>CacheHelper.getData(AppCaches.loginCached) == null ? false : true;
}
