
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../secure_storage/shared_preferences.dart';

class Api {
  late final dio = Dio(options)..interceptors.addAll([_BasicInterceptor()]);
  final options = BaseOptions(
    baseUrl:'http://89.223.100.35:8080/api/v1/',
  );
}

class _BasicInterceptor implements Interceptor {

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler)async {
    var token  = await SharedPrefModel().getToken();
    debugPrint(token);
    options.headers = {
      "Authorization" :"Bearer $token"
    };
    handler.next(options);
  }
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }
}