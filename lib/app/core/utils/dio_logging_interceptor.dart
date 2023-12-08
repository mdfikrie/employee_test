import 'package:dio/dio.dart';
import 'package:employee_test/app/config/base_url.dart';

class DioLoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.baseUrl = BaseUrl.url;
    super.onRequest(options, handler);
  }
}
