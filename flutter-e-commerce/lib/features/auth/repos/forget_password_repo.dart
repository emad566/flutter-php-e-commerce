import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerce/core/constants/api_links.dart';
import 'package:flutter_e_commerce/core/errors/failures.dart';
import 'package:flutter_e_commerce/core/services/api_services.dart';

abstract class ForgetPasswordRepo{
  ApiService apiService;
  ForgetPasswordRepo(this.apiService);
  void forgetPassword(Map<String, dynamic> data);
}

class ForgetPasswordRepoImp extends ForgetPasswordRepo{
  ForgetPasswordRepoImp(super.apiService);

  @override
  Future<Either<Failure, Map<String, dynamic>>> forgetPassword(Map<String, dynamic> data) async{
     return await apiService.ajax(requestType: RequestType.post, endPoint: ApiLinks.forgetPasswordCheckEmail, data: data);
  }
}