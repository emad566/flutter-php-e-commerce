import 'package:flutter_e_commerce/core/constants/app_route_keys.dart';
import 'package:get/get.dart';

abstract class VerifyCodeController extends GetxController{
  void checkCode();
  void goToResetPassword();
}

class VerifyCodeControllerImp extends VerifyCodeController{
  late String verifyCode;

  @override
  void checkCode() {
    // TODO: implement checkEmail
  }

  @override
  void goToResetPassword() {
    Get.offNamed(AppRouteKeys.resetPassword);
    Get.delete<VerifyCodeController>();
  }
}