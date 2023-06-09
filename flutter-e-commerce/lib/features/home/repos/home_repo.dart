import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerce/core/constants/api_links.dart';
import 'package:flutter_e_commerce/core/errors/failures.dart';
import 'package:flutter_e_commerce/core/services/api_services.dart';

abstract class HomeRepo {
  ApiService apiService;
  HomeRepo(this.apiService);
  void list();
}

class HomeRepoImp extends HomeRepo {
  HomeRepoImp(super.apiService);

  @override
  Future<Either<Failure, Map<String, dynamic>>> list() async {
    return await apiService.ajax(requestType: RequestType.post, endPoint: ApiLinks.home);
  }
}
