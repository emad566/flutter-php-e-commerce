import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/services/theme_colors.dart';
import 'package:flutter_e_commerce/core/shared/widgets/app_field_icon.dart';
import 'package:flutter_e_commerce/core/shared/widgets/custom_text_field.dart';
import 'package:flutter_e_commerce/features/address/presentations/view_models/controllers/address_create_part_two_controller.dart';
import 'package:get/get.dart';

class AddressCreateFields extends StatelessWidget {
  const AddressCreateFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AddressCreatePartTwoControllerImp controller =
        Get.put(AddressCreatePartTwoControllerImp());

    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        CustomTextField(
          hintText: 'name'.tr.capitalizeFirst.toString(),
          prefixIcon: AppFieldIcon(iconData: Icons.supervised_user_circle),
          controller: controller.nameController,
          inputKey: controller.nameKey,
          borderColor: ThemeColors.primaryClr,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 18, horizontal: 30),
        ),
        const SizedBox(
          height: 10,
        ),
        CustomTextField(
          hintText: 'city'.tr.capitalizeFirst.toString(),
          prefixIcon: AppFieldIcon(iconData: Icons.house_outlined),
          controller: controller.cityController,
          inputKey: controller.cityKey,
          borderColor: ThemeColors.primaryClr,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 18, horizontal: 30),
        ),
        const SizedBox(
          height: 10,
        ),
        CustomTextField(
          hintText: 'street'.tr.capitalizeFirst.toString(),
          prefixIcon: AppFieldIcon(iconData: Icons.streetview_outlined),
          controller: controller.streetController,
          inputKey: controller.streetKey,
          borderColor: ThemeColors.primaryClr,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 18, horizontal: 30),
        ),
      ],
    );
  }
}

