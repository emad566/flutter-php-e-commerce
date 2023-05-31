import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/constants/app_validate_types.dart';
import 'package:flutter_e_commerce/core/functions/validator.dart';
import 'package:flutter_e_commerce/core/services/size_config.dart';
import 'package:flutter_e_commerce/core/services/theme_colors.dart';
import 'package:flutter_e_commerce/core/shared/widgets/custom_button.dart';
import 'package:flutter_e_commerce/core/shared/widgets/custom_input_field.dart';
import 'package:flutter_e_commerce/core/shared/widgets/handle_loading.dart';
import 'package:flutter_e_commerce/features/auth/presentations/view_models/controllers/forget_password_controllers/reset_password_controller.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({Key? key}) : super(key: key);
  GlobalKey<FormFieldState> passwordKey = GlobalKey<FormFieldState>();
  GlobalKey<FormFieldState> confirmPasswordKey = GlobalKey<FormFieldState>();

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
          'New Password'.tr,
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              color: ThemeColors.secondaryText
          ),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: SizeConfig.screenHeight-100,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: controller.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50,),
                Text(
                  'Fill the new password'.tr,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 30,),
                CustomTextField(
                  validator: (val)=> validateInput(
                    val: val,
                    type: AppValidateTypes.isPassword,
                    min: 3,
                    max: 8,
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  borderColor: ThemeColors.secondClr,
                  prefixIcon: const Icon(Icons.password_outlined),
                  isPassword: true,
                  hintText: '19'.tr,
                  controller: controller.passwordController,
                  inputKey: passwordKey,
                ),
                const SizedBox(height: 30,),
                CustomTextField(
                  validator: (val)=> validateInput(
                    val: val,
                    type: AppValidateTypes.isPassword,
                    min: 3,
                    max: 8,
                    confirm:controller.passwordController.text,
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  borderColor: ThemeColors.secondClr,
                  prefixIcon: const Icon(Icons.confirmation_num),
                  isPassword: true,
                  hintText: 'Confirm Password'.tr,
                  controller: controller.confirmPasswordController,
                  inputKey: confirmPasswordKey,
                ),
                const SizedBox(height: 30,),
                GetBuilder<ResetPasswordController>(
                    builder: (controller) {
                      return HandleLoading(
                        state: controller.state,
                        child:
                        CustomButton(
                          text: 'Send'.tr,
                          borderRadius: 50,
                          onPress: (){
                            controller.savePassword();
                          },
                          width: 100,
                        ),
                      );
                    }
                ),
                const SizedBox(height: 30,),

              ],
            ),
          ),
        ),
      ),
    );
  }
}






