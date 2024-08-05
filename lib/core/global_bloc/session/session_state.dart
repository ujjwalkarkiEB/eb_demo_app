part of 'session_bloc.dart';

enum SessionStateEnum { active, expired, paused, resumed, inactive }

sealed class SessionState {}

class SessionInactive extends SessionState {}

class SessionActive extends SessionState {}

class SessionExpired extends SessionState {}

class SessionPaused extends SessionState {}

class SessionResumed extends SessionState {}
