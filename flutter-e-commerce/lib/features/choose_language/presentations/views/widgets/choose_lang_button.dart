import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/services/size_config.dart';
import 'package:flutter_e_commerce/core/services/theme_colors.dart';

class ChooseLangButton extends StatelessWidget {
  const ChooseLangButton({
    super.key,
    required this.text,
    required this.onPress,
  });
  final String text;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.screenWidth * 0.50,
      child: MaterialButton(
        onPressed: () => onPress(),
        height: 50,
        color: ThemeColors.primaryClr.withOpacity(0.8),
        child: Text(
          text,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: ThemeColors.white,
              ),
        ),
      ),
    );
  }
}
