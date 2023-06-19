import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/services/size_config.dart';
import 'package:flutter_e_commerce/core/services/theme_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onPress,
    required this.width,
    this.borderRadius = 0,
  });
  final String text;
  final Function onPress;
  final double width;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      width: SizeConfig.screenWidth * width / 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(500),
      ),
      child: MaterialButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius)),
        onPressed: () => onPress(),
        height: 50,
        color: ThemeColors.primaryClr.withOpacity(0.8),
        child: Text(
          text,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: ThemeColors.white,
              ),
        ),
      ),
    );
  }
}
