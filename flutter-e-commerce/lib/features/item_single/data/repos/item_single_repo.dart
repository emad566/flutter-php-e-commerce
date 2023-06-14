import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerce/core/constants/api_links.dart';
import 'package:flutter_e_commerce/core/errors/failures.dart';
import 'package:flutter_e_commerce/core/services/api_services.dart';

abstract class ItemSingleRepo {
  ApiService apiService;
  ItemSingleRepo(this.apiService);
  void getSingle(Map<String, dynamic> data);
  void addToCart(Map<String, dynamic> data);

}

class ItemSingleRepoImp extends ItemSingleRepo {
  ItemSingleRepoImp(super.apiService);

  @override
  Future<Either<Failure, Map<String, dynamic>>> getSingle(Map<String, dynamic> data) async {
    return await apiService.ajax(requestType: RequestType.post, endPoint: ApiLinks.items, data: data);
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> addToCart(Map<String, dynamic> data) async {
    return await apiService.ajax(requestType: RequestType.post, endPoint: ApiLinks.addToCart, data: data);
  }

}
