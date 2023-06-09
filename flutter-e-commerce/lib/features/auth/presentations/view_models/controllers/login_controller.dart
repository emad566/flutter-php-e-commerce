import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/class/status_request.dart';
import 'package:flutter_e_commerce/core/constants/app_chaches.dart';
import 'package:flutter_e_commerce/core/constants/app_route_keys.dart';
import 'package:flutter_e_commerce/core/errors/failures.dart';
import 'package:flutter_e_commerce/core/services/cache_helper.dart';
import 'package:flutter_e_commerce/features/auth/repos/login_repo.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormFieldState> emailKey = GlobalKey<FormFieldState>();
  GlobalKey<FormFieldState> passwordKey = GlobalKey<FormFieldState>();
  AppStates state = AppInitialState();
  final LoginRepoImp _repoImp = LoginRepoImp(Get.find());

  late TextEditingController emailController;
  late TextEditingController passwordController;
  void login();
  void goToSignUp();
  void goToForgetPassword();

  Map<String, dynamic> get formatData => {
        'email': emailController.text,
        'password': passwordController.text,
      };
}

class LoginControllerImp extends LoginController {
  @override
  void goToForgetPassword() {
    Get.toNamed(AppRouteKeys.forgetPassword);
  }

  @override
  void goToSignUp() {
    Get.toNamed(AppRouteKeys.signUp);
  }

  @override
  void login() async {
    if ((formKey.currentState?.validate()) ?? false) {
      state = AppLoadingState();
      update();
      Either<Failure, Map<String, dynamic>> result =
          await _repoImp.login(formatData);

      result.fold((failure) {
        state = handleFailure(failure);
      }, (response) async {
        if (!response['status']) {
          Get.defaultDialog(
              title: 'Warning',
              middleText: response['message'],
              actions: [
                ElevatedButton(
                    onPressed: () => Get.back(), child: const Text('Ok')),
              ]);
          state = AppValidateFailureState(
              errors: response['errors'], errorMessage: response['message']);
          update();
        } else {
          cacheLoginData(response);

          Get.defaultDialog(
              title: 'Success',
              middleText: response['message'],
              actions: [
                ElevatedButton(
                    onPressed: () => Get.back(), child: const Text('Ok')),
              ]);

          state = AppSuccessState();
          Get.offAllNamed(AppRouteKeys.home);
        }
      });
    }
  }

  void cacheLoginData(Map<String, dynamic> response) {
    dynamic dataStr = jsonEncode(response['data']);
    CacheHelper.setData(AppCaches.loginCached, dataStr);
  }

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
}
