import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerce/core/constants/api_links.dart';
import 'package:flutter_e_commerce/core/errors/failures.dart';
import 'package:flutter_e_commerce/core/services/api_services.dart';

abstract class AddressRepo {
  ApiService apiService;
  AddressRepo(this.apiService);
  void list(Map<String, dynamic> data);
  void store(Map<String, dynamic> data);
  void update(Map<String, dynamic> data);
}

class AddressRepoImp extends AddressRepo {
  AddressRepoImp(super.apiService);

  @override
  Future<Either<Failure, Map<String, dynamic>>> list(Map<String, dynamic> data) async {
    return await apiService.ajax(requestType: RequestType.post, endPoint: ApiLinks.items, data: data);
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> store(Map<String, dynamic> data) async {
    return await apiService.ajax(requestType: RequestType.post, endPoint: ApiLinks.addressAdd, data: data);
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> update(Map<String, dynamic> data) async {
    return await apiService.ajax(requestType: RequestType.post, endPoint: ApiLinks.addressEdit, data: data);
  }
}
