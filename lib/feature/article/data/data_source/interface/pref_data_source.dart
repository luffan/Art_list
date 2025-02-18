abstract class PrefDataSource {
  Future<bool> getFirstPostCache();

  Future<bool> saveFirstPostCache();

  Future<bool> getFirstCommentCache(int postId);

  Future<bool> saveFirstCommentCache(int postId);

}