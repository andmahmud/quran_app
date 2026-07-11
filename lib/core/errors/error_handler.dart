import 'package:dio/dio.dart';
import 'exceptions.dart';
import 'failures.dart';

class ErrorHandler {
  ErrorHandler._();

  static Failure handleError(Object error) {
    if (error is DioException) {
      return _handleDioError(error);
    } else if (error is ServerException) {
      return ServerFailure(message: error.message);
    } else if (error is CacheException) {
      return CacheFailure(message: error.message);
    } else if (error is NetworkException) {
      return NetworkFailure(message: error.message);
    } else if (error is TimeoutException) {
      return TimeoutFailure(message: error.message);
    } else {
      return UnknownFailure(message: error.toString());
    }
  }

  static Failure _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.transformTimeout:
        return const TimeoutFailure();
      case DioExceptionType.connectionError:
        return const NetworkFailure();
      case DioExceptionType.badResponse:
        return _handleBadResponse(error.response?.statusCode, error.response?.data);
      case DioExceptionType.cancel:
        return const ServerFailure(message: 'Request was cancelled');
      case DioExceptionType.badCertificate:
        return const ServerFailure(message: 'Certificate error');
      case DioExceptionType.unknown:
        return const UnknownFailure();
    }
  }

  static Failure _handleBadResponse(int? statusCode, dynamic data) {
    final message = data is Map ? data['message'] ?? 'Unknown error' : 'Unknown error';
    switch (statusCode) {
      case 400:
        return ServerFailure(message: 'Bad request: $message', );
      case 401:
        return const ServerFailure(message: 'Unauthorized');
      case 403:
        return const ServerFailure(message: 'Forbidden');
      case 404:
        return const ServerFailure(message: 'Not found');
      case 500:
        return const ServerFailure(message: 'Internal server error');
      default:
        return ServerFailure(message: 'Error $statusCode: $message');
    }
  }
}
