import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/class/status_request.dart';

class HandleLoading extends StatefulWidget {
  const HandleLoading({Key? key, required this.state, required this.child}) : super(key: key);
  final AppStates state;
  final Widget child;

  @override
  State<HandleLoading> createState() => _HandleLoadingState();
}

class _HandleLoadingState extends State<HandleLoading> {
  @override
  Widget build(BuildContext context) {
    if(widget.state is AppLoadingState){
      return const CircularProgressIndicator();
    }

    return widget.child;
  }
}
