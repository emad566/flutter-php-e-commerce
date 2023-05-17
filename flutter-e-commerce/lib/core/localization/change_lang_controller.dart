import 'dart:ui';

import 'package:flutter_e_commerce/core/constants/app_chaches.dart';
import 'package:flutter_e_commerce/core/services/cache_helper.dart';
import 'package:get/get.dart';

class ChangeLangController extends GetxController{
  Locale? lang;

  changeLang(String langCode){
    CacheHelper.setData(AppCaches.langCode, langCode);
    Locale localeLangCode = Locale(langCode);
    Get.updateLocale(localeLangCode);
  }

  @override
  void onInit() {
    super.onInit();
    String? langCode = CacheHelper.getData(AppCaches.langCode);
    if(langCode == 'ar'){
      lang = const Locale('ar');
    }else if(langCode == 'en'){
      lang = const Locale('en');
    }else{
      lang = Locale(Get.deviceLocale?.languageCode?? 'en');
    }
  }
}