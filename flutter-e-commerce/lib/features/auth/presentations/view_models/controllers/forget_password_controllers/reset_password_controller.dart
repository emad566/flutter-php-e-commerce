import 'package:flutter/cupertino.dart';
import 'package:flutter_e_commerce/core/constants/app_route_keys.dart';
import 'package:get/get.dart';

abstract class ResetPasswordController extends GetxController {
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

  void savePassword();

}
class ResetPasswordControllerImp extends ResetPasswordController{
  @override
  void onInit() {
    super.onInit();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  @override
  void savePassword() {
    Get.offNamed(AppRouteKeys.successResetPassword);
  }

}