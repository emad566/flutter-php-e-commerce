import 'package:flutter/cupertino.dart';
import 'package:flutter_e_commerce/core/constants/app_route_keys.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordController extends GetxController{
  late TextEditingController emailController;
  void forgetPassword();
  void goToSignUp();
  void goToLogin();
  void goToVerifyCode();
}

class ForgetPasswordControllerImp extends ForgetPasswordController{

  @override
  void goToLogin() {
    Get.offAllNamed(AppRouteKeys.login);
    Get.delete<ForgetPasswordController>();
  }

  @override
  void goToSignUp() {
    Get.offAndToNamed(AppRouteKeys.signUp);
    Get.delete<ForgetPasswordController>();
  }

  @override
  void forgetPassword() {
    // TODO: implement login
  }

  @override
  void goToVerifyCode() {
    Get.offNamed(AppRouteKeys.verifyCode);
    Get.delete<ForgetPasswordController>();
  }


  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
  }

}