import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/constants/app_validate_types.dart';
import 'package:flutter_e_commerce/core/functions/validator.dart';
import 'package:flutter_e_commerce/core/services/theme_colors.dart';
import 'package:flutter_e_commerce/core/shared/widgets/custom_input_field.dart';
import 'package:get/get.dart';

class SignInEmailInput extends StatelessWidget {
  const SignInEmailInput({
    super.key,
    required this.emailController,
    required this.emailKey,
  });

  final TextEditingController emailController;
  final GlobalKey<FormFieldState> emailKey;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      validator: (val)=> validateInput(
        val: val,
        type: AppValidateTypes.isEmail,
        min: 4,
        max: 50,
      ),
      borderColor: ThemeColors.secondClr,
      keyboardType: TextInputType.emailAddress,
      prefixIcon: const Icon(Icons.email_outlined),
      hintText: '18'.tr,
      controller: emailController,
      inputKey: emailKey,
    );
  }
}
