import 'package:flutter_e_commerce/core/services/cache_helper.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppServices extends GetxService {
  static initialServices() async {
    Get.putAsync(() => AppServices().init());
  }

  late SharedPreferences sharedPreferences;
  Future<AppServices> init() async {
    await CacheHelper.init();
    return this;
  }
}
