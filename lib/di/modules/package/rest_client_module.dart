import 'package:art_list/feature/article/data/client/rest_client.dart';
import 'package:cherrypick/cherrypick.dart';
import 'package:dio/dio.dart';



class RestClientModule extends Module {
  @override
  void builder(Scope currentScope) {
    final restClient = RestClient(currentScope.resolve<Dio>());

    bind<RestClient>().toInstance(restClient).singleton();
  }
}