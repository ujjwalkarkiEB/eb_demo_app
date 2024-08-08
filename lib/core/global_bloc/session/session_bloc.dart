import 'dart:async';
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
  late final StreamSubscription<SessionState> _sessionStateSubscription;

  SessionBloc(this._sessionManager) : super(SessionInactive()) {
    // Handle the stream subscription and event addition
    _sessionStateSubscription =
        _sessionManager.sessionStateStream.listen((state) {
      if (state == SessionState.stopListening) {
        add(SessionExpiredEvent());
      } else {
        // Add other states if needed
        add(SessionActiveEvent()); // Assuming you have such an event
      }
    });

    on<StartListeningEvent>(_onStartListening);
    on<StopListeningEvent>(_onStopListening);
    on<PauseSessionEvent>(_onPauseSession);
    on<ResumeSessionEvent>(_onResumeSession);
    on<SessionExpiredEvent>(_onSessionExpiredEvent);
  }

  void _onStartListening(
      StartListeningEvent event, Emitter<BlocSessionState> emit) {
    _sessionManager.startListening();
    emit(SessionResumed());
  }

  void _onStopListening(
      StopListeningEvent event, Emitter<BlocSessionState> emit) {
    _sessionManager.stopListening();
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
  Future<void> close() {
    _sessionStateSubscription.cancel(); // Cancel the subscription
    _sessionManager.dispose();
    return super.close();
  }

  @override
  void onTransition(Transition<SessionEvent, BlocSessionState> transition) {
    // TODO: implement onTransition
    super.onTransition(transition);
    print('tras: $transition');
  }
}
