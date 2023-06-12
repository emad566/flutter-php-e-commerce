import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/class/status_request.dart';
import 'package:flutter_e_commerce/core/errors/failures.dart';
import 'package:flutter_e_commerce/core/functions/empty_or_validate_state.dart';
import 'package:flutter_e_commerce/features/home/data/models/home_model/item_view_model.dart';
import 'package:flutter_e_commerce/features/item_single/data/repos/items_repo.dart';
import 'package:get/get.dart';

abstract class ItemSingleController extends GetxController{
  AppStates state = AppInitialState();
  final ItemSingleRepoImp _repoImp = ItemSingleRepoImp(Get.find());
  late ItemViewModel single;
  void getSingle(Map<String, dynamic> data);
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
      state = handleFailure(failure);
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