import 'package:flutter_e_commerce/core/constants/app_route_keys.dart';
import 'package:flutter_e_commerce/core/middleware/app_middleware.dart';
import 'package:flutter_e_commerce/features/auth/presentations/views/check_email/check_email_screen.dart';
import 'package:flutter_e_commerce/features/auth/presentations/views/forgetpassword/forget_password/forget_password_screen.dart';
import 'package:flutter_e_commerce/features/auth/presentations/views/login/login_screen.dart';
import 'package:flutter_e_commerce/features/auth/presentations/views/forgetpassword/reset_password/reset_password_screen.dart';
import 'package:flutter_e_commerce/features/auth/presentations/views/sign_up/sign_up_screen.dart';
import 'package:flutter_e_commerce/features/auth/presentations/views/forgetpassword/success_reset_password/success_reset_password_screen.dart';
import 'package:flutter_e_commerce/features/auth/presentations/views/success_sign_up/success_sign_up_screen.dart';
import 'package:flutter_e_commerce/features/auth/presentations/views/forgetpassword/veryfy_code/verify_code_screen.dart';
import 'package:flutter_e_commerce/features/cart/presentations/views/cart_screen.dart';
import 'package:flutter_e_commerce/features/choose_language/presentations/views/choose_language_screen.dart';
import 'package:flutter_e_commerce/features/home/presentations/views/home_screen.dart';
import 'package:flutter_e_commerce/features/home_layout/presentations/views/home_layout_screen.dart';
import 'package:flutter_e_commerce/features/item_single/presentations/views/item_single_screen.dart';
import 'package:flutter_e_commerce/features/items/presentations/views/items_screen.dart';
import 'package:flutter_e_commerce/features/on_boarding/presentations/views/on_boarding_screen.dart';
import 'package:flutter_e_commerce/features/search/presentations/views/search_screen.dart';
import 'package:flutter_e_commerce/features/settings/presentations/views/settings_screen.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? appRoutes = [
  GetPage(
      name: '/',
      page: () => const ChooseLanguageScreen(),
      middlewares: [AppMiddleware()]),
  GetPage(name: AppRouteKeys.onBoarding, page: () => const OnBoardingScreen()),
  GetPage(name: AppRouteKeys.login, page: () => const LoginScreen()),
  GetPage(name: AppRouteKeys.signUp, page: () => const SignUpScreen()),
  GetPage(
    name: AppRouteKeys.forgetPassword,
    page: () => ForgetPasswordScreen(),
  ),
  GetPage(
    name: AppRouteKeys.verifyCode,
    page: () => VerifyCodeScreen(),
  ),
  GetPage(
    name: AppRouteKeys.resetPassword,
    page: () => ResetPasswordScreen(),
  ),
  GetPage(
      name: AppRouteKeys.successSignUp,
      page: () => const SuccessSignUpScreen()),
  GetPage(
      name: AppRouteKeys.successResetPassword,
      page: () => const SuccessResetPasswordScreen()),
  GetPage(
    name: AppRouteKeys.checkEmail,
    page: () => const CheckEmailScreen(),
  ),
  GetPage(
    name: AppRouteKeys.home,
    page: () => const HomeScreen(),
  ),
  GetPage(
    name: AppRouteKeys.homeLayout,
    page: () => const HomeLayoutScreen(),
  ),
  GetPage(
    name: AppRouteKeys.items,
    page: () => const ItemsScreen(),
  ),
  GetPage(
    name: AppRouteKeys.itemSingle,
    page: () => const ItemSingleScreen(),
  ),
  GetPage(
    name: AppRouteKeys.settings,
    page: () => const SettingsScreen(),
  ),
  GetPage(
    name: AppRouteKeys.cart,
    page: () => const CartScreen(),
  ),
  GetPage(
    name: AppRouteKeys.search,
    page: () => const SearchScreen(),
  ),
];
