import 'package:flutter/cupertino.dart';
import 'package:flutter_e_commerce/core/constants/app_route_keys.dart';
import 'package:get/get.dart';

abstract class SignUpController extends GetxController{
  late TextEditingController userNameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController passwordController;

  void signUp();
  void goToLogIn();
  void goToForgetPassword();
}

class SignUpControllerImp extends SignUpController{

  @override
  void goToForgetPassword() {
    Get.offAndToNamed(AppRouteKeys.forgetPassword);
  }
 
  @override
  void goToLogIn() {
    Get.offAllNamed(AppRouteKeys.login);
  }

  @override
  void signUp() {

  }


  @override
  void onInit() {
    super.onInit();
    userNameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    userNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
  }

}