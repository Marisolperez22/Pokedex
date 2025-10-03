import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio;
  DioClient([Dio? dio]) : _dio = dio ?? Dio(BaseOptions(baseUrl: 'https://pokeapi.co/api/v2/')) {
    _dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
    _dio.options.connectTimeout = const Duration(seconds: 10);
  }

  Dio get client => _dio;
}
