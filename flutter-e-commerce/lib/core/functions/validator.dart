import 'package:flutter_e_commerce/core/constants/app_validate_types.dart';
import 'package:get/get.dart';

String? validateInput({
  required String val,
  required String type,
  required int min,
  required int max,
  String? confirm,
  bool isNullable = false,
}){
  val = val.trim();
  if(isNullable && val.isEmpty)  return null;
  if(val.isEmpty)  return "The input is required".tr;
  if(val.length < min)  return "The minimum length is ".tr + min.toString();
  if(val.length > max)  return "The maximum length is ".tr + max.toString();
  if(type == AppValidateTypes.isEmail && !GetUtils.isEmail(val)) return "Not valid Email".tr;
  if(type == AppValidateTypes.isPhone && !GetUtils.isPhoneNumber(val)) return "Not valid Phone".tr;
  if(type == AppValidateTypes.isPassword && confirm != null){
    if(val != confirm) return "The password confirmation is wrong".tr;
  }
  return null;
}