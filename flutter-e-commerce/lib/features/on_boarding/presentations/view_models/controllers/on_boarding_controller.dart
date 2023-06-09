import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OnBoardingController extends GetxController {
  int currentPage = 0;
  late PageController pageController;

  void next();
  void onPageChanged(int index);
}
