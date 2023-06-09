import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/class/status_request.dart';
import 'package:flutter_e_commerce/core/constants/app_route_keys.dart';
import 'package:flutter_e_commerce/core/errors/failures.dart';
import 'package:flutter_e_commerce/features/auth/repos/forget_password_repo.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController emailController;
  AppStates state = AppInitialState();
  final ForgetPasswordRepoImp _repoImp = ForgetPasswordRepoImp(Get.find());
  Map<String, dynamic> get formatData => {
        'email': emailController.text,
      };

  void checkEmail();
  void goToSignUp();
  void goToLogin();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  @override
  void goToLogin() {
    Get.offAllNamed(AppRouteKeys.login);
  }

  @override
  void goToSignUp() {
    Get.offAndToNamed(AppRouteKeys.signUp);
  }

  @override
  void checkEmail() async {
    if ((formKey.currentState?.validate()) ?? false) {
      state = AppLoadingState();
      update();
      Either<Failure, Map<String, dynamic>> result =
          await _repoImp.forgetPassword(formatData);

      result.fold((failure) {
        state = handleFailure(failure);
        if (state is AppServerFailureState) {
          Get.defaultDialog(
              title: 'Error',
              middleText: (state as AppServerFailureState).errorMessage,
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text('Ok')),
              ]);
        }
        update();
      }, (response) async {
        if (!response['status']) {
          Get.defaultDialog(
              title: 'Warning',
              middleText: response['message'],
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Get.back();
                      state = AppValidateFailureState(
                          errors: response['errors'],
                          errorMessage: response['message']);
                      update();
                    },
                    child: const Text('Ok')),
              ]);
        } else {
          Get.defaultDialog(
              title: 'Success',
              middleText: response['message'],
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Get.back();
                      state = AppSuccessState();
                      update();
                      Get.offAllNamed(AppRouteKeys.verifyCode,
                          arguments: {'email': formatData['email']});
                    },
                    child: const Text('Ok')),
              ]);
        }
      });
    }
  }

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
  }
}
