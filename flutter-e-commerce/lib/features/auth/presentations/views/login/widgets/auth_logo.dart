import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/constants/app_paths.dart';
import 'package:flutter_e_commerce/core/services/size_config.dart';

class AuthLogo extends StatelessWidget {
  const AuthLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: SizeConfig.screenWidth * .15,
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: ClipOval(
          child: Image.asset(
            AppPaths.logo,
            fit: BoxFit.fill,
            width: SizeConfig.screenWidth,
          ),
        ),
      ),
    );
  }
}
