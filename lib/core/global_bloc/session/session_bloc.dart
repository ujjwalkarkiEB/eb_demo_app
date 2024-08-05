import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:local_session_timeout/local_session_timeout.dart';

part 'session_event.dart';
part 'session_state.dart';

class SessionBloc extends Bloc<SessionEvent, SessionState> {
  final SessionConfig _sessionConfig;
  StreamSubscription? _sessionSubscription;

  SessionBloc(this._sessionConfig) : super(SessionInactive()) {
    on<StartListeningEvent>(_onStartListening);
    on<StopListeningEvent>(_onStopListening);
    on<PauseSessionEvent>(_onPauseSession);
    on<ResumeSessionEvent>(_onResumeSession);
  }

  void _onStartListening(
      StartListeningEvent event, Emitter<SessionState> emit) {
    _sessionSubscription?.cancel();
    _sessionSubscription = _sessionConfig.stream.listen((timeoutEvent) {
      if (timeoutEvent == SessionTimeoutState.userInactivityTimeout ||
          timeoutEvent == SessionTimeoutState.appFocusTimeout) {
        add(StopListeningEvent());
      }
    });
    emit(SessionResumed()); // Start with the session resumed
  }

  void _onStopListening(StopListeningEvent event, Emitter<SessionState> emit) {
    emit(SessionExpired());
  }

  void _onPauseSession(PauseSessionEvent event, Emitter<SessionState> emit) {
    emit(SessionPaused());
  }

  void _onResumeSession(ResumeSessionEvent event, Emitter<SessionState> emit) {
    emit(SessionResumed());
  }

  @override
  Future<void> close() {
    _sessionSubscription?.cancel();
    return super.close();
  }
}
