import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/class/status_request.dart';
import 'package:flutter_e_commerce/features/cart/presentations/view_models/controllers/cart_controller.dart';
import 'package:flutter_e_commerce/features/cart/presentations/views/cart_screen.dart';
import 'package:flutter_e_commerce/features/favorite/presentations/view_models/controllers/favorite_controller.dart';
import 'package:flutter_e_commerce/features/favorite/presentations/views/favorite_screen.dart';
import 'package:flutter_e_commerce/features/home/presentations/view_models/controllers/home_controller.dart';
import 'package:flutter_e_commerce/features/home/presentations/views/home_screen.dart';
import 'package:flutter_e_commerce/features/home_layout/data/models/screen_model.dart';
import 'package:flutter_e_commerce/features/settings/presentations/views/settings_screen.dart';
import 'package:get/get.dart';

abstract class HomeLayoutController extends GetxController{
  AppStates state = AppInitialState();
  List<ScreenModel> screens = [
    const ScreenModel(screen: HomeScreen(), title: 'Profile', icon: Icons.manage_accounts),
    const ScreenModel(screen: CartScreen(), title: 'Cart', icon: Icons.shopping_cart),
    const ScreenModel(screen: HomeScreen(), title: '', icon: Icons.cell_wifi),
    const ScreenModel(screen: SettingsScreen(), title: 'Settings', icon: Icons.settings),
    const ScreenModel(screen: FavoriteScreen(), title: 'Favorite', icon: Icons.favorite),
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


}