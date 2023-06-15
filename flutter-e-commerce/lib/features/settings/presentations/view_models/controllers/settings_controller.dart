import 'package:flutter/cupertino.dart';
import 'package:flutter_e_commerce/core/class/status_request.dart';
import 'package:flutter_e_commerce/core/constants/app_route_keys.dart';
import 'package:flutter_e_commerce/core/services/cache_helper.dart';
import 'package:flutter_e_commerce/features/auth/data/models/login_cached_model.dart';
import 'package:get/get.dart';

abstract class SettingsController extends GetxController{
  GlobalKey<FormFieldState> searchKey = GlobalKey<FormFieldState>();
  late TextEditingController searchController;

  AppStates state = AppInitialState();
  final LoginCachedModel loginCached = LoginCachedModel.fromJson();

  // final SettingsRepoImp _repoImp = SettingsRepoImp(Get.find());

  void logOut();
}

class SettingsControllerImp extends SettingsController{

  @override
  void logOut(){
    CacheHelper.clearData();
    Get.offAllNamed(AppRouteKeys.login);
  }
}