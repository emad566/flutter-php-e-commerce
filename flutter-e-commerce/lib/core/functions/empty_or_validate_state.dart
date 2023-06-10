import 'package:flutter_e_commerce/core/class/status_request.dart';

AppStates emptyOrValidateState(Map<String, dynamic> response){
  if(response['errors'] == null) return AppEmptyState();
  return AppValidateFailureState(errors: response['errors'], errorMessage: response['message']);

}