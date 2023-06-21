import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerce/core/constants/api_links.dart';
import 'package:flutter_e_commerce/core/errors/failures.dart';
import 'package:flutter_e_commerce/core/services/api_services.dart';

abstract class NotificationsRepo {
  ApiService apiService;
  NotificationsRepo(this.apiService);
  Future<Either<Failure, Map<String, dynamic>>> list(Map<String, dynamic> data);
}

class NotificationsRepoImp extends NotificationsRepo {
  NotificationsRepoImp(super.apiService);

  @override
  Future<Either<Failure, Map<String, dynamic>>> list(Map<String, dynamic> data) async {
    return await apiService.ajax(requestType: RequestType.post, endPoint: ApiLinks.notifications, data: data);
  }
}
