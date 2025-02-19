import 'package:art_list/core/error/exception.dart';

mixin CacheMixin {
  Future<bool> hasData<T>(T Function() request) async {
    try {
      final result = request.call();
      return result != null;
    } catch (_) {
      return false;
    }
  }

  Future<bool> saveData(Future<void> Function() request) async {
    try {
      await request.call();
      return true;
    } catch (_) {
      throw CacheException();
    }
  }

  Future<T> getData<T, N>(N Function() request) async {
    try {
      final result = request.call();
      if (result != null) {
        return result as T;
      } else {
        throw NullException();
      }
    } catch (_) {
      throw CacheException();
    }
  }
}
