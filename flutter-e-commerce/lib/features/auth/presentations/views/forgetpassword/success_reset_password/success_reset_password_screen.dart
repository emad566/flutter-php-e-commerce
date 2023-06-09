import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/constants/app_route_keys.dart';
import 'package:flutter_e_commerce/core/services/size_config.dart';
import 'package:flutter_e_commerce/core/services/theme_colors.dart';
import 'package:flutter_e_commerce/core/shared/widgets/custom_button.dart';
import 'package:get/get.dart';

class SuccessResetPasswordScreen extends StatelessWidget {
  const SuccessResetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeColors.primaryBg,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          width: double.infinity,
          height: SizeConfig.screenHeight - 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.check_circle_outline,
                size: 200,
                color: ThemeColors.primaryClr,
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                'Success Reset Password, Use the new password to log in'.tr,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: ThemeColors.secondClr,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 50,
              ),
              CustomButton(
                text: 'Sign In'.tr,
                borderRadius: 50,
                onPress: () {
                  Get.offAllNamed(AppRouteKeys.login);
                },
                width: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
