import 'package:flutter_e_commerce/core/constants/app_route_keys.dart';
import 'package:get/get.dart';

abstract class CheckEmailController extends GetxController{
  void checkEmail();
}

class CheckEmailControllerImp extends CheckEmailController{
  late String verifyCode;

  @override
  void checkEmail() {
    Get.offNamed(AppRouteKeys.successSignUp);
  }

}