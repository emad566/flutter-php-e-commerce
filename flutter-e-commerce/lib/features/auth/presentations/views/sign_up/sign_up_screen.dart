import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/services/size_config.dart';
import 'package:flutter_e_commerce/core/services/theme_colors.dart';
import 'package:flutter_e_commerce/core/shared/widgets/custom_button.dart';
import 'package:flutter_e_commerce/core/shared/widgets/custom_input_field.dart';
import 'package:flutter_e_commerce/core/shared/widgets/custom_text_button.dart';
import 'package:flutter_e_commerce/features/auth/presentations/view_models/controllers/sign_up_controller.dart';
import 'package:flutter_e_commerce/features/auth/presentations/views/login/widgets/sign_in_email_input.dart';
import 'package:flutter_e_commerce/features/auth/presentations/views/login/widgets/sign_in_password_input.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  GlobalKey formKey = GlobalKey<FormState>();
  GlobalKey<FormFieldState> userNameKey = GlobalKey<FormFieldState>();
  GlobalKey<FormFieldState> phoneKey = GlobalKey<FormFieldState>();
  GlobalKey<FormFieldState> emailKey = GlobalKey<FormFieldState>();
  GlobalKey<FormFieldState> passwordKey = GlobalKey<FormFieldState>();

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
          '17'.tr,
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
                const SizedBox(height: 50,),

                // User Name
                CustomTextField(
                  borderColor: ThemeColors.secondClr,
                  prefixIcon: const Icon(Icons.supervised_user_circle),
                  hintText: '20'.tr,
                  controller: controller.userNameController,
                  inputKey: userNameKey,
                ),
                const SizedBox(height: 30,),

                SignInEmailInput(emailController: controller.emailController, emailKey: emailKey),
                const SizedBox(height: 30,),
                // Phone
                CustomTextField(
                  borderColor: ThemeColors.secondClr,
                  prefixIcon: const Icon(Icons.phone),
                  hintText: '21'.tr,
                  controller: controller.phoneController,
                  inputKey: phoneKey,
                ),
                const SizedBox(height: 30,),
                SignInPasswordInput(passwordController: controller.passwordController, passwordKey: passwordKey),
                const SizedBox(height: 30,),
                CustomTextButton(
                  text: '14'.tr,
                  textAlign: TextAlign.end,
                  onPress: (){
                    controller.goToForgetPassword();
                  },
                ),
                const SizedBox(height: 30,),
                CustomButton(
                  text: '17'.tr,
                  borderRadius: 50,
                  onPress: (){
                    controller.signUp();
                  },
                  width: 100,
                ),
                const SizedBox(height: 30,),
                CustomTextButton(
                  text: 'Already have account? Sign In.'.tr,
                  onPress: (){
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






