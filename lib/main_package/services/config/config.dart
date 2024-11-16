import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:radar_peconhento_mobile/main_package/services/config/env.dart';

class Config extends DioForNative {
  Config()
      : super(
          BaseOptions(
            baseUrl: Env.i['backend_base_url'] ?? '',
            connectTimeout: const Duration(seconds: 10),
            receiveTimeout: const Duration(seconds: 60),
          ),
        ) {
    interceptors.addAll([
      LogInterceptor(requestBody: true, responseBody: true),
    ]);
  }

  Config get auth {
    options.extra['DIO_AUTH_KEY'] = true;
    return this;
  }

  Config get unAuth {
    options.extra['DIO_AUTH_KEY'] = false;
    return this;
  }
}

abstract class HttpMethods {
  static const String post = 'POST';
  static const String get = 'GET';
  static const String put = 'PUT';
  static const String patch = 'PATCH';
  static const String delete = 'DELETE';
}
