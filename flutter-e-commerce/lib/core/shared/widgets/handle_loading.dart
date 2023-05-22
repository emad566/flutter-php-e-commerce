import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/class/status_request.dart';

class HandleLoading extends StatelessWidget {
  const HandleLoading({Key? key, required this.state, required this.child}) : super(key: key);
  final AppStates state;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    if(state is AppLoadingState){
      const CircularProgressIndicator();
    }

    return child;
  }
}
