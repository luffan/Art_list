import 'package:cherrypick/cherrypick.dart';
import 'package:logger/logger.dart';

class LoggerModule extends Module {
  @override
  void builder(Scope currentScope) {
    bind<Logger>().toInstance(Logger()).singleton();
  }
}