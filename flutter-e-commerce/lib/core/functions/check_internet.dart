import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';

Future<bool> checkInternet() async{
  ConnectivityResult connectivityResult = await (Connectivity().checkConnectivity());

  if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
    try{
      var result = await InternetAddress.lookup('google.com');
      if(result.isNotEmpty && result[0].rawAddress.isNotEmpty){
        return true;
      }
    } on SocketException catch(_){
      return false;
    }
  }
  return false;
}