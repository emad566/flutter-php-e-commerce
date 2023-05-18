import 'package:flutter/cupertino.dart';
import 'package:flutter_e_commerce/core/constants/app_route_keys.dart';
import 'package:flutter_e_commerce/features/auth/presentations/views/login/login_screen.dart';
import 'package:flutter_e_commerce/features/auth/presentations/views/sign_up/sign_up_screen.dart';
import 'package:flutter_e_commerce/features/on_boarding/presentations/views/on_boarding_screen.dart';

abstract class AppRoutes{
  static Map<String, Widget Function(BuildContext)> routes = {
    AppRouteKeys.onBoarding: (context)=> const OnBoardingScreen(),
    AppRouteKeys.login: (context)=> LoginScreen(),
    AppRouteKeys.signUp: (context)=> SignUpScreen(),

  };
}