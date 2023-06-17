import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerce/core/constants/api_links.dart';
import 'package:flutter_e_commerce/core/errors/failures.dart';
import 'package:flutter_e_commerce/core/services/api_services.dart';

abstract class ItemsRepo {
  ApiService apiService;
  ItemsRepo(this.apiService);
  void list(Map<String, dynamic> data);
  void addToFavorites(Map<String, dynamic> data);
  void removeFromFavorites(Map<String, dynamic> data);
  void delete(Map<String, dynamic> data);
}

class ItemsRepoImp extends ItemsRepo {
  ItemsRepoImp(super.apiService);

  @override
  Future<Either<Failure, Map<String, dynamic>>> list(Map<String, dynamic> data) async {
    return await apiService.ajax(requestType: RequestType.post, endPoint: ApiLinks.addressView, data: data);
  }



  @override
  Future<Either<Failure, Map<String, dynamic>>> addToFavorites(Map<String, dynamic> data) async {
    return await apiService.ajax(requestType: RequestType.post, endPoint: ApiLinks.addToFavorites, data: data);
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>>removeFromFavorites(Map<String, dynamic> data) async {
    return await apiService.ajax(requestType: RequestType.post, endPoint: ApiLinks.removeFromFavorites, data: data);
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>>delete(Map<String, dynamic> data) async {
    return await apiService.ajax(requestType: RequestType.post, endPoint: ApiLinks.addressDelete, data: data);
  }

}
