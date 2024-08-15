import 'package:equatable/equatable.dart';

import '../../../data/model/user.dart';

sealed class UsersearchState extends Equatable {
  final List<User> users;
  @override
  List<Object?> get props => [users];

  const UsersearchState(this.users);
}

final class UserListInitial extends UsersearchState {
  UserListInitial(super.users);
}

final class UserListFetchLoading extends UsersearchState {
  UserListFetchLoading(super.users);
}

final class UserListFetched extends UsersearchState {
  UserListFetched(super.users);
}

final class UserListFetchError extends UsersearchState {
  final String error;
  const UserListFetchError(super.users, {required this.error});
}

final class SearchActiveState extends UsersearchState {
  SearchActiveState(super.users);
}

final class SearchInactiveState extends UsersearchState {
  SearchInactiveState(super.users);
}
