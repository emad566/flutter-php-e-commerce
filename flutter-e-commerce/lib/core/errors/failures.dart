import 'package:dio/dio.dart';

enum FailureTypes {
  dio,
  response,
  noInternet,
  flutterError,
}

abstract class Failure {
  final int? code;
  final FailureTypes type;
  final String errMessage;
  const Failure({required this.type, required this.errMessage, this.code});
}

class ServerFailure extends Failure {
  ServerFailure(
      {required FailureTypes type, required String errMessage, int? code})
      : super(type: type, errMessage: errMessage, code: code);
  factory ServerFailure.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.connectionTimeout:
        return ServerFailure(
            errMessage: 'Connection timeout with ApiServer',
            type: FailureTypes.dio);

      case DioErrorType.sendTimeout:
        return ServerFailure(
            errMessage: 'Connection timeout with send to ApiServer',
            type: FailureTypes.dio);

      case DioErrorType.receiveTimeout:
        return ServerFailure(
            errMessage: 'Connection timeout with receive from ApiServer',
            type: FailureTypes.dio);

      case DioErrorType.badCertificate:
        return ServerFailure(
            errMessage: 'Connection refused duo to bad certificate',
            type: FailureTypes.dio);

      case DioErrorType.badResponse:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode, dioError.response!.data);

      case DioErrorType.cancel:
        return ServerFailure(
            errMessage: 'Connection has been canceled', type: FailureTypes.dio);

      case DioErrorType.connectionError:
        return ServerFailure(
            errMessage: 'Server Connection Error', type: FailureTypes.dio);

      case DioErrorType.unknown:
        return ServerFailure(
            errMessage: 'Failure with unknown error!', type: FailureTypes.dio);
      default:
        return ServerFailure(
            errMessage: 'Failure with unexpected error!. try again',
            type: FailureTypes.dio);
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if ([400, 401, 403].contains(statusCode)) {
      return ServerFailure(
          errMessage: '$statusCode: ${response['message']}',
          type: FailureTypes.response,
          code: statusCode);
    }

    if (statusCode == 404) {
      return ServerFailure(
          errMessage:
              '$statusCode: The request is not found. Please try again later: from server response',
          type: FailureTypes.response,
          code: statusCode);
    }

    if (statusCode == 500) {
      return ServerFailure(
          errMessage:
              '$statusCode: Internal server error. Please try again later: from server response',
          type: FailureTypes.response,
          code: statusCode);
    }

    if (statusCode == 405) {
      // logOut();
      return ServerFailure(
          errMessage:
              '$statusCode: Your session has been expired, please logout and login again',
          type: FailureTypes.response,
          code: statusCode);
    }

    return ServerFailure(
        errMessage:
            '$statusCode: Failure with unknown server respond error!: from server response',
        type: FailureTypes.response,
        code: statusCode);
  }
}
