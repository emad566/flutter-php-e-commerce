import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_e_commerce/core/class/status_request.dart';
import 'package:flutter_e_commerce/core/constants/app_route_keys.dart';
import 'package:flutter_e_commerce/core/errors/failures.dart';
import 'package:flutter_e_commerce/core/functions/empty_or_validate_state.dart';
import 'package:flutter_e_commerce/features/auth/data/models/login_cached_model.dart';
import 'package:flutter_e_commerce/features/home/data/models/home_model/item_view_model.dart';
import 'package:flutter_e_commerce/features/home/data/models/home_model/items_view_model.dart';
import 'package:flutter_e_commerce/features/search/data/repos/search_repo.dart';
import 'package:get/get.dart';

abstract class SearchController extends GetxController{
  late TextEditingController searchController;

  AppStates state = AppInitialState();
  final LoginCachedModel loginCached = LoginCachedModel.fromJson();


  final SearchRepoImp _repoImp = SearchRepoImp(Get.find());

  List<ItemViewModel> items= [];
  void list();
  void toggleFavorite(ItemViewModel item);
  void goToSearchScreen();
  void goToHomeScreen();
  void search();

  void goToItem(ItemViewModel item);
}

class SearchControllerImp extends SearchController{

  @override
  void search(){
    Get.delete<SearchControllerImp>();
  }

  @override
  void list() async {
    state = AppLoadingState();
    update();

    Either<Failure, Map<String, dynamic>> result = await _repoImp.list({
      'userid': loginCached.usersId,
      'name': searchController.text,
    });

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
  void toggleFavorite(ItemViewModel item) async {
    Map<String, dynamic> data = {'usersid': loginCached.usersId, 'itemsid': item.itemsId};
    state = AppLoadingState(loadingLevel: 1);
    update();
    late Either<Failure, Map<String, dynamic>> result;
    if(!item.favorite){
      item.favorite = true;
      result = await _repoImp.addToFavorites(data);
    }else{
      item.favorite = false;
      result = await _repoImp.removeFromFavorites(data);
    }
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
  void onInit() {
    super.onInit();
    searchController = TextEditingController();
  }

  @override
  void goToSearchScreen() {
    Get.offAndToNamed(AppRouteKeys.search);
  }

  @override
  void goToHomeScreen() {
    Get.offAndToNamed(AppRouteKeys.homeLayout, arguments: {'index': 2});
  }

  @override
  void goToItem(ItemViewModel item) {

    Get.toNamed(AppRouteKeys.itemSingle, arguments: {'single': item});
  }

}