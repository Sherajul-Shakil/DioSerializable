import 'dart:convert';

import 'package:dio/dio.dart';

class HttpService {
  late Dio _dio;

  final baseUrl = "https://reqres.in/";

  HttpService() {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
    ));

    initializeInterceptors();
  }

  Future<Response> getRequest(String endPoint) async {
    Response response;

    try {
      response = await _dio.get(endPoint);
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }

    return response;
  }

  initializeInterceptors() {
    _dio.interceptors
        .add(InterceptorsWrapper(onError: (error, ErrorInterceptorHandler) {
      print(error.message);
    }, onRequest: (request, handler) {
      print("${request.method} ${request.path}");
      return handler.next(request);
    }, onResponse: (response, handler) {
      print(response.data);
      return handler.next(response);
    }));
  }
}
