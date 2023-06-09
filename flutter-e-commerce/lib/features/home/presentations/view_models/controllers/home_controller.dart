import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_e_commerce/core/class/status_request.dart';
import 'package:flutter_e_commerce/core/errors/failures.dart';
import 'package:flutter_e_commerce/features/home/data/models/home_model/category_model.dart';
import 'package:flutter_e_commerce/features/home/data/models/home_model/home_model.dart';
import 'package:flutter_e_commerce/features/home/repos/home_repo.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController{
  GlobalKey<FormFieldState> searchKey = GlobalKey<FormFieldState>();
  late TextEditingController searchController;

  AppStates state = AppInitialState();
  final HomeRepoImp _repoImp = HomeRepoImp(Get.find());
  List<CategoryModel> categories = [];
  void list();
}

class HomeControllerImp extends HomeController{

  @override
  void list() async {
    state = AppLoadingState();
    update();
    Either<Failure, Map<String, dynamic>> result = await _repoImp.list();
    result.fold((failure) {
      state = handleFailure(failure);
    }, (response) async {
      if (!response['status']) {
        state = AppValidateFailureState(errors: response['errors'], errorMessage: response['message']);
        update();
      } else {
        HomeModel homeModel = HomeModel.fromJson(response);
        _setCategories(homeModel);
        state = AppSuccessState();
        update();
      }
    });
  }

  void _setCategories(HomeModel homeModel) {
    if (homeModel.categories != null) {
      categories =
          homeModel.categories!.status ? homeModel.categories!.data! : [];
    } else {
      categories = [];
    }
  }


  @override
  void onInit() {
    super.onInit();
    searchController = TextEditingController();
    list();
  }
}