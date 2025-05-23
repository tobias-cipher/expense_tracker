import 'package:dio/dio.dart';

class ApiException {
  static List<String> getException(DioException exception) {
    switch (exception.type) {
      case DioExceptionType.connectionError:
        return ['Network Error', 'Check your network and try again'];
      case DioExceptionType.receiveTimeout:
        return ['Request Timeout', 'Check your network and try again'];

      case DioExceptionType.connectionTimeout:
        return ['Connection Timeout', 'Check your network and try again'];

      default:
        return ['Network Error', 'Check and try again'];
    }
  }
}
