import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerce/core/constants/api_links.dart';
import 'package:flutter_e_commerce/core/errors/failures.dart';
import 'package:flutter_e_commerce/core/services/api_services.dart';

abstract class ItemsRepo {
  ApiService apiService;
  ItemsRepo(this.apiService);
  void list(Map<String, dynamic> data);
}

class ItemsRepoImp extends ItemsRepo {
  ItemsRepoImp(super.apiService);

  @override
  Future<Either<Failure, Map<String, dynamic>>> list(Map<String, dynamic> data) async {
    return await apiService.ajax(requestType: RequestType.post, endPoint: ApiLinks.items, data: data);
  }
}
