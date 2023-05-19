import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/constants/app_validate_types.dart';
import 'package:flutter_e_commerce/core/functions/validator.dart';
import 'package:flutter_e_commerce/core/services/theme_colors.dart';
import 'package:flutter_e_commerce/core/shared/widgets/custom_input_field.dart';
import 'package:get/get.dart';

class SignInPasswordInput extends StatelessWidget {
  const SignInPasswordInput({
    super.key,
    required this.passwordController,
    required this.passwordKey,
  });

  final TextEditingController passwordController;
  final GlobalKey<FormFieldState> passwordKey;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      validator: (val)=> validateInput(
        val: val,
        type: AppValidateTypes.isPassword,
        min: 8,
        max: 12,
      ),
      borderColor: ThemeColors.secondClr,
      keyboardType: TextInputType.visiblePassword,
      prefixIcon: const Icon(Icons.password_outlined),
      isPassword: true,
      hintText: '19'.tr,
      controller: passwordController,
      inputKey: passwordKey,
    );
  }
}
