import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/services/theme_colors.dart';

class CustomFloatAction extends StatelessWidget {
  const CustomFloatAction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0XFFdddddd),
        borderRadius: BorderRadius.circular(50),
      ),
      width: 75,
      height: 75,
      child: Stack(
        children: [
          Positioned(
            bottom: 10,
            left: 10,
            child: SizedBox(
              width: 55,
              height: 55,
              child: FloatingActionButton(
                shape: const CircleBorder(),
                backgroundColor: Colors.blueAccent,
                onPressed: () {

                },
                child: const Icon(Icons.shopping_basket_outlined, size: 30,),
              ),
            ),
          )
        ],
      ),
    );
  }
}
