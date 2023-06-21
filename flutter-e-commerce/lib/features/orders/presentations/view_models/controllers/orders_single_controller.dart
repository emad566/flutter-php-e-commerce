import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerce/core/class/status_request.dart';
import 'package:flutter_e_commerce/core/errors/failures.dart';
import 'package:flutter_e_commerce/core/functions/empty_or_validate_state.dart';
import 'package:flutter_e_commerce/features/auth/data/models/login_cached_model.dart';
import 'package:flutter_e_commerce/features/home/data/models/home_model/item_view_model.dart';
import 'package:flutter_e_commerce/features/home/data/models/home_model/items_view_model.dart';
import 'package:flutter_e_commerce/features/orders/data/models/order_model.dart';
import 'package:flutter_e_commerce/features/orders/data/repos/orders_repo.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class OrdersSingleController extends GetxController{
  AppStates state = AppInitialState();
  final LoginCachedModel loginCached = LoginCachedModel.fromJson();

  final OrdersRepoImp _repoImp = OrdersRepoImp(Get.find());
  late OrderModel item;
  List<ItemViewModel> items= [];
  void single();
  late Marker marker;
  late CameraPosition initialCameraPosition;
  void setMarker();

}

class OrdersSingleControllerImp extends OrdersSingleController{

  @override
  void single() async {
    state = AppLoadingState();
    update();
    Either<Failure, Map<String, dynamic>> result = await _repoImp.single({'orders_id': item.ordersId});
    result.fold((failure) {
      state = handleFailure(failure);
      update();
    }, (response) async {
      if (!response['status']) {
        state = emptyOrValidateState(response);
        update();
      } else {
        items = ItemsViewModel.fromJson(response).data;
        state = AppSuccessState();
        update();
      }
    });
  }

  @override
  void setMarker() {
    if(item.ordersAddress == null) return;
    LatLng latLng = LatLng(double.parse(item.addressLat), double.parse(item.addressLong));
    marker = Marker(
      markerId: const MarkerId('1'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      infoWindow: InfoWindow(title: item.addressName),
      position: latLng,
    );
    initialCameraPosition = CameraPosition(
      target: latLng,
      zoom: 16,
    );
  }

  @override
  void onInit() {
    super.onInit();
    item = Get.arguments['item'];
    setMarker();
    single();
  }
}