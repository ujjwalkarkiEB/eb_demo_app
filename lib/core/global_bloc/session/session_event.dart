part of 'session_bloc.dart';

abstract class SessionEvent extends Equatable {
  const SessionEvent();

  @override
  List<Object?> get props => [];
}

class StartListeningEvent extends SessionEvent {}

class StopListeningEvent extends SessionEvent {}

class PauseSessionEvent extends SessionEvent {}

class ResumeSessionEvent extends SessionEvent {}

class SessionExpiredEvent extends SessionEvent {}

class SessionActiveEvent extends SessionEvent {}
