import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/services/size_config.dart';
import 'package:flutter_e_commerce/core/services/theme_colors.dart';
import 'package:get/get.dart';

class SignInTextHeader extends StatelessWidget {
  const SignInTextHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Welcome Back'.tr,
          style: Theme.of(context).textTheme.displayMedium,
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: SizeConfig.screenWidth * .80,
          child: Text(
            'Sign in with your email and password or continue with social media'
                .tr,
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
