import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerce/core/constants/api_links.dart';
import 'package:flutter_e_commerce/core/errors/failures.dart';
import 'package:flutter_e_commerce/core/services/api_services.dart';

abstract class CartRepo {
  ApiService apiService;
  CartRepo(this.apiService);
  Future<Either<Failure, Map<String, dynamic>>> list(Map<String, dynamic> data);
  Future<Either<Failure, Map<String, dynamic>>> updateCart(Map<String, dynamic> data);
  Future<Either<Failure, Map<String, dynamic>>> applyCoupon(Map<String, dynamic> data);
}

class CartRepoImp extends CartRepo {
  CartRepoImp(super.apiService);

  @override
  Future<Either<Failure, Map<String, dynamic>>> list(Map<String, dynamic> data) async {
    return await apiService.ajax(requestType: RequestType.post, endPoint: ApiLinks.viewCart, data: data);
  }


  @override
  Future<Either<Failure, Map<String, dynamic>>> updateCart(Map<String, dynamic> data) async {
    return await apiService.ajax(requestType: RequestType.post, endPoint: ApiLinks.addToCart, data: data);
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> applyCoupon(Map<String, dynamic> data) async {
    return await apiService.ajax(requestType: RequestType.post, endPoint: ApiLinks.applyCoupon, data: data);
  }

}
