import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/services/size_config.dart';
import 'package:flutter_e_commerce/core/services/theme_colors.dart';
import 'package:flutter_e_commerce/core/shared/widgets/custom_button.dart';
import 'package:flutter_e_commerce/core/shared/widgets/custom_text_button.dart';
import 'package:flutter_e_commerce/features/auth/presentations/view_models/controllers/login_controller.dart';
import 'package:flutter_e_commerce/features/auth/presentations/views/login/widgets/auth_logo.dart';
import 'package:flutter_e_commerce/features/auth/presentations/views/login/widgets/sign_in_email_input.dart';
import 'package:flutter_e_commerce/features/auth/presentations/views/login/widgets/sign_in_password_input.dart';
import 'package:flutter_e_commerce/features/auth/presentations/views/login/widgets/sign_in_text_header.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  GlobalKey formKey = GlobalKey<FormState>();
  GlobalKey<FormFieldState> emailKey = GlobalKey<FormFieldState>();
  GlobalKey<FormFieldState> passwordKey = GlobalKey<FormFieldState>();

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
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
            color: ThemeColors.secondaryText
          ),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const AuthLogo(),
                const SizedBox(height: 30,),
                const SignInTextHeader(),
                const SizedBox(height: 30,),
                SignInEmailInput(emailController: controller.emailController, emailKey: emailKey),
                const SizedBox(height: 30,),
                SignInPasswordInput(passwordController: controller.passwordController, passwordKey: passwordKey),
                const SizedBox(height: 30,),
                CustomTextButton(
                  text: '14'.tr,
                  textAlign: TextAlign.end,
                  onPress: (){

                  },
                ),
                const SizedBox(height: 30,),
                CustomButton(
                  text: '15'.tr,
                  borderRadius: 50,
                  onPress: (){

                  },
                  width: 100,
                ),
                const SizedBox(height: 30,),
                CustomTextButton(
                  text: '${'16'.tr} ${'17'.tr}',
                  onPress: (){
                    controller.goToSignUp();
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






