import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/services/theme_colors.dart';
import 'package:flutter_e_commerce/core/shared/widgets/custom_input_field.dart';

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
      borderColor: ThemeColors.secondClr,
      prefixIcon: const Icon(Icons.email_outlined),
      hintText: 'Email',
      controller: emailController,
      inputKey: emailKey,
    );
  }
}
