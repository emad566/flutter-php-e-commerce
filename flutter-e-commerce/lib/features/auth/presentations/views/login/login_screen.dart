import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/services/size_config.dart';
import 'package:flutter_e_commerce/core/services/theme_colors.dart';
import 'package:flutter_e_commerce/core/shared/widgets/custom_button.dart';
import 'package:flutter_e_commerce/core/shared/widgets/custom_text_button.dart';
import 'package:flutter_e_commerce/features/auth/presentations/views/login/widgets/auth_logo.dart';
import 'package:flutter_e_commerce/features/auth/presentations/views/login/widgets/sign_in_email_input.dart';
import 'package:flutter_e_commerce/features/auth/presentations/views/login/widgets/sign_in_password_input.dart';
import 'package:flutter_e_commerce/features/auth/presentations/views/login/widgets/sign_in_text_header.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey formKey = GlobalKey<FormState>();
  GlobalKey<FormFieldState> emailKey = GlobalKey<FormFieldState>();
  GlobalKey<FormFieldState> passwordKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: ThemeColors.primaryBg,
      appBar: AppBar(
        backgroundColor: ThemeColors.primaryBg,
        centerTitle: true,
        title: Text(
          'Sign In',
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
                SignInEmailInput(emailController: emailController, emailKey: emailKey),
                const SizedBox(height: 30,),
                SignInPasswordInput(passwordController: passwordController, passwordKey: passwordKey),
                const SizedBox(height: 30,),
                CustomTextButton(
                  text: 'Forget Password',
                  textAlign: TextAlign.end,
                  onPress: (){

                  },
                ),
                const SizedBox(height: 30,),
                CustomButton(
                  text: 'Sign In',
                  borderRadius: 50,
                  onPress: (){

                  },
                  width: 100,
                ),
                const SizedBox(height: 30,),
                CustomTextButton(
                  text: 'Don\'t have account? create one.',
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






