import 'dart:async';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:local_session_timeout/local_session_timeout.dart';

import '../../utils/session/session_config.dart';

part 'session_event.dart';
part 'session_state.dart';

@injectable
class SessionBloc extends Bloc<SessionEvent, BlocSessionState> {
  final SessionManager _sessionManager;
  StreamSubscription<SessionState>? _sessionStateSubscription;

  SessionBloc(this._sessionManager) : super(SessionInactive()) {
    on<StartListeningEvent>(_onStartListening);
    on<StopListeningEvent>(_onStopListening);
    on<PauseSessionEvent>(_onPauseSession);
    on<ResumeSessionEvent>(_onResumeSession);
    on<SessionExpiredEvent>(_onSessionExpiredEvent);
  }

  void _onStartListening(
      StartListeningEvent event, Emitter<BlocSessionState> emit) {
    log('Starting session listener...');

    try {
      _sessionManager.startListening();

      _sessionStateSubscription = _sessionManager.sessionStateStream.listen(
        (state) {
          log('Session state received: $state');

          if (state == SessionState.stopListening) {
            add(SessionExpiredEvent());
          } else {
            add(SessionActiveEvent());
          }
        },
        onError: (error) {
          log('Session state stream error: $error');
        },
      );

      emit(SessionResumed());
    } catch (e) {
      log('Error starting session listener: $e');
    }
  }

  Future<void> _onStopListening(
      StopListeningEvent event, Emitter<BlocSessionState> emit) async {
    await _sessionStateSubscription?.cancel();
    _sessionStateSubscription = null;
    await _sessionManager
        .stopListening(); // Ensure session manager stops listening
    emit(SessionExpired());
  }

  void _onPauseSession(
      PauseSessionEvent event, Emitter<BlocSessionState> emit) {
    emit(SessionPaused());
  }

  void _onResumeSession(
      ResumeSessionEvent event, Emitter<BlocSessionState> emit) {
    emit(SessionResumed());
  }

  void _onSessionExpiredEvent(
      SessionExpiredEvent event, Emitter<BlocSessionState> emit) {
    emit(SessionExpired());
  }

  @override
  Future<void> close() async {
    await _sessionStateSubscription
        ?.cancel(); // Cancel subscription if it exists
    await _sessionManager.dispose(); // Dispose the session manager
    return super.close();
  }

  @override
  void onTransition(Transition<SessionEvent, BlocSessionState> transition) {
    super.onTransition(transition);
    print('Transition: $transition');
  }
}
