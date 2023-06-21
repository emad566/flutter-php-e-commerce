import 'package:flutter/material.dart';


// ignore: must_be_immutable
class CircleImage extends StatelessWidget {
  CircleImage({
    super.key,
    required this.radius,
    required this.path,
    this.color,
  });
  final double radius;
  final String path;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: radius,
      width: radius,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(path),fit: BoxFit.contain),
        color: color?? Colors.white,
        shape: BoxShape.circle,
      ),
    );
  }
}
