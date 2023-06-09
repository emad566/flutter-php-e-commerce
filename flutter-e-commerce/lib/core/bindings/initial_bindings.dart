import 'package:flutter_e_commerce/core/services/api_services.dart';
import 'package:get/get.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ApiService());
  }
}
