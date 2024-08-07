part of 'session_bloc.dart';

sealed class BlocSessionState {}

class SessionInactive extends BlocSessionState {}

class SessionActive extends BlocSessionState {}

class SessionExpired extends BlocSessionState {}

class SessionPaused extends BlocSessionState {}

class SessionResumed extends BlocSessionState {}
