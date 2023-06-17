import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/localization/app_lang_keys.dart';
import 'package:get/get.dart';

Future<bool> alertExitApp() {
  Get.defaultDialog(
    title: AppLangKeys.alarm.tr,
    middleText: AppLangKeys.doYouExitApp.tr,
    actions: [
      ElevatedButton(
        onPressed: () {
          exit(0);
        },
        child: Text(AppLangKeys.confirm.tr),
      ),
      ElevatedButton(
        onPressed: () {
          Get.back();
        },
        child: Text(AppLangKeys.cancel.tr),
      ),
    ],
  );

  return Future.value(true);
}
