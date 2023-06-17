// import 'package:dartz/dartz.dart';
// import 'package:flutter_e_commerce/core/constants/api_links.dart';
// import 'package:flutter_e_commerce/core/errors/failures.dart';
import 'package:flutter_e_commerce/core/services/api_services.dart';

abstract class CheckoutRepo {
  ApiService apiService;
  CheckoutRepo(this.apiService);
  // void list(Map<String, dynamic> data);
}

class CheckoutRepoImp extends CheckoutRepo {
  CheckoutRepoImp(super.apiService);

  // @override
  // Future<Either<Failure, Map<String, dynamic>>> list(Map<String, dynamic> data) async {
  //   return await apiService.ajax(requestType: RequestType.post, endPoint: ApiLinks.home, data: data);
  // }
}
