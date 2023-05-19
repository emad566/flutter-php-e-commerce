import 'package:flutter/cupertino.dart';
import 'package:flutter_e_commerce/core/constants/app_route_keys.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController{
  GlobalKey formKey = GlobalKey<FormState>();
  GlobalKey<FormFieldState> emailKey = GlobalKey<FormFieldState>();
  GlobalKey<FormFieldState> passwordKey = GlobalKey<FormFieldState>();

  late TextEditingController emailController;
  late TextEditingController passwordController;
  void login();
  void goToSignUp();
  void goToForgetPassword();
}

class LoginControllerImp extends LoginController{

  @override
  void goToForgetPassword() {
    Get.toNamed(AppRouteKeys.forgetPassword);
  }

  @override
  void goToSignUp() {
    Get.toNamed(AppRouteKeys.signUp);
  }

  @override
  void login() {
    // TODO: implement login
  }


  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

}