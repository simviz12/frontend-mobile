import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'api_config.dart';
import 'auth_interceptor.dart';

@lazySingleton
class DioClient {
  final Dio _dio;

  DioClient(AuthInterceptor authInterceptor)
      : _dio = Dio(
          BaseOptions(
            baseUrl: ApiConfig.baseUrl,
            connectTimeout: ApiConfig.connectTimeout,
            receiveTimeout: ApiConfig.receiveTimeout,
            contentType: 'application/json',
          ),
        ) {
    _dio.interceptors.add(authInterceptor);
  }

  Dio get dio => _dio;
}
