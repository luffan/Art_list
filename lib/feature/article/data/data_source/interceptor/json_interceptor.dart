import 'package:dio/dio.dart';

class JsonInterceptor extends Interceptor {
  JsonInterceptor();

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // if (response.data is List) {
    //   final parseData = response.requestOptions.path.split('/');
    //   response.data = {parseData.last: response.data};
    // }
    super.onResponse(response, handler);
  }
}
