
// ignore_for_file: file_names
import 'package:location/location.dart';

Future<bool> requestPermission1() async{
  Location location = Location();
  bool serviceEnabled;
  PermissionStatus permissionGranted;

  serviceEnabled = await location.serviceEnabled();
  if (!serviceEnabled) {
    serviceEnabled = await location.requestService();
    if (!serviceEnabled) {
      return false;
    }
  }

  permissionGranted = await location.hasPermission();
  if (permissionGranted == PermissionStatus.denied) {
    permissionGranted = await location.requestPermission();
    if (permissionGranted != PermissionStatus.granted) {
      return false;
    }
  }
  return true;
}


//
// Future<SnackbarController?>  requestPermission() async{
//   bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
//   if(!serviceEnabled){
//     return Get.snackbar('Alert', 'Please allow location service'.tr);
//   }
//
//   LocationPermission permission = await Geolocator.checkPermission();
//   if(permission == LocationPermission.denied){
//     permission = await Geolocator.requestPermission();
//     if(permission == LocationPermission.denied){
//       return Get.snackbar('Alert', 'Please allow location permission for the app'.tr);
//     }
//   }
//
//   if(permission == LocationPermission.denied){
//     permission = await Geolocator.requestPermission();
//     if(permission == LocationPermission.deniedForever){
//       return Get.snackbar('Alert', 'Please allow location permission for the app'.tr);
//     }
//   }
//   return null;
// }
