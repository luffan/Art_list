import 'package:art_list/core/entity/converter.dart';
import 'package:art_list/core/error/failure.dart';
import 'package:art_list/core/function/repository_function.dart';
import 'package:art_list/core/network/interface/network_info.dart';
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
    return getData<ListComment>(
      networkInfo: _networkInfo,
      hasConnection: () async {
        final comments = await _remoteDataSource.getComments(postId);
        final hasCachedComment = await _cacheDataSource.hasCachedComments(
          postId,
        );
        if (!hasCachedComment) {
          _cacheDataSource.saveComments(comments);
        }
        return Right(_listCommentWrapper.convertToEntity(comments));
      },
      noConnection: () async {
        final comments = await _cacheDataSource.getComments(postId);
        return Right(_listCommentWrapper.convertToEntity(comments));
      },
    );
  }
}
