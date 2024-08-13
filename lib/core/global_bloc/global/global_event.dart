part of 'global_bloc.dart';
// refresh_type.dart

sealed class GlobalStatusEvent {}

class RefreshDataEvent extends GlobalStatusEvent {
  final RefreshType refreshType;

  RefreshDataEvent(this.refreshType);
}
