import 'package:flutter_e_commerce/core/class/status_request.dart';
import 'package:flutter_e_commerce/features/auth/data/models/login_cached_model.dart';
import 'package:get/get.dart';

abstract class CartController extends GetxController{
  AppStates state = AppInitialState();
  final LoginCachedModel loginCached = LoginCachedModel.fromJson();

}

class CartControllerImp extends CartController{

}