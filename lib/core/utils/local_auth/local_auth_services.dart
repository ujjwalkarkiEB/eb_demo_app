import 'dart:developer';

import 'package:eb_demo_app/core/utils/local_storage/database_helper.dart';
import 'package:injectable/injectable.dart';
import 'package:local_auth/local_auth.dart';

import '../constants/strings.dart';

@lazySingleton
class LocalAuthService {
  final LocalAuthentication _auth = LocalAuthentication();
  final DatabaseHelper _databaseHelper;

  LocalAuthService(this._databaseHelper);

  Future<bool> isBiometricAvailable() async {
    try {
      bool canCheckBiometrics = await _auth.canCheckBiometrics;
      bool isDeviceSupported = await _auth.isDeviceSupported();

      return canCheckBiometrics && isDeviceSupported;
    } catch (e) {
      print("Error checking biometrics: $e");
      return false;
    }
  }

  Future<List<BiometricType>> getAvailableBiometrics() async {
    try {
      return await _auth.getAvailableBiometrics();
    } catch (e) {
      log("Error getting available biometrics: $e");
      return <BiometricType>[];
    }
  }

  Future<bool> authenticateUser() async {
    try {
      return await _auth.authenticate(
        localizedReason: 'Please authenticate to proceed',
        options: const AuthenticationOptions(
          biometricOnly: true,
          useErrorDialogs: true,
          stickyAuth: true,
        ),
      );
    } catch (e) {
      log("Error during authentication: $e");
      return false;
    }
  }

  Future<void> enableBiometric(bool enable) async {
    final settingsBox = _databaseHelper.settingsBox;
    await settingsBox.put(biometricEnabledKey, enable.toString());
  }

  Future<bool> isBiometricEnabled() async {
    final settingsBox = _databaseHelper.settingsBox;
    final isEnabled =
        settingsBox.get(biometricEnabledKey, defaultValue: 'false');
    if (isEnabled == 'false') {
      return false;
    }
    return true;
  }
}
