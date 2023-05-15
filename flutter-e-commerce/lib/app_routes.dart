import 'package:flutter/cupertino.dart';
import 'package:flutter_e_commerce/core/constants/app_route_keys.dart';
import 'package:flutter_e_commerce/features/auth/presentations/views/login/login_screen.dart';

abstract class AppRoutes{
  static Map<String, Widget Function(BuildContext)> routes = {
    AppRouteKeys.login: (context)=> const LoginScreen(),

  };
}