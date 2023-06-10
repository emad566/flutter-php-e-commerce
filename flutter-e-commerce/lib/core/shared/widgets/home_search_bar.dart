import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/services/theme_colors.dart';
import 'package:flutter_e_commerce/core/shared/widgets/custom_input_field.dart';
import 'package:get/get.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({
    super.key,
    required this.controller,
    required this.inputKey,
  });

  final TextEditingController controller;
  final GlobalKey<FormFieldState> inputKey;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomTextField(
            isRequired: false,
            hintText: "Search".tr,
            controller: controller,
            inputKey: inputKey,
            borderRadius: 5,
            borderColor: ThemeColors.primaryClr,
            prefixIcon: const Icon(Icons.search, size: 24,),
            fillColor: ThemeColors.fillClr,
            contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 30),
          ),
        ),
        const SizedBox(width: 10,),
        Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: ThemeColors.fillClr,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: const Icon(Icons.notifications_active_outlined, size: 40,),
        )
      ],
    );
  }
}