import 'dart:async';
import 'package:flutter_e_commerce/core/class/status_request.dart';
import 'package:flutter_e_commerce/core/constants/app_route_keys.dart';
import 'package:flutter_e_commerce/core/functions/requestPermission.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

abstract class AddressCreateController extends GetxController{
  AppStates state = AppInitialState();
  final Completer<GoogleMapController> googleMapController = Completer<GoogleMapController>();

  late Marker marker;
  late CameraPosition initialCameraPosition;

  void setMarker(LatLng latLng);

  LocationData? currentLocation;
  late LatLng selectedLatLong;
  dynamic locationStream;
  void getCurrentLocation();
  void goToAddressCreatePartTwoScreen();
}

class AddressCreateControllerImp extends AddressCreateController{
  @override
  void getCurrentLocation() async{
    state = AppLoadingState();
    update();
    currentLocation = await Location().getLocation();

    setMarker(LatLng(currentLocation!.latitude!, currentLocation!.longitude!));



    state = AppSuccessState();
    update();
  }

  @override
  void onInit() async {
    super.onInit();
    await requestPermission1();
    getCurrentLocation();
  }

  @override
  void dispose() {
    locationStream?.cancel();
    locationStream = null;
    super.dispose();
  }

  @override
  void setMarker(LatLng latLng) {
    marker = Marker(
      markerId: const MarkerId('1'),
      position: latLng,
    );
    initialCameraPosition = CameraPosition(
      target: LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
      zoom: 16,
    );
    selectedLatLong = LatLng(currentLocation!.latitude!, currentLocation!.longitude!);
    update();
  }

  @override
  void goToAddressCreatePartTwoScreen() {
    Get.toNamed(AppRouteKeys.addressCreatePartTwo, arguments: {'lat': selectedLatLong.latitude, 'lng': selectedLatLong.longitude});
  }
}