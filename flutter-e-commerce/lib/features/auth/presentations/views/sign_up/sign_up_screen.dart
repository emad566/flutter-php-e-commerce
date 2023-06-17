import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/constants/app_validate_types.dart';
import 'package:flutter_e_commerce/core/functions/validator.dart';
import 'package:flutter_e_commerce/core/localization/app_lang_keys.dart';
import 'package:flutter_e_commerce/core/services/size_config.dart';
import 'package:flutter_e_commerce/core/services/theme_colors.dart';
import 'package:flutter_e_commerce/core/shared/widgets/custom_button.dart';
import 'package:flutter_e_commerce/core/shared/widgets/custom_text_field.dart';
import 'package:flutter_e_commerce/core/shared/widgets/custom_text_button.dart';
import 'package:flutter_e_commerce/core/shared/widgets/handle_loading.dart';
import 'package:flutter_e_commerce/features/auth/presentations/view_models/controllers/sign_up_controller.dart';
import 'package:flutter_e_commerce/features/auth/presentations/views/login/widgets/sign_in_email_input.dart';
import 'package:flutter_e_commerce/features/auth/presentations/views/login/widgets/sign_in_password_input.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignUpController controller = Get.put(SignUpControllerImp());

    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: ThemeColors.primaryBg,
      appBar: AppBar(
        backgroundColor: ThemeColors.primaryBg,
        centerTitle: true,
        title: Text(
          AppLangKeys.t17.tr,
          style: Theme.of(context)
              .textTheme
              .headlineLarge
              ?.copyWith(color: ThemeColors.secondaryText),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),

                // User Name
                CustomTextField(
                  validator: (val) => validateInput(
                    val: val,
                    type: AppValidateTypes.isUserName,
                    min: 3,
                    max: 50,
                  ),
                  borderColor: ThemeColors.secondClr,
                  keyboardType: TextInputType.name,
                  prefixIcon: const Icon(Icons.supervised_user_circle),
                  hintText: '20'.tr,
                  controller: controller.userNameController,
                  inputKey: controller.userNameKey,
                ),
                const SizedBox(
                  height: 30,
                ),

                SignInEmailInput(
                    emailController: controller.emailController,
                    emailKey: controller.emailKey),
                const SizedBox(
                  height: 30,
                ),
                // Phone
                CustomTextField(
                  validator: (val) => validateInput(
                    val: val,
                    type: AppValidateTypes.isPhone,
                    min: 10,
                    max: 50,
                  ),
                  keyboardType: TextInputType.phone,
                  borderColor: ThemeColors.secondClr,
                  prefixIcon: const Icon(Icons.phone),
                  hintText: '21'.tr,
                  controller: controller.phoneController,
                  inputKey: controller.phoneKey,
                ),
                const SizedBox(
                  height: 30,
                ),
                SignInPasswordInput(
                    passwordController: controller.passwordController,
                    passwordKey: controller.passwordKey),
                const SizedBox(
                  height: 30,
                ),

                CustomTextButton(
                  text: '14'.tr,
                  textAlign: TextAlign.end,
                  onPress: () {
                    controller.goToForgetPassword();
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                GetBuilder<SignUpController>(builder: (controller) {
                  return HandleLoading(
                    state: controller.state,
                    child: CustomButton(
                      text: '17'.tr,
                      borderRadius: 50,
                      onPress: () {
                        controller.signUp();
                      },
                      width: 100,
                    ),
                  );
                }),
                const SizedBox(
                  height: 30,
                ),
                CustomTextButton(
                  text: 'Already have account? Sign In.'.tr,
                  onPress: () {
                    controller.goToLogIn();
                  },
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
