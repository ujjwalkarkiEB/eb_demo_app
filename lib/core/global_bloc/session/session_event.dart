part of 'session_bloc.dart';

abstract class SessionEvent {}

class StartListeningEvent extends SessionEvent {}

class StopListeningEvent extends SessionEvent {}

class PauseSessionEvent extends SessionEvent {}

class ResumeSessionEvent extends SessionEvent {}
