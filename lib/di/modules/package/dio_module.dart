import 'package:art_list/feature/article/data/data_source/constants/dio_constants.dart';
import 'package:art_list/feature/article/data/data_source/interceptor/json_interceptor.dart';
import 'package:art_list/feature/article/data/data_source/interceptor/log_interceptor.dart';
import 'package:cherrypick/cherrypick.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class DioModule extends Module {
  @override
  void builder(Scope currentScope) {
    final Dio dio = Dio();
    dio.options = dioClientOptions;
    dio.interceptors.addAll([
      JsonInterceptor(),
      LoggerInterceptor(
        currentScope.resolve<Logger>(),
      ),
    ]);
    bind<Dio>().toInstance(dio).singleton();
  }
}
