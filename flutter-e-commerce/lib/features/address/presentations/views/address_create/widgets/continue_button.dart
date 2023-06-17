import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/services/size_config.dart';
import 'package:flutter_e_commerce/core/shared/widgets/custom_button.dart';
import 'package:flutter_e_commerce/features/address/presentations/view_models/controllers/address_create_controller.dart';
import 'package:get/get.dart';

class ContinueButton extends StatelessWidget {
  const ContinueButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AddressCreateControllerImp controller = Get.put(AddressCreateControllerImp());
    SizeConfig().init(context);
    return Positioned(
      bottom: 10,
      left: SizeConfig.screenWidth * 0.15,
      child: SizedBox(
        height: 40,
        width: SizeConfig.screenWidth * 0.70,
        child: CustomButton(
          text: 'Continue'.tr,
          onPress: ()=>controller.goToAddressCreatePartTwoScreen(),
          width: SizeConfig.screenWidth,
        ),
      ),
    );
  }
}
