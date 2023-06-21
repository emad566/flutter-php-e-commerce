
import 'package:flutter_e_commerce/core/constants/app_route_keys.dart';
import 'package:flutter_e_commerce/features/orders/presentations/view_models/controllers/orders_controller.dart';
import 'package:get/get.dart';

void refreshPageNotification(Map<String, dynamic> data){
  if(Get.currentRoute == AppRouteKeys.orders && data['pageName'] == AppRouteKeys.orders ){
    OrdersControllerImp controller = Get.put(OrdersControllerImp());
    controller.list();
  }
}