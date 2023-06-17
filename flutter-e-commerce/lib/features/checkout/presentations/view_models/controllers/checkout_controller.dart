import 'package:flutter_e_commerce/core/class/status_request.dart';
import 'package:flutter_e_commerce/features/auth/data/models/login_cached_model.dart';
import 'package:get/get.dart';

abstract class CheckoutController extends GetxController{
  AppStates state = AppInitialState();
  final LoginCachedModel loginCached = LoginCachedModel.fromJson();
  String paymentType = 'cash';
  String deliveryType = 'delivery';
  int addressId = 0;

  void setPaymentType(String type);
  void setDeliveryType(String type);
  void setAddressId(int id);
  // final CheckoutRepoImp _repoImp = CheckoutRepoImp(Get.find());

}

class CheckoutControllerImp extends CheckoutController{
  @override
  void setAddressId(int id) {
    addressId = id;
    update();
  }

  @override
  void setDeliveryType(String type) {
    deliveryType = type;
    update();
  }

  @override
  void setPaymentType(String type) {
    paymentType = type;
    update();
  }


}