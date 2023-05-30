import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerce/core/constants/api_links.dart';
import 'package:flutter_e_commerce/core/errors/failures.dart';
import 'package:flutter_e_commerce/core/services/api_services.dart';

abstract class LoginRepo{
  ApiService apiService;
  LoginRepo(this.apiService);
  void login(Map<String, dynamic> data);
}

class LoginRepoImp extends LoginRepo{
  LoginRepoImp(super.apiService);

  @override
  Future<Either<Failure, Map<String, dynamic>>> login(Map<String, dynamic> data) async{
     return await apiService.ajax(requestType: RequestType.post, endPoint: ApiLinks.login, data: data);
  }
}