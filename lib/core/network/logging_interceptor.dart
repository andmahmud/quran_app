import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (kDebugMode) {
      print('''
┌──────────────────────────────────────────────────
│ Request: ${options.method} ${options.uri}
│ Headers: ${options.headers}
│ Data: ${options.data}
└──────────────────────────────────────────────────''');
    }
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      print('''
┌──────────────────────────────────────────────────
│ Response: ${response.statusCode} ${response.requestOptions.uri}
│ Data: ${response.data?.toString().substring(0, (response.data?.toString().length ?? 0).clamp(0, 500))}
└──────────────────────────────────────────────────''');
    }
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      print('''
┌──────────────────────────────────────────────────
│ Error: ${err.type} ${err.requestOptions.uri}
│ Message: ${err.message}
└──────────────────────────────────────────────────''');
    }
    handler.next(err);
  }
}
