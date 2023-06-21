import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_e_commerce/core/class/status_request.dart';
import 'package:flutter_e_commerce/core/constants/app_route_keys.dart';
import 'package:flutter_e_commerce/core/errors/failures.dart';
import 'package:flutter_e_commerce/core/functions/empty_or_validate_state.dart';
import 'package:flutter_e_commerce/features/auth/data/models/login_cached_model.dart';
import 'package:flutter_e_commerce/features/home/data/models/home_model/category_model.dart';
import 'package:flutter_e_commerce/features/home/data/models/home_model/item_view_model.dart';
import 'package:flutter_e_commerce/features/home/data/models/home_model/items_view_model.dart';
import 'package:flutter_e_commerce/features/items/data/repos/items_repo.dart';
import 'package:get/get.dart';

abstract class ItemsController extends GetxController{
  GlobalKey<FormFieldState> searchKey = GlobalKey<FormFieldState>();
  late TextEditingController searchController;

  AppStates state = AppInitialState();
  final LoginCachedModel loginCached = LoginCachedModel.fromJson();


  final ItemsRepoImp _repoImp = ItemsRepoImp(Get.find());
  late int selectedCategoryIndex;
  List<CategoryModel> categories= [];

  void updateSelectedCategoryIndex(int index);

  List<ItemViewModel> items= [];
  void list(Map<String, dynamic> data);
  void toggleFavorite(ItemViewModel item);
  void goToItem(ItemViewModel item);
}

class ItemsControllerImp extends ItemsController{

  @override
  void list(Map<String, dynamic> data) async {
    state = AppLoadingState();
    update();
    Either<Failure, Map<String, dynamic>> result = await _repoImp.list(data);
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
    selectedCategoryIndex = Get.arguments['selectedCategoryIndex']?? 0;
    categories = Get.arguments['categories']?? [];
    LoginCachedModel loginCached = LoginCachedModel.fromJson();
    if(categories.isNotEmpty){
      list({"categories_id": categories[selectedCategoryIndex].categoriesId, 'usersid':loginCached.usersId });
    }
  }

  @override
  void updateSelectedCategoryIndex(int index){
    selectedCategoryIndex = index;
    LoginCachedModel loginCached = LoginCachedModel.fromJson();
    list({"categories_id": categories[selectedCategoryIndex].categoriesId, 'usersid':loginCached.usersId });
  }

  @override
  void goToItem(ItemViewModel item) {
    
    Get.toNamed(AppRouteKeys.itemSingle, arguments: {'single': item});
  }
}