import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/services/theme_colors.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.text,
    required this.onPress,
    this.textAlign = TextAlign.start,
    this.textColor,
  });
  final String text;
  final Function onPress;
  final TextAlign textAlign;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: InkWell(
        onTap: () => onPress(),
        child: Text(
          text,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: textColor ?? ThemeColors.secondClr,
              ),
          textAlign: textAlign,
        ),
      ),
    );
  }
}
