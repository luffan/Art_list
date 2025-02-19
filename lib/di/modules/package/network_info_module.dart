import 'package:cherrypick/cherrypick.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class NetworkInfoModule extends Module {
  @override
  void builder(Scope currentScope) {
    final internetConnectionChecker = InternetConnectionChecker.instance;
    bind<InternetConnectionChecker>()
        .toInstance(internetConnectionChecker)
        .singleton();
  }
}