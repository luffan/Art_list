import 'package:art_list/di/modules/data/data_source/data_source_module.dart';
import 'package:art_list/di/modules/data/repository/repository_module.dart';
import 'package:art_list/di/modules/data/wrapper/wrapper_module.dart';
import 'package:art_list/di/modules/domain/usecase/usecase_module.dart';
import 'package:art_list/di/modules/package/dio_module.dart';
import 'package:art_list/di/modules/package/logger_module.dart';
import 'package:art_list/di/modules/package/network_info_module.dart';
import 'package:art_list/di/modules/package/rest_client_module.dart';
import 'package:art_list/di/modules/presentation/bloc/bloc_module.dart';
import 'package:cherrypick/cherrypick.dart';

abstract class Injector {
  static late final Scope locator;

  static void configureDependencies() {
    final scope = openRootScope().installModules([
      LoggerModule(),
      DioModule(),
      NetworkInfoModule(),
      RestClientModule(),
    ]);

    final dataScope = scope.openSubScope('data').installModules(
      [
        SourceModule(),
        WrapperModule(),
        RepositoryModule(),
      ],
    );

    final domainScope = dataScope.openSubScope('domain').installModules(
      [
        UseCaseModule(),
      ],
    );

    final presentationScope =
        domainScope.openSubScope('presentation').installModules(
      [
        BlocModule(),
      ],
    );

    locator = presentationScope;
  }

  static void dispose() {
    locator.closeSubScope('presentation');
    locator.closeSubScope('domain');
    locator.closeSubScope('data');
    CherryPick.closeRootScope();
  }
}
