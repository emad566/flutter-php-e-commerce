import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/constants/app_route_keys.dart';
import 'package:flutter_e_commerce/core/localization/change_lang_controller.dart';
import 'package:flutter_e_commerce/core/services/size_config.dart';
import 'package:flutter_e_commerce/features/choose_language/presentations/views/widgets/choose_lang_button.dart';
import 'package:get/get.dart';

class ChooseLanguageScreen extends GetView<ChangeLangController> {
  const ChooseLanguageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '1'.tr,
              style: Theme.of(context).textTheme.headlineLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            ChooseLangButton(
                text: 'AR',
                onPress: () {
                  controller.changeLang('ar');
                  Get.toNamed(AppRouteKeys.onBoarding);
                }),
            const SizedBox(
              height: 20,
            ),
            ChooseLangButton(
                text: 'EN',
                onPress: () {
                  controller.changeLang('en');
                  Get.toNamed(AppRouteKeys.onBoarding);
                }),
          ],
        ),
      ),
    );
  }
}
