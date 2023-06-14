import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/class/status_request.dart';
import 'package:flutter_e_commerce/core/errors/failures.dart';
import 'package:flutter_e_commerce/core/functions/empty_or_validate_state.dart';
import 'package:flutter_e_commerce/features/auth/data/models/login_cached_model.dart';
import 'package:flutter_e_commerce/features/home/data/models/home_model/item_view_model.dart';
import 'package:flutter_e_commerce/features/item_single/data/repos/item_single_repo.dart';
import 'package:get/get.dart';

abstract class ItemSingleController extends GetxController{
  AppStates state = AppInitialState();
  final LoginCachedModel loginCached = LoginCachedModel.fromJson();

  final ItemSingleRepoImp _repoImp = ItemSingleRepoImp(Get.find());
  late ItemViewModel single;
  void getSingle(Map<String, dynamic> data);
  void addToCart(String itemsId, int cartCount);

  int selectedColor = 0;
  void updateSelectedColor(index);
  List<Map<String, dynamic>> colors = [
    {
      'title':'Red',
      'value': Colors.red,
    },
    {
      'title':'Black',
      'value': Colors.black,
    },
    {
      'title':'Blue',
      'value': Colors.blue,
    }
  ];
}

class ItemSingleControllerImp extends ItemSingleController{

  @override
  void getSingle(Map<String, dynamic> data) async {
    state = AppLoadingState();
    update();
    Either<Failure, Map<String, dynamic>> result = await _repoImp.getSingle(data);
    result.fold((failure) {
      state = handleFailure(failure);update();
    }, (response) async {
      if (!response['status']) {
        state = emptyOrValidateState(response);
        update();
      } else {
        single = ItemViewModel.fromJson(response);
        state = AppSuccessState();
        update();
      }
    });
  }

  @override
  void addToCart(String itemsId, cartCount) async {
    Map<String, dynamic> data = {
      'usersid': loginCached.usersId,
      'itemsid': itemsId,
      'cart_count': cartCount,
    };
    state = AppLoadingState(loadingLevel: int.parse(itemsId));
    update();
    Either<Failure, Map<String, dynamic>> result = await _repoImp.addToCart(data);
    result.fold((failure) {
      state = handleFailure(failure);update();
    }, (response) async {
      if (!response['status']) {
        state = emptyOrValidateState(response);
        update();
      } else {
        single.cartCount = cartCount;
        state = AppSuccessState();
        update();
      }
    });
  }



  @override
  void onInit() {
    super.onInit();
    single = Get.arguments['single'];
  }

  @override
  void updateSelectedColor(index) {
    selectedColor = index;
    update();
  }
}