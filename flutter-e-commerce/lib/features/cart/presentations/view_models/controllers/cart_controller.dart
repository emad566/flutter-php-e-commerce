import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerce/core/class/status_request.dart';
import 'package:flutter_e_commerce/core/errors/failures.dart';
import 'package:flutter_e_commerce/core/functions/empty_or_validate_state.dart';
import 'package:flutter_e_commerce/features/auth/data/models/login_cached_model.dart';
import 'package:flutter_e_commerce/features/cart/data/repos/favorite_repo.dart';
import 'package:flutter_e_commerce/features/home/data/models/home_model/item_view_model.dart';
import 'package:flutter_e_commerce/features/home/data/models/home_model/items_view_model.dart';
import 'package:get/get.dart';

abstract class CartController extends GetxController{
  AppStates state = AppInitialState();
  final LoginCachedModel loginCached = LoginCachedModel.fromJson();
  final CartRepoImp _repoImp = CartRepoImp(Get.find());

  List<ItemViewModel> items= [];
  void list();
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
        state = AppSuccessState();
        update();
      }
    });
  }

  @override
  void onInit() {
    super.onInit();
    list();
  }
}