import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/services/size_config.dart';
import 'package:flutter_e_commerce/core/services/theme_colors.dart';
import 'package:flutter_e_commerce/core/shared/widgets/custom_button.dart';
import 'package:flutter_e_commerce/core/shared/widgets/custom_text_button.dart';
import 'package:flutter_e_commerce/features/auth/presentations/view_models/controllers/reset_password_controller.dart';
import 'package:flutter_e_commerce/features/auth/presentations/views/login/widgets/auth_logo.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({Key? key}) : super(key: key);
  GlobalKey formKey = GlobalKey<FormState>();
  GlobalKey<FormFieldState> emailKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    ResetPasswordController controller = Get.put(ResetPasswordControllerImp());

    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: ThemeColors.primaryBg,
      appBar: AppBar(
        backgroundColor: ThemeColors.primaryBg,
        centerTitle: true,
        title: Text(
          '14'.tr,
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
                const AuthLogo(),
                const SizedBox(height: 50,),

                const SizedBox(height: 30,),
                CustomTextButton(
                  text: 'You could create new account'.tr,
                  textAlign: TextAlign.end,
                  onPress: (){

                  },
                ),
                const SizedBox(height: 30,),
                CustomButton(
                  text: 'Send'.tr,
                  borderRadius: 50,
                  onPress: (){

                  },
                  width: 100,
                ),
                const SizedBox(height: 30,),
                CustomTextButton(
                  text: 'Do you remember password? login.'.tr,
                  onPress: (){

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






