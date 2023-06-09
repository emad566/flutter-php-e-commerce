import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/class/status_request.dart';
import 'package:flutter_e_commerce/core/constants/app_route_keys.dart';
import 'package:flutter_e_commerce/core/errors/failures.dart';
import 'package:flutter_e_commerce/features/auth/repos/sign_up_repo.dart';
import 'package:get/get.dart';

abstract class SignUpController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormFieldState> userNameKey = GlobalKey<FormFieldState>();
  GlobalKey<FormFieldState> phoneKey = GlobalKey<FormFieldState>();
  GlobalKey<FormFieldState> emailKey = GlobalKey<FormFieldState>();
  GlobalKey<FormFieldState> passwordKey = GlobalKey<FormFieldState>();

  late TextEditingController userNameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController passwordController;

  AppStates state = AppInitialState();
  final SignUpRepoImp _repoImp = SignUpRepoImp(Get.find());

  Map<String, dynamic> get formatData => {
        'username': userNameController.text,
        'email': emailController.text,
        'phone': phoneController.text,
        'password': passwordController.text,
      };

  void signUp();
  void goToLogIn();
  void goToForgetPassword();
}

class SignUpControllerImp extends SignUpController {
  @override
  void goToForgetPassword() {
    Get.offAndToNamed(AppRouteKeys.forgetPassword);
  }

  @override
  void goToLogIn() {
    Get.offAllNamed(AppRouteKeys.login);
  }

  @override
  void signUp() async {
    if ((formKey.currentState?.validate()) ?? false) {
      state = AppLoadingState();
      update();
      Either<Failure, Map<String, dynamic>> result =
          await _repoImp.register(formatData);

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
          Get.defaultDialog(
              title: 'Success',
              middleText: response['message'],
              actions: [
                ElevatedButton(
                    onPressed: () => Get.back(), child: const Text('Ok')),
              ]);

          state = AppSuccessState();
          Get.offNamed(AppRouteKeys.checkEmail,
              arguments: {'email': formatData['email']});
        }
      });
    }
  }

  @override
  void onInit() {
    super.onInit();
    userNameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    userNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
  }
}
