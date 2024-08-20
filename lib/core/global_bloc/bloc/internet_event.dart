part of 'internet_bloc.dart';

sealed class InternetEvent {}

class InternetConnectedEvent extends InternetEvent {}

class InternetDisConnectedEvent extends InternetEvent {}
