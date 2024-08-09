import 'dart:async';
import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:local_session_timeout/local_session_timeout.dart';

@lazySingleton
class SessionManager {
  late StreamController<SessionState> _sessionStateStreamController;
  late SessionConfig sessionConfig;
  StreamSubscription<SessionTimeoutState>? _timeoutSubscription;

  SessionManager() {
    _sessionStateStreamController = StreamController<SessionState>.broadcast();
  }

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
    if (_timeoutSubscription != null) {
      log('Already listening to session timeouts.');
      return; // Avoid multiple subscriptions
    }

    _sessionStateStreamController = StreamController<SessionState>.broadcast();
    log('Starting timeout subscription...');
    _sessionStateStreamController.add(SessionState.startListening);

    _timeoutSubscription = sessionConfig.stream.listen(
      (SessionTimeoutState timeoutEvent) {
        log('Received timeout event: $timeoutEvent');
        if (timeoutEvent == SessionTimeoutState.userInactivityTimeout ||
            timeoutEvent == SessionTimeoutState.appFocusTimeout) {
          log('Session timeout occurred.');
          _sessionStateStreamController.add(SessionState.stopListening);
        }
      },
      onError: (error) {
        log('Error in session timeout stream: $error');
      },
      onDone: () {
        log('Session timeout stream closed.');
      },
    );
  }

  Future<void> stopListening() async {
    _sessionStateStreamController.add(SessionState.stopListening);

    await _timeoutSubscription?.cancel();
    _timeoutSubscription = null;
    _resetStream();
  }

  void _resetStream() {
    _sessionStateStreamController.close();
  }

  Stream<SessionState> get sessionStateStream =>
      _sessionStateStreamController.stream;

  Future<void> dispose() async {
    await stopListening(); // Ensure any ongoing subscription is cancelled
    _sessionStateStreamController.close();
  }
}
