import 'package:art_list/core/entity/converter.dart';
import 'package:art_list/core/error/exception.dart';
import 'package:art_list/core/error/failure.dart';
import 'package:art_list/core/network/interface/network_info.dart';
import 'package:art_list/feature/article/data/data_source/interface/cache_data_source.dart';
import 'package:art_list/feature/article/data/data_source/interface/remote_data_source.dart';
import 'package:art_list/feature/article/domain/entity/post.dart';
import 'package:art_list/feature/article/domain/entity/post_details.dart';
import 'package:art_list/feature/article/domain/repository/post_repository.dart';
import 'package:dartz/dartz.dart';

class PostRepositoryImpl implements PostRepository {
  final CacheDataSource _cacheDataSource;
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;
  final Converter _listPostWrapper;
  final Converter _detailsPostWrapper;

  const PostRepositoryImpl(
    this._cacheDataSource,
    this._remoteDataSource,
    this._networkInfo,
    this._listPostWrapper,
    this._detailsPostWrapper,
  );

  @override
  Future<Either<Failure, ListPost>> getPosts() async {
    final hasInternetConnection = await _networkInfo.isConnected;
    if (hasInternetConnection) {
      try {
        final posts = await _remoteDataSource.getPosts();
        final hasCachedPosts = await _cacheDataSource.hasCachedPosts();
        if (!hasCachedPosts) {
          _cacheDataSource.savePosts(posts);
        }
        return Right(_listPostWrapper.convertToEntity(posts));
      } on ServerException {
        return Left(ServerFailure());
      } on CacheException {
        return Left(CacheFailure());
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

  @override
  Future<Either<Failure, PostDetails>> getDetails(int postId) async {
    final hasInternetConnection = await _networkInfo.isConnected;
    if (hasInternetConnection) {
      try {
        final details = await _remoteDataSource.getPostDetails(postId);
        final hasCachedPostsDetails = await _cacheDataSource.hasCachedDetails(
          postId,
        );
        if (!hasCachedPostsDetails) {
          _cacheDataSource.savePostDetails(details);
        }
        return Right(_detailsPostWrapper.convertToEntity(details));
      } on ServerException {
        return Left(ServerFailure());
      } on CacheException {
        return Left(CacheFailure());
      }
    } else {
      try {
        final details = await _cacheDataSource.getPostDetails(postId);
        return Right(_listPostWrapper.convertToEntity(details));
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
