import 'package:flutter/cupertino.dart';
import 'package:flutter_e_commerce/core/constants/app_route_keys.dart';
import 'package:flutter_e_commerce/features/auth/presentations/views/check_email/check_email_screen.dart';
import 'package:flutter_e_commerce/features/auth/presentations/views/forgetpassword/forget_password/forget_password_screen.dart';
import 'package:flutter_e_commerce/features/auth/presentations/views/login/login_screen.dart';
import 'package:flutter_e_commerce/features/auth/presentations/views/forgetpassword/reset_password/reset_password_screen.dart';
import 'package:flutter_e_commerce/features/auth/presentations/views/sign_up/sign_up_screen.dart';
import 'package:flutter_e_commerce/features/auth/presentations/views/forgetpassword/success_reset_password/success_reset_password_screen.dart';
import 'package:flutter_e_commerce/features/auth/presentations/views/success_sign_up/success_sign_up_screen.dart';
import 'package:flutter_e_commerce/features/auth/presentations/views/forgetpassword/veryfy_code/verify_code_screen.dart';
import 'package:flutter_e_commerce/features/on_boarding/presentations/views/on_boarding_screen.dart';

abstract class AppRoutes{
  static Map<String, Widget Function(BuildContext)> routes = {
    AppRouteKeys.onBoarding: (context)=> const OnBoardingScreen(),
    AppRouteKeys.login: (context)=> LoginScreen(),
    AppRouteKeys.signUp: (context)=> SignUpScreen(),
    AppRouteKeys.forgetPassword: (context)=> ForgetPasswordScreen(),
    AppRouteKeys.verifyCode: (context)=> VerifyCodeScreen(),
    AppRouteKeys.resetPassword: (context)=> ResetPasswordScreen(),
    AppRouteKeys.successSignUp: (context)=> const SuccessSignUpScreen(),
    AppRouteKeys.successResetPassword: (context)=> const SuccessResetPasswordScreen(),
    AppRouteKeys.checkEmail: (context)=> CheckEmailScreen(),

  };
}