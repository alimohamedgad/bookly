import 'package:dio/dio.dart';

abstract class Failure {
  final String msgError;

  Failure(this.msgError);
}

class ServerFailure extends Failure {
  ServerFailure(super.msgError);

  factory ServerFailure.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection Timeout with Api Server');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send Timeout with Api Server');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive Timeout with Api Server');

      case DioExceptionType.badCertificate:
        return ServerFailure('Bad Certificate with Api Server');

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioException.response!.statusCode!, dioException.response!.data);

      case DioExceptionType.cancel:
        return ServerFailure('Response to Api Cancel');

      case DioExceptionType.connectionError:
        return ServerFailure('connectionError  with Api Server');

      case DioExceptionType.unknown:
        if (dioException.message!.contains('SocketException')) {
          return ServerFailure('connectionError  with Api Server');
        }
        return ServerFailure('Unexpected Error');
      default:
        return ServerFailure('Opps There was an Error, Pleas try again');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your Request not found, Please try later');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server error, Please try later');
    } else {
      return ServerFailure('Opps There was an Error, Pleas try again');
    }
  }
}
