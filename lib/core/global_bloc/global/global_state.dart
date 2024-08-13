part of 'global_bloc.dart';

enum RefreshType {
  chatList,
}

sealed class GlobalStatusState {}

class InitialState extends GlobalStatusState {}

class RefreshState extends GlobalStatusState {
  final RefreshType refershType;

  RefreshState({required this.refershType});
}
