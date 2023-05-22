import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerce/core/constants/api_links.dart';
import 'package:flutter_e_commerce/core/errors/failures.dart';
import 'package:flutter_e_commerce/core/services/api_services.dart';

abstract class SignUpRepo{
  ApiService apiService;
  SignUpRepo(this.apiService);
  void register(Map<String, dynamic> data);
}

class SignUpRepoImp extends SignUpRepo{
  SignUpRepoImp(super.apiService);

  @override
  Future<Either<Failure, Map<String, dynamic>>> register(Map<String, dynamic> data) async{
     return await apiService.ajax(requestType: RequestType.post, endPoint: ApiLinks.signup, data: data);
  }
}