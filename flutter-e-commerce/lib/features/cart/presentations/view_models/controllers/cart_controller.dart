import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/class/status_request.dart';
import 'package:flutter_e_commerce/core/errors/failures.dart';
import 'package:flutter_e_commerce/core/functions/empty_or_validate_state.dart';
import 'package:flutter_e_commerce/features/auth/data/models/login_cached_model.dart';
import 'package:flutter_e_commerce/features/cart/data/repos/cart_repo.dart';
import 'package:flutter_e_commerce/features/home/data/models/home_model/item_view_model.dart';
import 'package:flutter_e_commerce/features/home/data/models/home_model/items_view_model.dart';
import 'package:get/get.dart';

abstract class CartController extends GetxController{
  AppStates state = AppInitialState();
  late TextEditingController couponController;
  GlobalKey<FormFieldState> couponKey = GlobalKey<FormFieldState>();

  final LoginCachedModel loginCached = LoginCachedModel.fromJson();
  final CartRepoImp _repoImp = CartRepoImp(Get.find());

  List<ItemViewModel> items= [];
  double totalPrice =0;
  double shipping = 0;
  double totalWithShipping = 0;
  double discount = 0;
  double discountValue = 0;

  void list();
  void applyCoupon();
  void updateCart(String itemsId, cartCount);
  void setTotalPrice();
}

class CartControllerImp extends CartController{


  @override
  void list() async {
    state = AppLoadingState();
    update();
    Either<Failure, Map<String, dynamic>> result = await _repoImp.list({'usersid': loginCached.usersId});
    result.fold((failure) {
      state = handleFailure(failure);
      update();
    }, (response) async {
      if (!response['status']) {
        state = emptyOrValidateState(response);
        update();
      } else {
        items = ItemsViewModel.fromJson(response).data;
        setTotalPrice();
        state = AppSuccessState();
        update();
      }
    });
  }

  @override
  void applyCoupon() async {
    state = AppLoadingState(loadingLevel: 2);
    update();

    if(emptyCoupon()) return;

    Either<Failure, Map<String, dynamic>> result = await _repoImp.applyCoupon({'couponname': couponController.text});
    result.fold((failure) {
      state = handleFailure(failure);
      update();
    }, (response) async {
      if (!response['status']) {
        Get.snackbar(
          "Alert".tr,
          'Coupon Expired'.tr,
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        Get.snackbar(
          "Alert".tr,
          'Coupon Applied'.tr,
          snackPosition: SnackPosition.BOTTOM,
        );
        discount = double.parse(response['data']['coupon_discount'].toString());
        setTotalPrice();
      }
      state = AppSuccessState();
      update();
    });
  }

  @override
  void updateCart(String itemsId, cartCount) async {
    Map<String, dynamic> data = {
      'usersid': loginCached.usersId,
      'itemsid': itemsId,
      'cart_count': cartCount,
    };
    state = AppLoadingState(loadingLevel: int.parse(itemsId));
    update();
    Either<Failure, Map<String, dynamic>> result = await _repoImp.updateCart(data);
    result.fold((failure) {
      state = handleFailure(failure);
      update();
    }, (response) async {
      if (!response['status']) {
        state = emptyOrValidateState(response);
        update();
      } else {
        Get.snackbar(
          "Alert".tr,
          'Cart has been updated'.tr,
          snackPosition: SnackPosition.BOTTOM,
        );
        setTotalPrice();
        state = AppSuccessState();
        update();
      }
    });
  }

  @override
  void onInit() {
    super.onInit();
    couponController = TextEditingController();
    list();

  }

  @override
  void setTotalPrice() {
    double total = 0;
    for(ItemViewModel item in items){
      total += item.cartCount * item.itemsPriceDiscount;
    }

    totalPrice = total;
    shipping = 0.10 * totalPrice;
    totalWithShipping = totalPrice +  shipping;
    discountValue = (totalWithShipping*discount / 100);
    totalWithShipping -= discountValue;
    totalWithShipping = double.parse(totalWithShipping.toStringAsFixed(2).toString());
  }

  bool emptyCoupon() {
    if(couponController.text == ''){
      discount = 0;
      setTotalPrice();
      Get.snackbar(
        "Alert".tr,
        'Coupon Applied'.tr,
        snackPosition: SnackPosition.BOTTOM,
      );
      state = AppSuccessState();
      update();
      return true;
    }
    return false;
  }

}