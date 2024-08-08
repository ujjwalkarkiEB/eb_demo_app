// lib/core/config/session/session_manager.dart
import 'dart:async';
import 'package:injectable/injectable.dart';
import 'package:local_session_timeout/local_session_timeout.dart';

enum SessionStateEnum { active, expired, paused, resumed, inactive }

@lazySingleton
class SessionManager {
  final StreamController<SessionState> _sessionStateStreamController =
      StreamController<SessionState>.broadcast(); // Use broadcast stream
  late SessionConfig sessionConfig;
  StreamSubscription<SessionTimeoutState>? _timeoutSubscription;

  void configureSession({
    required Duration invalidateSessionForAppLostFocus,
    required Duration invalidateSessionForUserInactivity,
  }) {
    sessionConfig = SessionConfig(
      invalidateSessionForAppLostFocus: invalidateSessionForAppLostFocus,
      invalidateSessionForUserInactivity: invalidateSessionForUserInactivity,
    );
  }

  void startListening() {
    _timeoutSubscription =
        sessionConfig.stream.listen((SessionTimeoutState timeoutEvent) {
      if (timeoutEvent == SessionTimeoutState.userInactivityTimeout ||
          timeoutEvent == SessionTimeoutState.appFocusTimeout) {
        print('timeoy');
        _sessionStateStreamController.add(SessionState.stopListening);
      }
    });
  }

  void stopListening() {
    _sessionStateStreamController.add(SessionState.stopListening);
    _timeoutSubscription?.cancel();
    _sessionStateStreamController.close();
  }

  Stream<SessionState> get sessionStateStream =>
      _sessionStateStreamController.stream;

  void dispose() {
    _timeoutSubscription?.cancel();
    _sessionStateStreamController.close();
  }
}
