import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/shared/widgets/button_bottom_nav.dart';
import 'package:flutter_e_commerce/core/shared/widgets/handle_loading.dart';
import 'package:flutter_e_commerce/features/address/presentations/view_models/controllers/address_create_part_two_controller.dart';
import 'package:get/get.dart';

class AddressSaveButton extends StatelessWidget {
  const AddressSaveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddressCreatePartTwoControllerImp>(
      init: AddressCreatePartTwoControllerImp(),
      builder: (controller) {
        return HandleLoading(
          state: controller.state,
          child: ButtonBottomNav(
            title: 'Submit'.tr,
            onPress: () => controller.store(),
          ),
        );
      },
    );
  }
}
