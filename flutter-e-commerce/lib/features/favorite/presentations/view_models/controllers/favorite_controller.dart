import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_e_commerce/core/class/status_request.dart';
import 'package:flutter_e_commerce/core/constants/app_route_keys.dart';
import 'package:flutter_e_commerce/core/errors/failures.dart';
import 'package:flutter_e_commerce/core/functions/empty_or_validate_state.dart';
import 'package:flutter_e_commerce/features/auth/data/models/login_cached_model.dart';
import 'package:flutter_e_commerce/features/favorite/data/repos/favorite_repo.dart';
import 'package:flutter_e_commerce/features/home/data/models/home_model/item_view_model.dart';
import 'package:flutter_e_commerce/features/home/data/models/home_model/items_view_model.dart';
import 'package:get/get.dart';

abstract class FavoriteController extends GetxController{
  GlobalKey<FormFieldState> searchKey = GlobalKey<FormFieldState>();
  late TextEditingController searchController;

  AppStates state = AppInitialState();
  final LoginCachedModel loginCached = LoginCachedModel.fromJson();
  List<ItemViewModel> items= [];
  void list();
  final FavoriteRepoImp _repoImp = FavoriteRepoImp(Get.find());
  void goToItem(ItemViewModel item);
  void removeFavorite(ItemViewModel item);
}

class FavoriteControllerImp extends FavoriteController{


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
  void removeFavorite(ItemViewModel item) async {
    Map<String, dynamic> data = {'usersid': loginCached.usersId, 'itemsid': item.itemsId};
    state = AppLoadingState(loadingLevel: 1);
    items.removeWhere((e) => e.itemsId == item.itemsId);
    update();
    late Either<Failure, Map<String, dynamic>> result;
    result = await _repoImp.removeFavorites(data);

    result.fold((failure) {
      state = handleFailure(failure);
      update();
    }, (response) async {
      if (!response['status']) {
        state = emptyOrValidateState(response);
        update();
      } else {
        state = AppSuccessState();
        update();
      }
    });
  }


  @override
  void goToItem(ItemViewModel item) {
    Get.toNamed(AppRouteKeys.itemSingle, arguments: {'single': item});
  }

  @override
  void onInit() {
    super.onInit();
    searchController = TextEditingController();
    list();
  }
}