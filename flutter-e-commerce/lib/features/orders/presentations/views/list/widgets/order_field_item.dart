import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/constants/app_styles.dart';
import 'package:flutter_e_commerce/core/services/theme_colors.dart';

class OrderFieldItem extends StatelessWidget {
  const OrderFieldItem({
    super.key,
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        label,
        style: AppStyles.style18Bold.copyWith(color: ThemeColors.tripleText),
      ),
      trailing: Text(
        value,
        style: AppStyles.style18Bold.copyWith(color: ThemeColors.tripleText),
      ),
    );
  }
}
