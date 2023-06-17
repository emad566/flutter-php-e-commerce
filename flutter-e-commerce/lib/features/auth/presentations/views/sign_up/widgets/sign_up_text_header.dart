import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/localization/app_lang_keys.dart';
import 'package:flutter_e_commerce/core/services/size_config.dart';
import 'package:flutter_e_commerce/core/services/theme_colors.dart';
import 'package:get/get.dart';

class SignUpTextHeader extends StatelessWidget {
  const SignUpTextHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppLangKeys.welcomeBack.tr,
          style: Theme.of(context).textTheme.displayMedium,
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: SizeConfig.screenWidth * .80,
          child: Text(
            'Please fill those fields to create new account'.tr,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: ThemeColors.secondaryText),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
