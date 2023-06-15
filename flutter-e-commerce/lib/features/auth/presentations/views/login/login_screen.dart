import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/functions/alert_exit_app.dart';
import 'package:flutter_e_commerce/core/services/firebase/custom_firebase_messaging.dart';
import 'package:flutter_e_commerce/core/services/service_locator.dart';
import 'package:flutter_e_commerce/core/services/size_config.dart';
import 'package:flutter_e_commerce/core/services/theme_colors.dart';
import 'package:flutter_e_commerce/core/shared/widgets/custom_button.dart';
import 'package:flutter_e_commerce/core/shared/widgets/custom_text_button.dart';
import 'package:flutter_e_commerce/core/shared/widgets/handle_loading.dart';
import 'package:flutter_e_commerce/features/auth/presentations/view_models/controllers/login_controller.dart';
import 'package:flutter_e_commerce/features/auth/presentations/views/login/widgets/auth_logo.dart';
import 'package:flutter_e_commerce/features/auth/presentations/views/login/widgets/sign_in_email_input.dart';
import 'package:flutter_e_commerce/features/auth/presentations/views/login/widgets/sign_in_password_input.dart';
import 'package:flutter_e_commerce/features/auth/presentations/views/login/widgets/sign_in_text_header.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
    getIt<CustomFirebaseMessaging>().requestNotificationPermission();
    getIt<CustomFirebaseMessaging>().listenToFirebaseMessaging();
  }

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.put(LoginControllerImp());

    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: ThemeColors.primaryBg,
      appBar: AppBar(
        backgroundColor: ThemeColors.primaryBg,
        centerTitle: true,
        title: Text(
          '9'.tr,
          style: Theme.of(context)
              .textTheme
              .headlineLarge
              ?.copyWith(color: ThemeColors.secondaryText),
        ),
        elevation: 0,
      ),
      body: WillPopScope(
        onWillPop: () => alertExitApp(),
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  const AuthLogo(),
                  const SizedBox(
                    height: 30,
                  ),
                  const SignInTextHeader(),
                  const SizedBox(
                    height: 30,
                  ),
                  SignInEmailInput(
                      emailController: controller.emailController,
                      emailKey: controller.emailKey),
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
                  GetBuilder<LoginController>(
                    builder: (controller) {
                      return HandleLoading(
                        state: controller.state,
                        child: CustomButton(
                          text: '15'.tr,
                          borderRadius: 50,
                          onPress: () {
                            controller.login();
                          },
                          width: 100,
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextButton(
                    text: '${'16'.tr} ${'17'.tr}',
                    onPress: () {
                      controller.goToSignUp();
                    },
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
