import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


part 'network_info.g.dart';
@riverpod
NetworkInfoImpl networkInfoImpl(NetworkInfoImplRef ref){
  return NetworkInfoImpl(DataConnectionChecker());
}

abstract class NetworkInfo {
  Future<bool>? get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  final DataConnectionChecker connectionChecker;

  NetworkInfoImpl(this.connectionChecker);

  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
}
