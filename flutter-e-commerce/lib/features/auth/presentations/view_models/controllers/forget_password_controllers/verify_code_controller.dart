import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/class/status_request.dart';
import 'package:flutter_e_commerce/core/constants/api_links.dart';
import 'package:flutter_e_commerce/core/constants/app_route_keys.dart';
import 'package:flutter_e_commerce/core/errors/failures.dart';
import 'package:flutter_e_commerce/core/services/api_services.dart';
import 'package:get/get.dart';

abstract class VerifyCodeController extends GetxController {
  void checkEmail(String code);
  AppStates state = AppInitialState();
  ApiService apiService;
  VerifyCodeController(this.apiService);
}

class VerifyCodeControllerImp extends VerifyCodeController {
  VerifyCodeControllerImp(super.apiService);
  late String email;
  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }

  @override
  void checkEmail(String code) async {
    state = AppLoadingState();
    update();

    Map<String, dynamic> data = {"email": email, "verifycode": code};

    Either<Failure, Map<String, dynamic>> result = await apiService.ajax(
      requestType: RequestType.post,
      endPoint: ApiLinks.forgetPasswordVerifyCode,
      data: data,
    );

    result.fold((failure) {
      state = handleFailure(failure);update();
    }, (response) async {
      if (!response['status']) {
        Get.defaultDialog(
            title: 'Warning',
            middleText: response['message'],
            actions: [
              ElevatedButton(
                  onPressed: () => Get.back(), child: const Text('Ok')),
            ]);
      } else {
        Get.offNamed(AppRouteKeys.resetPassword, arguments: {'email': email});
      }
    });
  }
}
