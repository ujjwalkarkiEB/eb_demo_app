part of 'internet_bloc.dart';

enum ConnectionState { initial, offline, online }

class InternetState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class Offline extends InternetState {}

final class Online extends InternetState {}

final class Initial extends InternetState {}

final class InternetConnectionActive extends InternetState {}

final class InternetConnectionInactive extends InternetState {}

final class InternetConnectionRestored extends InternetState {}
