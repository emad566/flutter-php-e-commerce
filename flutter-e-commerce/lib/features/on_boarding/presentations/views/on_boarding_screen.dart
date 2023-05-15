import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/services/size_config.dart';
import 'package:flutter_e_commerce/features/on_boarding/presentations/view_models/controllers/on_boarding_controller_imp.dart';
import 'package:flutter_e_commerce/features/on_boarding/presentations/views/widgets/on_boarding_dot_controller.dart';
import 'package:flutter_e_commerce/features/on_boarding/presentations/views/widgets/on_boarding_button.dart';
import 'package:flutter_e_commerce/features/on_boarding/presentations/views/widgets/on_boarding_page_builder.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());

    SizeConfig().init(context);
    return  const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 9,
              child: OnBoardingPageBuilder(),
            ),
            OnBoardingDotController(),
            Spacer(),
            OnBoardingButton(),
          ],
        ),
      ),
    );
  }
}



