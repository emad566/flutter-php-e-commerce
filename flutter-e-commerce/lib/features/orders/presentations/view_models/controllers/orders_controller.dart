import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerce/core/class/status_request.dart';
import 'package:flutter_e_commerce/core/constants/app_route_keys.dart';
import 'package:flutter_e_commerce/core/errors/failures.dart';
import 'package:flutter_e_commerce/core/functions/empty_or_validate_state.dart';
import 'package:flutter_e_commerce/features/auth/data/models/login_cached_model.dart';
import 'package:flutter_e_commerce/features/orders/data/models/order_model.dart';
import 'package:flutter_e_commerce/features/orders/data/models/orders_list_model.dart';
import 'package:flutter_e_commerce/features/orders/data/repos/orders_repo.dart';
import 'package:get/get.dart';

abstract class OrdersController extends GetxController{
  AppStates state = AppInitialState();
  final LoginCachedModel loginCached = LoginCachedModel.fromJson();

  final OrdersRepoImp _repoImp = OrdersRepoImp(Get.find());
  List<OrderModel> items = [];
  void list();
  void storeRate(String orderId, String rate, String comment);
  void goToOrderSingleScreen(OrderModel item);

}

class OrdersControllerImp extends OrdersController{

  @override
  void list() async {
    state = AppLoadingState();
    update();
    Either<Failure, Map<String, dynamic>> result = await _repoImp.list({'usersid': loginCached.usersId});
    result.fold((failure) {
      state = handleFailure(failure);
      update();
    }, (response) async {
      if (!response['status']) {
        state = emptyOrValidateState(response);
        update();
      } else {
        items = OrdersListModel.fromJson(response).data;
        state = AppSuccessState();
        update();
      }
    });
  }


  @override
  void storeRate(String orderId, String rate, String comment) async {
    // state = AppLoadingState();
    // update();
    Map<String, dynamic> data = {
      "order_id": orderId ,
      "comment": comment ,
      "rating" : rate
    };

    Either<Failure, Map<String, dynamic>> result = await _repoImp.storeRate(data);
    result.fold((failure) {
      state = handleFailure(failure);
      update();
    }, (response) async {
      if (!response['status']) {
        state = emptyOrValidateState(response);
        update();
      } else {
        list();
      }
    });
  }

  @override
  void onInit() {
    super.onInit();
    list();
  }

  @override
  void goToOrderSingleScreen(OrderModel item) {
    Get.toNamed(AppRouteKeys.orderSingle, arguments: {'item': item});
  }


}