import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/services/size_config.dart';
import 'package:flutter_e_commerce/core/services/theme_colors.dart';
import 'package:flutter_e_commerce/core/shared/widgets/custom_button.dart';
import 'package:flutter_e_commerce/core/shared/widgets/custom_text_button.dart';
import 'package:flutter_e_commerce/core/shared/widgets/handle_loading.dart';
import 'package:flutter_e_commerce/features/auth/presentations/view_models/controllers/forget_password_controllers/forget_password_controller.dart';
import 'package:flutter_e_commerce/features/auth/presentations/views/login/widgets/sign_in_email_input.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({Key? key}) : super(key: key);
  GlobalKey<FormFieldState> emailKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    ForgetPasswordController controller = Get.put(ForgetPasswordControllerImp());

    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: ThemeColors.primaryBg,
      appBar: AppBar(
        backgroundColor: ThemeColors.primaryBg,
        centerTitle: true,
        title: Text(
          'Request Rest Password'.tr,
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              color: ThemeColors.secondaryText
          ),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: SizeConfig.screenHeight-100,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: controller.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50,),
                Text(
                  'Please enter your email to reset password'.tr,
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 50,),


                SignInEmailInput(emailController: controller.emailController, emailKey: emailKey),
                const SizedBox(height: 30,),
                GetBuilder<ForgetPasswordController>(
                    builder: (controller) {
                      return HandleLoading(
                        state: controller.state,
                        child: CustomButton(
                          text: 'Check'.tr,
                          borderRadius: 50,
                          onPress: (){
                            controller.checkEmail();
                          },
                          width: 100,
                        ),
                      );
                    }
                ),


                const SizedBox(height: 30,),
                CustomTextButton(
                  text: 'Do you remember password? login.'.tr,
                  onPress: (){
                    controller.goToLogin();
                  },
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30,),
                CustomTextButton(
                  text: 'You could create new account'.tr,
                  textAlign: TextAlign.center,
                  onPress: (){
                    controller.goToSignUp();
                  },
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}






