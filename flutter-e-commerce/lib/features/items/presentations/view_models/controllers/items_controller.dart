import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_e_commerce/core/class/status_request.dart';
import 'package:flutter_e_commerce/core/constants/app_route_keys.dart';
import 'package:flutter_e_commerce/core/errors/failures.dart';
import 'package:flutter_e_commerce/core/functions/empty_or_validate_state.dart';
import 'package:flutter_e_commerce/features/home/data/models/home_model/category_model.dart';
import 'package:flutter_e_commerce/features/home/data/models/home_model/item_view_model.dart';
import 'package:flutter_e_commerce/features/home/data/models/home_model/items_view_model.dart';
import 'package:flutter_e_commerce/features/items/data/repos/items_repo.dart';
import 'package:get/get.dart';

abstract class ItemsController extends GetxController{
  GlobalKey<FormFieldState> searchKey = GlobalKey<FormFieldState>();
  late TextEditingController searchController;

  AppStates state = AppInitialState();
  final ItemsRepoImp _repoImp = ItemsRepoImp(Get.find());
  late int selectedCategoryIndex;
  List<CategoryModel> categories= [];
  List<ItemViewModel> items= [];
  void updateSelectedCategoryIndex(int index);

  void list(Map<String, dynamic> data);
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
    searchController = TextEditingController();
    selectedCategoryIndex = Get.arguments['selectedCategoryIndex'];
    categories = Get.arguments['categories'];
    list({"categories_id": categories[selectedCategoryIndex].categoriesId});
  }

  @override
  void updateSelectedCategoryIndex(int index){
    selectedCategoryIndex = index;
    list({"categories_id": categories[selectedCategoryIndex].categoriesId});
    update();
  }

  @override
  void goToItem(ItemViewModel item) {
    Get.toNamed(AppRouteKeys.itemSingle, arguments: {'single': item});
  }
}