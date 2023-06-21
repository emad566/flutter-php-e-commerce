import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerce/core/constants/api_links.dart';
import 'package:flutter_e_commerce/core/errors/failures.dart';
import 'package:flutter_e_commerce/core/services/api_services.dart';

abstract class OrdersRepo {
  ApiService apiService;
  OrdersRepo(this.apiService);
  void list(Map<String, dynamic> data);
  void single(Map<String, dynamic> data);
  void storeRate(Map<String, dynamic> data);
}

class OrdersRepoImp extends OrdersRepo {
  OrdersRepoImp(super.apiService);

  @override
  Future<Either<Failure, Map<String, dynamic>>> list(Map<String, dynamic> data) async {
    return await apiService.ajax(requestType: RequestType.post, endPoint: ApiLinks.indexOrders, data: data);
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> single(Map<String, dynamic> data) async {
    return await apiService.ajax(requestType: RequestType.post, endPoint: ApiLinks.orderSingle, data: data);
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> storeRate(Map<String, dynamic> data) async {
    return await apiService.ajax(requestType: RequestType.post, endPoint: ApiLinks.rating, data: data);
  }
}
