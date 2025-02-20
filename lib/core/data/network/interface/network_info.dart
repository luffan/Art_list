/// Interface for checking internet connection
abstract class NetworkInfo {
  Future<bool> get isConnected;
}