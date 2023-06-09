import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/class/status_request.dart';
import 'package:flutter_e_commerce/core/constants/app_paths.dart';
import 'package:lottie/lottie.dart';

class HandleLoading extends StatefulWidget {
  const HandleLoading({Key? key, required this.state, required this.child})
      : super(key: key);
  final AppStates state;
  final Widget child;

  @override
  State<HandleLoading> createState() => _HandleLoadingState();
}

class _HandleLoadingState extends State<HandleLoading> {
  @override
  Widget build(BuildContext context) {
    if (widget.state is AppLoadingState) {
      return const AlarmImage(imagePath: AppPaths.loading);
    }

    if (widget.state is AppOfflineFailureState) {
      return const AlarmImage(imagePath: AppPaths.offline);
    }

    if (widget.state is AppServerFailureState) {
      return const AlarmImage(imagePath: AppPaths.server);
    }
    if (widget.state is AppFailureState) {
      return const AlarmImage(imagePath: AppPaths.server);
    }
    if (widget.state is AppNoDataState) {
      return const AlarmImage(imagePath: AppPaths.noData);
    }

    return widget.child;
  }
}

class AlarmImage extends StatelessWidget {
  const AlarmImage({
    super.key,
    required this.imagePath,
  });
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Center(child: Lottie.asset(imagePath, width: 80, height: 80));
  }
}
