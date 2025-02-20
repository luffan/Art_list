import 'package:art_list/core/data/entity/converter.dart';
import 'package:art_list/core/data/network/interface/network_info.dart';
import 'package:art_list/core/utils/error/exception.dart';
import 'package:art_list/core/utils/error/failure.dart';
import 'package:art_list/feature/article/data/data_source/interface/cache_data_source.dart';
import 'package:art_list/feature/article/data/data_source/interface/remote_data_source.dart';
import 'package:art_list/feature/article/domain/entity/comment.dart';
import 'package:art_list/feature/article/domain/repository/comment_repository.dart';
import 'package:dartz/dartz.dart';

class CommentRepositoryImpl implements CommentRepository {
  final CacheDataSource _cacheDataSource;
  final RemoteDataSource _remoteDataSource;
  final Converter _listCommentWrapper;
  final NetworkInfo _networkInfo;

  CommentRepositoryImpl(
    this._cacheDataSource,
    this._remoteDataSource,
    this._listCommentWrapper,
    this._networkInfo,
  );

  @override
  Future<Either<Failure, ListComment>> getComments(int postId) async {
    final hasInternetConnection = await _networkInfo.isConnected;
    if (hasInternetConnection) {
      try {
        final comments = await _remoteDataSource.getComments(postId);
        final hasCachedComment = await _cacheDataSource.hasCachedComments(
          postId,
        );
        if (!hasCachedComment) {
          _cacheDataSource.saveComments(comments);
        }
        return Right(_listCommentWrapper.convertToEntity(comments));
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      } on CacheException catch (e) {
        return Left(CacheFailure(message: e.message));
      }
    } else {
      try {
        final hasCachedComment = await _cacheDataSource.hasCachedComments(
          postId,
        );
        if (hasCachedComment) {
          final comments = await _cacheDataSource.getComments(postId);
          return Right(_listCommentWrapper.convertToEntity(comments));
        } else {
          return Left(CacheFailure(message: 'No data in cash'));
        }
      } on CacheException catch (e) {
        return Left(CacheFailure(message: e.message));
      } on NullException catch (_) {
        return Left(NullFailure());
      }
    }
  }
}
