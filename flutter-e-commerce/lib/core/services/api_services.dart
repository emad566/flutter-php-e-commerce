import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_e_commerce/core/constants/api_links.dart';
import 'package:flutter_e_commerce/core/errors/failures.dart';
import 'package:flutter_e_commerce/core/functions/check_internet.dart';

enum RequestType {
  get,
  put,
  post,
  delete,
}

class ApiService {
  static late Dio _dio;

  init({String? lang, String? token}) {
    Map<String, String> headersOption = token == ''
        ? {
            'Content-Type': ApiLinks.contentType,
            'Accept': ApiLinks.contentType,
          }
        : {
            'Content-Type': ApiLinks.contentType,
            'Accept': ApiLinks.contentType,
            'Authorization': 'Bearer $token',
          };

    _dio = Dio(
      BaseOptions(
          baseUrl: ApiLinks.baseURL,
          headers: headersOption,
          receiveDataWhenStatusError: true,
          connectTimeout: const Duration(milliseconds: 30200), // 60 seconds
          receiveTimeout: const Duration(milliseconds: 30200)),
    );
  }

  Future<Either<Failure, Map<String, dynamic>>> ajax(
      {required RequestType requestType,
      required String endPoint,
      Map<String, dynamic> query = const {},
      Map<String, dynamic> data = const {}}) async {
    bool isOnline = await checkInternet();
    if (isOnline) {
      // String accessToken = CacheHelper.getData(AppCaches.accessToken) ?? '';
      Response? response;
      FormData myData = FormData.fromMap(data);
      try {
        if (requestType == RequestType.get) response = await _dio.get(endPoint, queryParameters: query);
        if (requestType == RequestType.post) response = await _dio.post(endPoint, queryParameters: query, data: myData);
        if (requestType == RequestType.put) response = await _dio.put(endPoint, queryParameters: query, data: myData);
        if (requestType == RequestType.delete) response = await _dio.delete(endPoint, queryParameters: query, data: myData);
        return right(response!.data);
      } on DioError catch (dioError) {
        return left(ServerFailure.fromDioError(dioError));
      } catch (e) {
        return left(ServerFailure(
            errMessage: e.toString(), type: FailureTypes.flutterError));
      }
    } else {
      return left(ServerFailure(
          errMessage: 'Wifi and data are offline!',
          type: FailureTypes.noInternet));
    }
  }
}
