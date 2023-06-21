import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/class/status_request.dart';
import 'package:flutter_e_commerce/core/localization/app_lang_keys.dart';
import 'package:flutter_e_commerce/features/auth/data/models/login_cached_model.dart';
import 'package:flutter_e_commerce/features/cart/presentations/view_models/controllers/cart_controller.dart';
import 'package:flutter_e_commerce/features/cart/presentations/views/cart/cart_screen.dart';
import 'package:flutter_e_commerce/features/favorite/presentations/view_models/controllers/favorite_controller.dart';
import 'package:flutter_e_commerce/features/favorite/presentations/views/favorite_screen.dart';
import 'package:flutter_e_commerce/features/home/presentations/view_models/controllers/home_controller.dart';
import 'package:flutter_e_commerce/features/home/presentations/views/home_screen.dart';
import 'package:flutter_e_commerce/features/home_layout/data/models/screen_model.dart';
import 'package:flutter_e_commerce/features/items/presentations/views/offers/offers_screen.dart';
import 'package:flutter_e_commerce/features/settings/presentations/views/settings_screen.dart';
import 'package:get/get.dart';

abstract class HomeLayoutController extends GetxController{
  AppStates state = AppInitialState();
  LoginCachedModel loginCached = LoginCachedModel.fromJson();
  List<ScreenModel> screens = [
    ScreenModel(screen: const SettingsScreen(), title: 'Settings'.tr, icon: Icons.settings),
    ScreenModel(screen: const FavoriteScreen(), title: 'Favorite'.tr, icon: Icons.favorite),
    const ScreenModel(screen: HomeScreen(), title: '', icon: Icons.cell_wifi),
    ScreenModel(screen: const OffersScreen(), title: AppLangKeys.offers.tr, icon: Icons.local_offer),
    ScreenModel(screen: const CartScreen(), title: 'Cart'.tr, icon: Icons.shopping_cart),
  ];

  late int currentIndex = 0;
  void updateIndex(index);

  ScreenModel get currentScreen => screens[currentIndex];
}

class HomeLayoutControllerImp extends HomeLayoutController{

  @override
  void updateIndex(index){
    Get.delete<FavoriteControllerImp>();
    Get.delete<HomeControllerImp>();
    Get.delete<CartControllerImp>();
    currentIndex = index;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    currentIndex = Get.arguments['index']?? 2;
    if(currentIndex != 0) update();
    FirebaseMessaging.instance.subscribeToTopic('users');
    FirebaseMessaging.instance.subscribeToTopic('users${loginCached.usersId}');
  }
}