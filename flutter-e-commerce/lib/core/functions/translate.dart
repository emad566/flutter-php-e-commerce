import 'package:flutter_e_commerce/core/constants/app_chaches.dart';
import 'package:flutter_e_commerce/core/services/cache_helper.dart';

String translate(String ar, String en){
  return CacheHelper.getData(AppCaches.langCode) == 'ar'? ar : en;
}

bool isAr()=> CacheHelper.getData(AppCaches.langCode) == 'ar'? true : false;