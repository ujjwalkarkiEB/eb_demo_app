import 'dart:developer';
import 'package:injectable/injectable.dart';
import 'package:local_auth/local_auth.dart';
import 'package:hive/hive.dart';

import '../constants/strings.dart';
import 'package:eb_demo_app/core/utils/local_storage/database_helper.dart';

@lazySingleton
class LocalAuthService {
  final LocalAuthentication _auth = LocalAuthentication();
  final DatabaseHelper _databaseHelper;

  LocalAuthService(this._databaseHelper);

  /// Checks if biometric authentication is available on the device.
  Future<bool> isBiometricAvailable() async {
    try {
      bool canCheckBiometrics = await _auth.canCheckBiometrics;
      bool isDeviceSupported = await _auth.isDeviceSupported();
      return canCheckBiometrics && isDeviceSupported;
    } catch (e) {
      log("Error checking biometrics: $e");
      return false;
    }
  }

  /// Retrieves the list of available biometric types on the device.
  Future<List<BiometricType>> getAvailableBiometrics() async {
    try {
      return await _auth.getAvailableBiometrics();
    } catch (e) {
      log("Error getting available biometrics: $e");
      return <BiometricType>[];
    }
  }

  /// Authenticates the user using biometric authentication.
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

  /// Enables or disables biometric authentication
  Future<void> enableBiometric(bool enable) async {
    final settingsBox = _databaseHelper.settingsBox;
    await settingsBox.put(biometricEnabledKey, enable.toString());
  }

  /// Checks if biometric authentication is enabled in the app settings.
  Future<bool> isBiometricEnabled() async {
    final settingsBox = _databaseHelper.settingsBox;
    final isEnabled =
        settingsBox.get(biometricEnabledKey, defaultValue: 'false');
    return isEnabled == 'true';
  }
}
