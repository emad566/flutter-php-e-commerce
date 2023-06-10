import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/class/status_request.dart';
import 'package:flutter_e_commerce/core/constants/app_paths.dart';
import 'package:lottie/lottie.dart';

// ignore: must_be_immutable
class HandleLoading  extends StatelessWidget {
  HandleLoading({Key? key, required this.state, required this.child, this.size = 80.0})
      : super(key: key);
  final AppStates state;
  final Widget child;
  double size;

  @override
  Widget build(BuildContext context) {
    if (state is AppLoadingState) {
      return AlarmImage(imagePath: AppPaths.loading, size: size,);
    }

    if (state is AppOfflineFailureState) {
      return AlarmImage(imagePath: AppPaths.offline, size: size,);
    }

    if (state is AppServerFailureState) {
      return AlarmImage(imagePath: AppPaths.server, size: size,);
    }
    if (state is AppFailureState) {
      return AlarmImage(imagePath: AppPaths.server, size: size,);
    }
    if (state is AppEmptyState) {
      return AlarmImage(imagePath: AppPaths.noData, size: size,);
    }

    return child;
  }
}

// ignore: must_be_immutable
class AlarmImage extends StatelessWidget {
  AlarmImage({
    super.key,
    required this.imagePath,
    this.size = 80,
  });

  final String imagePath;
  double size;

  @override
  Widget build(BuildContext context) {
    return Center(child: Lottie.asset(imagePath, width: size, height: size));
  }
}
