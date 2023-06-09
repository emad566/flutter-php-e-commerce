import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/class/status_request.dart';
import 'package:flutter_e_commerce/core/services/theme_colors.dart';
import 'package:flutter_e_commerce/features/home/presentations/views/home_screen.dart';
import 'package:flutter_e_commerce/features/home_layout/data/models/screen_model.dart';
import 'package:get/get.dart';

abstract class HomeLayoutController extends GetxController{
  AppStates state = AppInitialState();
  List<ScreenModel> screens = [
    const ScreenModel(screen: HomeScreen(), title: 'Home', icon: Icons.home),
    const ScreenModel(screen: HomeScreen(), title: 'Product', icon: Icons.home),
    const ScreenModel(screen: HomeScreen(), title: '', icon: Icons.cell_wifi),
    const ScreenModel(screen: HomeScreen(), title: 'Cart', icon: Icons.home),
    const ScreenModel(screen: HomeScreen(), title: 'Shop', icon: Icons.home),
  ];

  late int currentIndex = 0;
  void updateIndex(index);
  List<BottomNavigationBarItem> bottomItems();
  ScreenModel get currentScreen => screens[0];
}

class HomeLayoutControllerImp extends HomeLayoutController{

  @override
  void updateIndex(index){
    currentIndex = index;
    update();
  }

  @override
  List<BottomNavigationBarItem> bottomItems() {
    return screens
        .asMap().entries.map(
          (entry) => BottomNavigationBarItem(
            icon: entry.key == 2? Container(width: 30,) : Icon(
              entry.value.icon,
              size:  28,
              color: entry.key == currentIndex? ThemeColors.primaryClr : ThemeColors.secondClr.withOpacity(.7) ,
            ),
            label:  entry.value.title,
          ),
        )
        .toList();
  }
}