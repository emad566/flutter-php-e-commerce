import 'package:flutter/cupertino.dart';
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
    // TODO: implement goToForgetPassword
  }
 
  @override
  void goToLogIn() {
    Get.back();
  }

  @override
  void signUp() {
    // TODO: implement login
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