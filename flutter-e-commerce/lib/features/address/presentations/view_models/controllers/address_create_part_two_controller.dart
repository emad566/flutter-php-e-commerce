import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/class/status_request.dart';
import 'package:flutter_e_commerce/core/constants/app_route_keys.dart';
import 'package:flutter_e_commerce/core/errors/failures.dart';
import 'package:flutter_e_commerce/core/functions/empty_or_validate_state.dart';
import 'package:flutter_e_commerce/features/address/data/repos/address_repo.dart';
import 'package:flutter_e_commerce/features/address/presentations/view_models/controllers/address_controller.dart';
import 'package:flutter_e_commerce/features/auth/data/models/login_cached_model.dart';
import 'package:get/get.dart';

abstract class AddressCreatePartTwoController extends GetxController{
  AppStates state = AppInitialState();

  GlobalKey<FormFieldState> nameKey = GlobalKey<FormFieldState>();
  late TextEditingController nameController;
  GlobalKey<FormFieldState> cityKey = GlobalKey<FormFieldState>();
  late TextEditingController cityController;
  GlobalKey<FormFieldState> streetKey = GlobalKey<FormFieldState>();
  late TextEditingController streetController;

  late double lat;
  late double lng;

  final LoginCachedModel loginCached = LoginCachedModel.fromJson();
  final AddressRepoImp _repoImp = AddressRepoImp(Get.find());
  void store();
}

class AddressCreatePartTwoControllerImp extends AddressCreatePartTwoController{

  @override
  void store() async {
    state = AppLoadingState();
    update();
    Map<String, dynamic> data = {
      'usersid': loginCached.usersId,
      'name': nameController.text,
      'city': cityController.text,
      'street': streetController.text,
    };

    Either<Failure, Map<String, dynamic>> result = await _repoImp.store(data);
    result.fold((failure) {
      state = handleFailure(failure);
      update();
    }, (response) async {
      if (!response['status']) {
        state = emptyOrValidateState(response);
        update();
      } else {
        Get.defaultDialog(
            title: 'Success',
            middleText: response['message'],
            actions: [
              ElevatedButton(onPressed: () => Get.back(), child: const Text('Ok')),
            ],
        );

        Get.delete<AddressControllerImp>();
        Get.close(2);
        Get.offNamed(AppRouteKeys.address);
        state = AppSuccessState();
        update();
      }
    });
  }


  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    cityController = TextEditingController();
    streetController = TextEditingController();
    lat = Get.arguments['lat'];
    lng = Get.arguments['lng'];

  }
}