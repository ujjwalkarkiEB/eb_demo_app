import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

@lazySingleton
class InternetConnectionHelpers {
  final _internetConnection = InternetConnection();
  Stream<InternetStatus> checkInternetStatus() {
    return _internetConnection.onStatusChange;
  }

  Future<bool> hasInternet() async {
    return await _internetConnection.hasInternetAccess;
  }
}
