import 'package:data_connection_checker/data_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImplementer extends NetworkInfo {
  NetworkInfoImplementer(this._dataConnectionChecker);

  final DataConnectionChecker _dataConnectionChecker;

  @override
  Future<bool> get isConnected => _dataConnectionChecker.hasConnection;
}
