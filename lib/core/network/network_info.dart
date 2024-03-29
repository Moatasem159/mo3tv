import 'package:internet_connection_checker/internet_connection_checker.dart';
abstract class NetworkInfo {
  Future<bool> get isConnected;
  Stream<InternetConnectionStatus> checkConnection();
}
class NetworkInfoImpl implements NetworkInfo{
  final InternetConnectionChecker _connectionChecker;
  const NetworkInfoImpl(this._connectionChecker);
  @override
  Future<bool> get isConnected async => await _connectionChecker.hasConnection;
  @override
  Stream<InternetConnectionStatus> checkConnection() {
    return _connectionChecker.onStatusChange;
  }
}