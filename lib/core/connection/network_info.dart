//!data_connection_checker_tv
import 'package:data_connection_checker_tv/data_connection_checker.dart';

// true if internet connection false if no internet connection
abstract class NetworkInfo {
  Future<bool>? get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  final DataConnectionChecker connectionChecker;

  NetworkInfoImpl(this.connectionChecker);

  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
}
