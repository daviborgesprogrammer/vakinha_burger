import 'package:dio/dio.dart';
import 'package:dio/io.dart';

import '../config/env/env.dart';
import 'interceptors/auth_interceptor.dart';

class CustomDio extends DioForNative {
  late AuthInterceptor _authInterceptor;
  CustomDio()
      : super(
          BaseOptions(
            baseUrl: Env.i['backend_base_url'] ?? '',
            connectTimeout: const Duration(seconds: 5),
            receiveTimeout: const Duration(seconds: 60),
          ),
        ) {
    interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        requestHeader: true,
      ),
    );
    _authInterceptor = AuthInterceptor();
  }

  CustomDio auth() {
    if (!interceptors.contains(_authInterceptor)) {
      interceptors.add(_authInterceptor);
    }
    return this;
  }

  CustomDio unauth() {
    interceptors.remove(_authInterceptor);
    return this;
  }
}
