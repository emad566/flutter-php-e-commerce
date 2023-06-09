import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerce/core/constants/api_links.dart';
import 'package:flutter_e_commerce/core/errors/failures.dart';
import 'package:flutter_e_commerce/core/services/api_services.dart';

abstract class ResetPasswordRepo {
  ApiService apiService;
  ResetPasswordRepo(this.apiService);
  void reset(Map<String, dynamic> data);
}

class ResetPasswordRepoImp extends ResetPasswordRepo {
  ResetPasswordRepoImp(super.apiService);

  @override
  Future<Either<Failure, Map<String, dynamic>>> reset(
      Map<String, dynamic> data) async {
    return await apiService.ajax(
        requestType: RequestType.post,
        endPoint: ApiLinks.resetPassword,
        data: data);
  }
}
