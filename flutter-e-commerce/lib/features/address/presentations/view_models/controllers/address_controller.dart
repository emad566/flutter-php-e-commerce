import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerce/core/class/status_request.dart';
import 'package:flutter_e_commerce/core/constants/app_route_keys.dart';
import 'package:flutter_e_commerce/core/errors/failures.dart';
import 'package:flutter_e_commerce/core/functions/empty_or_validate_state.dart';
import 'package:flutter_e_commerce/features/address/data/models/address_list_model/address_list_model.dart';
import 'package:flutter_e_commerce/features/address/data/models/address_list_model/address_model.dart';
import 'package:flutter_e_commerce/features/address/data/repos/address_repo.dart';
import 'package:flutter_e_commerce/features/auth/data/models/login_cached_model.dart';
import 'package:get/get.dart';

abstract class AddressController extends GetxController{
  AppStates state = AppInitialState();
  final LoginCachedModel loginCached = LoginCachedModel.fromJson();
  final AddressRepoImp _repoImp = AddressRepoImp(Get.find());
  List<AddressModel> listData= [];
  void list();
  void delete(String id);
  void goToCreateScreen();
}

class AddressControllerImp extends AddressController{

  @override
  void list() async {
    state = AppLoadingState();
    update();
    Map<String, dynamic> data = {'usersid': loginCached.usersId};

    Either<Failure, Map<String, dynamic>> result = await _repoImp.list(data);
    result.fold((failure) {
      state = handleFailure(failure);
      update();
    }, (response) async {
      if (!response['status']) {
        state = emptyOrValidateState(response);
        update();
      } else {
        listData = AddressListModel.fromJson(response).data;
        state = AppSuccessState();
        update();
      }
    });
  }

  @override
  void delete(String id) async {
    state = AppLoadingState(loadingLevel: int.parse(id.toString()));
    update();
    Map<String, dynamic> data = {'addressid': id};

    Either<Failure, Map<String, dynamic>> result = await _repoImp.delete(data);
    result.fold((failure) {
      state = handleFailure(failure);
      update();
    }, (response) async {
      if (!response['status']) {
        state = emptyOrValidateState(response);
        update();
      } else {
        listData.removeWhere((element) => element.addressId == id);
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

  @override
  void goToCreateScreen() {
    Get.toNamed(AppRouteKeys.addressCreate);
  }
}