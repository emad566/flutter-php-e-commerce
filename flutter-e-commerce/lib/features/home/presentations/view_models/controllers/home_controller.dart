import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_e_commerce/core/class/status_request.dart';
import 'package:flutter_e_commerce/core/constants/app_route_keys.dart';
import 'package:flutter_e_commerce/core/errors/failures.dart';
import 'package:flutter_e_commerce/core/functions/empty_or_validate_state.dart';
import 'package:flutter_e_commerce/features/auth/data/models/login_cached_model.dart';
import 'package:flutter_e_commerce/features/home/data/models/home_model/category_model.dart';
import 'package:flutter_e_commerce/features/home/data/models/home_model/home_model.dart';
import 'package:flutter_e_commerce/features/home/data/models/home_model/item_view_model.dart';
import 'package:flutter_e_commerce/features/home/data/repos/home_repo.dart';
import 'package:flutter_e_commerce/features/items/presentations/view_models/controllers/items_controller.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController{
  GlobalKey<FormFieldState> searchKey = GlobalKey<FormFieldState>();
  late TextEditingController searchController;

  AppStates state = AppInitialState();
  final LoginCachedModel loginCached = LoginCachedModel.fromJson();

  final HomeRepoImp _repoImp = HomeRepoImp(Get.find());
  List<CategoryModel> categories = [];
  List<ItemViewModel> items = [];
  void list(Map<String, dynamic> data);
  void goToItems(int index);
  void goToItem(ItemViewModel item);

}

class HomeControllerImp extends HomeController{

  @override
  void list(Map<String, dynamic> data) async {
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
        HomeModel homeModel = HomeModel.fromJson(response);
        _setCategories(homeModel);
        _setItems(homeModel);
        state = AppSuccessState();
        update();
      }
    });
  }

  void _setCategories(HomeModel homeModel) {
    if (homeModel.categories != null) {
      categories = homeModel.categories!.status ? homeModel.categories!.data! : [];
    } else {
      categories = [];
    }
  }

  void _setItems(HomeModel homeModel) {
    if (homeModel.items != null) {
      items = homeModel.items!.status ? homeModel.items!.data : [];
    } else {
      items = [];
    }
  }

  @override
  void goToItems(int index) {
    Get.delete<ItemsControllerImp>();
    Get.toNamed(
      AppRouteKeys.items,
      arguments: {
        "selectedCategoryIndex": index,
        "categories": categories,
      },
    );
  }

  @override
  void goToItem(ItemViewModel item) {
    Get.toNamed(AppRouteKeys.itemSingle, arguments: {'single': item});
  }

  @override
  void onInit() {
    categories=[];
    super.onInit();
    searchController = TextEditingController();
    list({'usersid': loginCached.usersId});
    update();
  }


}