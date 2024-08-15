import 'package:equatable/equatable.dart';

sealed class UsersearchEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

final class FetchAllUserListEvent extends UsersearchEvent {}

final class SearchUserEvent extends UsersearchEvent {
  final String query;
  SearchUserEvent({required this.query});
}

final class EnableSearchEvent extends UsersearchEvent {}

final class DisableSearchEvent extends UsersearchEvent {}
