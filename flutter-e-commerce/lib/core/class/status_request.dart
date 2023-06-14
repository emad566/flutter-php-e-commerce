import 'package:flutter_e_commerce/core/errors/failures.dart';

AppStates handleFailure(Failure failure) {
  if (failure.type == FailureTypes.flutterError) {
    return AppFailureState();
  }

  if (failure.type == FailureTypes.noInternet) {
    return AppOfflineFailureState();
  }

  return AppServerFailureState(
      errorMessage: failure.errMessage, code: failure.code);
}

abstract class AppStates {}

class AppInitialState extends AppStates {}

class AppLoadingState extends AppStates {
  final int loadingLevel;

  AppLoadingState({this.loadingLevel = 0});
}

class AppSuccessState extends AppStates {}

class AppEmptyState extends AppStates {
  final String message;
  AppEmptyState({this.message = 'Nodata'});
}

class AppFailureState extends AppStates {
  final String errorMessage;
  AppFailureState({this.errorMessage = 'App Local Error'});
}

class AppServerFailureState extends AppStates {
  final String errorMessage;
  int? code;
  AppServerFailureState({this.errorMessage = 'Server Error', int? code});
}

class AppOfflineFailureState extends AppStates {}

class AppValidateFailureState extends AppStates {
  final Map<String, dynamic> errors;
  final String errorMessage;
  AppValidateFailureState(
      {required this.errors, this.errorMessage = "Not Valid data"});
}
