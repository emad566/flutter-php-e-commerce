import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerce/core/constants/api_links.dart';
import 'package:flutter_e_commerce/core/errors/failures.dart';
import 'package:flutter_e_commerce/core/services/api_services.dart';

abstract class FavoriteRepo {
  ApiService apiService;
  FavoriteRepo(this.apiService);
  Future<Either<Failure, Map<String, dynamic>>> list(Map<String, dynamic> data);
  Future<Either<Failure, Map<String, dynamic>>> removeFavorites(Map<String, dynamic> data);
}

class FavoriteRepoImp extends FavoriteRepo {
  FavoriteRepoImp(super.apiService);

  @override
  Future<Either<Failure, Map<String, dynamic>>> list(Map<String, dynamic> data) async {
    return await apiService.ajax(requestType: RequestType.post, endPoint: ApiLinks.viewFavorites, data: data);
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> removeFavorites(Map<String, dynamic> data) async {
    return await apiService.ajax(requestType: RequestType.post, endPoint: ApiLinks.removeFromFavorites, data: data);
  }
}
