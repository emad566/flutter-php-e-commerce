import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;
  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.connectionTimeout:
        return ServerFailure('Connection timeout with ApiServer');

      case DioErrorType.sendTimeout:
        return ServerFailure('Connection timeout with send to ApiServer');

      case DioErrorType.receiveTimeout:
        return ServerFailure('Connection timeout with receive from ApiServer');

      case DioErrorType.badCertificate:
        return ServerFailure('Connection refused duo to bad certificate');

      case DioErrorType.badResponse:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode, dioError.response!.data);

      case DioErrorType.cancel:
        return ServerFailure('Connection has been canceled');

      case DioErrorType.connectionError:
        return ServerFailure('Server Connection Error');

      case DioErrorType.unknown:
        return ServerFailure('Failure with unknown error!');
      default:
        return ServerFailure('Failure with unexpected error!. try again');
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {

    if ([400, 401, 403].contains(statusCode)) {
      return ServerFailure('$statusCode: ${response['message']}');
    }

    if (statusCode == 404) {
      return ServerFailure(
          '$statusCode: The request is not found. Please try again later: from server response');
    }

    if (statusCode == 500) {
      return ServerFailure(
          '$statusCode: Internal server error. Please try again later: from server response');
    }

    if(statusCode == 405){
      // logOut();
      return ServerFailure('$statusCode: Your session has been expired, please logout and login again');
    }

    return ServerFailure(
        '$statusCode: Failure with unknown server respond error!: from server response');
  }
}
