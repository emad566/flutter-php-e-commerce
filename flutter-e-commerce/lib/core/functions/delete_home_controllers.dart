import 'package:flutter_e_commerce/features/cart/presentations/view_models/controllers/cart_controller.dart';
import 'package:flutter_e_commerce/features/checkout/presentations/view_models/controllers/checkout_controller.dart';
import 'package:flutter_e_commerce/features/home/presentations/view_models/controllers/home_controller.dart';
import 'package:flutter_e_commerce/features/home_layout/presentations/view_models/controllers/home_layout_controller.dart';
import 'package:flutter_e_commerce/features/item_single/presentations/view_models/controllers/item_single_controller.dart';
import 'package:flutter_e_commerce/features/items/presentations/view_models/controllers/items_controller.dart';
import 'package:get/get.dart';

void deleteHomeControllers(){
  Get.delete<HomeLayoutControllerImp>();
  Get.delete<HomeControllerImp>();
  Get.delete<CartControllerImp>();
  Get.delete<CheckoutControllerImp>();
  Get.delete<ItemsControllerImp>();
  Get.delete<ItemSingleControllerImp>();
}