import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/services/theme_colors.dart';
import 'package:flutter_e_commerce/core/shared/widgets/custom_input_field.dart';
import 'package:flutter_e_commerce/features/home/presentations/view_models/controllers/home_controller.dart';


class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomTextField(
            isRequired: false,
            hintText: 'Find Product',
            controller: controller.searchController,
            inputKey: controller.searchKey,
            borderRadius: 5,
            borderColor: ThemeColors.primaryClr,
            prefixIcon: const Icon(Icons.search, size: 24,),
            fillColor: ThemeColors.fillClr,
            contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 30),
          ),
        ),

        Container(
          margin: const EdgeInsets.only(left: 8),
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