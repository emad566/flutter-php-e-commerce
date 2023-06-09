import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/class/status_request.dart';
import 'package:flutter_e_commerce/core/constants/app_route_keys.dart';
import 'package:flutter_e_commerce/core/errors/failures.dart';
import 'package:flutter_e_commerce/features/auth/repos/reset_password_repo.dart';
import 'package:get/get.dart';

abstract class ResetPasswordController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late String email;
  AppStates state = AppInitialState();
  final ResetPasswordRepoImp _repoImp = ResetPasswordRepoImp(Get.find());

  void savePassword();
  Map<String, dynamic> get formatData => {
        'email': email,
        'password': passwordController.text,
      };
}

class ResetPasswordControllerImp extends ResetPasswordController {
  @override
  void onInit() {
    super.onInit();
    email = Get.arguments['email'];
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  @override
  void savePassword() async {
    if ((formKey.currentState?.validate()) ?? false) {
      state = AppLoadingState();
      update();
      Either<Failure, Map<String, dynamic>> result =
          await _repoImp.reset(formatData);

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
                      Get.offAllNamed(AppRouteKeys.successResetPassword);
                    },
                    child: const Text('Ok')),
              ]);
        }
      });
    }
  }
}
