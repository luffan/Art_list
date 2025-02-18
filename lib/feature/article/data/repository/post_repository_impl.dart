import 'package:art_list/core/error/exception.dart';
import 'package:art_list/core/error/failure.dart';
import 'package:art_list/core/network/interface/network_info.dart';
import 'package:art_list/feature/article/data/data_source/interface/cache_data_source.dart';
import 'package:art_list/feature/article/data/data_source/interface/pref_data_source.dart';
import 'package:art_list/feature/article/data/data_source/interface/remote_data_source.dart';
import 'package:art_list/feature/article/data/wrapper/post_wrapper.dart';
import 'package:art_list/feature/article/domain/entity/post.dart';
import 'package:art_list/feature/article/domain/repository/post_repository.dart';
import 'package:dartz/dartz.dart';

class PostRepositoryImpl implements PostRepository {
  final CacheDataSource _cacheDataSource;
  final RemoteDataSource _remoteDataSource;
  final PrefDataSource _prefDataSource;
  final NetworkInfo _networkInfo;
  final ListPostWrapper _listPostWrapper;

  const PostRepositoryImpl(
    this._cacheDataSource,
    this._remoteDataSource,
    this._prefDataSource,
    this._networkInfo,
  ) : _listPostWrapper = const ListPostWrapper();

  @override
  Future<Either<Failure, ListPost>> getPosts() async {
    final hasInternetConnection = await _networkInfo.isConnected;
    if (hasInternetConnection) {
      try {
        final posts = await _remoteDataSource.getPosts();
        final hasCachedPosts = await _prefDataSource.getFirstPostCache();
        if (!hasCachedPosts) {
          _cacheDataSource.savePosts(posts);
        }
        return Right(_listPostWrapper.convertToEntity(posts));
      } on ServerException {
        return Left(ServerFailure());
      } on PrefException {
        return Left(PrefFailure());
      }
    } else {
      try {
        final posts = await _cacheDataSource.getPosts();
        return Right(_listPostWrapper.convertToEntity(posts));
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
