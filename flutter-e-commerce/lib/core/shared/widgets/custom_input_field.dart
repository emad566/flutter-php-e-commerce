import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/services/theme_colors.dart';

// ignore: must_be_immutable
class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    required this.inputKey,
    this.obscureText = false,
    this.isPassword = false,
    this.suffixIcon,
    this.prefixIcon,
    this.validator,
    this.borderColor,
    this.maxLines = 1,
    this.keyboardType = TextInputType.name,
    this.textInputAction = TextInputAction.next,
    this.isRequired = true,
    this.contentPadding = const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
  }) : super(key: key);

  final String hintText;
  final TextEditingController controller;
  final GlobalKey<FormFieldState> inputKey;
  final bool obscureText;
  final bool isPassword;
  final Function? validator;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? borderColor;
  final int maxLines;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final bool isRequired;
  final EdgeInsets contentPadding;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isShowPassword = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: widget.inputKey,
      onChanged: (val) {
        if (widget.isRequired) {
          widget.inputKey.currentState!.validate();
        }
      },
      validator: (val) {
        if (widget.isRequired && widget.controller.text == '') {
          return 'This field is required';
        }
        if (widget.validator != null) return widget.validator!();
        return null;
      },
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      style: TextStyle(
        color: widget.borderColor ?? ThemeColors.white,
      ),
      obscureText: (){
        if(widget.obscureText) return widget.obscureText;
        if(widget.isPassword){
          return isShowPassword? false : true;
        }
        return false;
      }(),
      maxLines: widget.maxLines,
      decoration: InputDecoration(
        contentPadding: widget.contentPadding,
        errorStyle: TextStyle(
          color: widget.borderColor ?? ThemeColors.white,
        ),
        suffixIcon: (){
          if(widget.suffixIcon != null) return widget.suffixIcon;
          if(widget.isPassword) {
            return IconButton(
              onPressed: (){
                setState(() {
                  isShowPassword = !isShowPassword;
                });
              },
              icon: Icon(isShowPassword? Icons.visibility_off : Icons.visibility , size: 24,),
            );
          }
          return null;
        }(),
        prefixIcon: widget.prefixIcon,
        label: Text('${widget.hintText} ${widget.isRequired ? '*' : ''}'),
        hintStyle: TextStyle(
          color: (widget.borderColor?.withOpacity(0.3)) ??
              ThemeColors.white.withOpacity(0.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.blue,
          ),
          borderRadius: BorderRadius.circular(50),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: widget.borderColor ?? ThemeColors.white,
          ),
          borderRadius: BorderRadius.circular(50),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: widget.borderColor ?? ThemeColors.white,
          ),
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }
}
