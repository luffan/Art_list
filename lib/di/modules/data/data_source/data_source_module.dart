import 'package:art_list/core/data/network/interface/network_info.dart';
import 'package:art_list/core/data/network/network_info_impl.dart';
import 'package:art_list/feature/article/data/client/rest_client.dart';
import 'package:art_list/feature/article/data/data_source/cache_data_source_impl.dart';
import 'package:art_list/feature/article/data/data_source/interface/cache_data_source.dart';
import 'package:art_list/feature/article/data/data_source/interface/remote_data_source.dart';
import 'package:art_list/feature/article/data/data_source/remote_data_source_impl.dart';
import 'package:cherrypick/cherrypick.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class SourceModule extends Module {
  @override
  void builder(Scope currentScope) {
    bind<NetworkInfo>()
        .toInstance(
          NetworkInfoImpl(
            currentScope.resolve<InternetConnectionChecker>(),
          ),
        )
        .singleton();

    bind<RemoteDataSource>()
        .toInstance(
          RemoteDataSourceImpl(
            currentScope.resolve<RestClient>(),
          ),
        )
        .singleton();

    bind<CacheDataSource>()
        .toInstance(
          CacheDataSourceImpl(),
        )
        .singleton();
  }
}
