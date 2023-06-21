import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_e_commerce/core/class/status_request.dart';
import 'package:flutter_e_commerce/core/constants/app_route_keys.dart';
import 'package:flutter_e_commerce/core/functions/lanch_url.dart';
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
  void goToAddress();
  void goToOrders();
  void contactUs();
}

class SettingsControllerImp extends SettingsController{

  @override
  void logOut(){
    FirebaseMessaging.instance.unsubscribeFromTopic('users');
    FirebaseMessaging.instance.unsubscribeFromTopic('users${loginCached.usersId}');
    CacheHelper.clearData();
    Get.offAllNamed(AppRouteKeys.login);
  }

  @override
  void goToAddress() {
    Get.toNamed(AppRouteKeys.address);
  }


  @override
  void goToOrders() {
    Get.toNamed(AppRouteKeys.orders);
  }

  @override
  void contactUs() {
    launchURL('tel:+201021838680');
  }
}