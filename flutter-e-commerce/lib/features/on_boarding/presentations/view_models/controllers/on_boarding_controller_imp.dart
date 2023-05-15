import 'package:flutter/cupertino.dart';
import 'package:flutter_e_commerce/core/constants/app_constants.dart';
import 'package:flutter_e_commerce/features/auth/presentations/views/login/login_screen.dart';
import 'package:flutter_e_commerce/features/on_boarding/data/statics/on_boarding_statics.dart';
import 'package:flutter_e_commerce/features/on_boarding/presentations/view_models/controllers/on_boarding_controller.dart';
import 'package:get/get.dart';

class OnBoardingControllerImp extends OnBoardingController{
  @override
  void next(){
    if(currentPage < OnBoardingStatics.onBoardingList.length-1){
      currentPage++;
      pageController.animateToPage(currentPage, duration: AppConstants.transitionDuration, curve: Curves.easeInOut);
    }else{
      Get.to(()=>const LoginScreen());
    }
  }

  @override
  void onPageChanged(int index){
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
  }
}