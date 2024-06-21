import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioException(DioException dioExceptionType) {
    switch (dioExceptionType.type) {
      case DioExceptionType.connectionTimeout: //connectTimeout
        return ServerFailure('Connection timeout with ApiServer');

      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with ApiServer');

      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with ApiServer');

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(dioExceptionType.response?.statusCode,
            dioExceptionType.response?.data);

      case DioExceptionType.cancel:
        return ServerFailure('Request to ApiServer was canceled');

      case DioExceptionType.unknown:
        return ServerFailure('No Internet Connection');

      default:
        return ServerFailure('Opps There was an Error, Please try again');
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure(
          'Your request not found, Please try later! :$response');
    } else if (statusCode == 500) {
      return ServerFailure(
          'Internal Server error, Please try later :$response');
    } else {
      return ServerFailure(
          'Opps There was an Error, Please try again :$response');
    }
  }
}
