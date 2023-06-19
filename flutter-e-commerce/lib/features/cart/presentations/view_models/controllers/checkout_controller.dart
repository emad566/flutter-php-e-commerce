import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerce/core/class/status_request.dart';
import 'package:flutter_e_commerce/core/constants/app_route_keys.dart';
import 'package:flutter_e_commerce/core/errors/failures.dart';
import 'package:flutter_e_commerce/core/functions/delete_home_controllers.dart';
import 'package:flutter_e_commerce/core/functions/empty_or_validate_state.dart';
import 'package:flutter_e_commerce/core/functions/snack_bar.dart';
import 'package:flutter_e_commerce/core/localization/app_lang_keys.dart';
import 'package:flutter_e_commerce/features/auth/data/models/login_cached_model.dart';
import 'package:flutter_e_commerce/features/cart/data/repos/checkout_repo.dart';
import 'package:get/get.dart';

abstract class CheckoutController extends GetxController{
  AppStates state = AppInitialState();
  final LoginCachedModel loginCached = LoginCachedModel.fromJson();
  String paymentType = '0';
  String deliveryType = '0';
  String addressId = '';

  late double ordersPrice;
  late double priceDelivery;
  late String couponId = '';
  late double couponDiscount;

  void setPaymentType(String type);
  void setDeliveryType(String type);
  void setAddressId(String id);
  final CheckoutRepoImp _repoImp = CheckoutRepoImp(Get.find());



  Map<String, dynamic> get data =>{
    'usersid': loginCached.usersId,
    'addressid': addressId,
    'orderstype': deliveryType,
    'pricedelivery': priceDelivery,
    'ordersprice': ordersPrice,
    'couponid': couponId,
    'paymentmethod': paymentType,
    'coupondiscount': couponDiscount,
  };

  void store();
  void goToHomeScreen();
  bool checkData();

}

class CheckoutControllerImp extends CheckoutController{

  @override
  void store() async {
    state = AppLoadingState();
    update();

    if(!checkData()){
      await Future.delayed(const Duration(seconds: 2));
      state = AppSuccessState();
      update();
      return;
    }

    Either<Failure, Map<String, dynamic>> result = await _repoImp.store(data);
    result.fold((failure) {
      state = handleFailure(failure);
      update();
    }, (response) async {
      if (!response['status']) {
        state = emptyOrValidateState(response);
        update();
      } else {
        Get.snackbar(
          AppLangKeys.alarm.tr,
          AppLangKeys.yourOrderHasBeenRequested.tr,
          snackPosition: SnackPosition.BOTTOM,
        );
        await Future.delayed(const Duration(seconds: 2));
        goToHomeScreen();
      }
    });
  }

  @override
  void setAddressId(String id) {
    addressId = id;
    update();
  }

  @override
  void setDeliveryType(String type) {
    deliveryType = type;
    if(deliveryType == "1") addressId = '';
    update();
  }

  @override
  void setPaymentType(String type) {
    paymentType = type;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    ordersPrice = Get.arguments['ordersprice'];
    priceDelivery = Get.arguments['pricedelivery'];
    couponId = Get.arguments['couponid']?? '';
    couponDiscount = Get.arguments['coupondiscount'];
  }

  @override
  void goToHomeScreen() {
    deleteHomeControllers();
    Get.offNamed(AppRouteKeys.homeLayout, arguments: {'index': 0});
  }

  @override
  bool checkData() {
    if(deliveryType == "0" && addressId == ""){
      snackBar(
        AppLangKeys.alarm.tr,
        AppLangKeys.pleaseSelectAnAddress.tr,
      );
      return false;
    }
    return true;
  }

}