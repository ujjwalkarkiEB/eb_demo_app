import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../data/model/user.dart';
import 'usersearch_event.dart';
import 'usersearch_state.dart';

@injectable
class UsersearchBloc extends Bloc<UsersearchEvent, UsersearchState> {
  UsersearchBloc() : super(UserListInitial([])) {
    on<FetchAllUserListEvent>(_onFetchAllUserList);
    on<SearchUserEvent>(_onSearchUser);
    on<EnableSearchEvent>(_onEnableSearch);
    on<DisableSearchEvent>(_onDisableSearch);
  }

  List<User> fetchedUsers = [];

  Future<void> _onFetchAllUserList(
    FetchAllUserListEvent event,
    Emitter<UsersearchState> emit,
  ) async {
    emit(UserListFetchLoading(state.users));

    try {
      final List<User> users = await _fetchUsersFromRepository();
      fetchedUsers = users;
      log('${fetchedUsers.length}');
      emit(UserListFetched(fetchedUsers));
    } catch (error) {
      emit(UserListFetchError(error: error.toString(), state.users));
    }
  }

  Future<void> _onSearchUser(
    SearchUserEvent event,
    Emitter<UsersearchState> emit,
  ) async {
    final query = event.query.toLowerCase();
    if (query.trim().isEmpty) {
      log('${fetchedUsers.length}');
      emit(SearchInactiveState(fetchedUsers));
    } else {
      final filteredUsers = state.users.where((user) {
        return user.userName.toLowerCase().contains(query);
      }).toList();

      emit(SearchActiveState(filteredUsers));
    }
  }

  void _onEnableSearch(
    EnableSearchEvent event,
    Emitter<UsersearchState> emit,
  ) {
    final currentState = state;
    if (currentState is SearchInactiveState) {
      emit(SearchActiveState(currentState.users));
    }
  }

  void _onDisableSearch(
    DisableSearchEvent event,
    Emitter<UsersearchState> emit,
  ) {
    emit(SearchInactiveState(fetchedUsers));
  }

  Future<List<User>> _fetchUsersFromRepository() async {
    await Future.delayed(const Duration(seconds: 2)); // Simulate network delay
    return [
      User(id: '1', userName: 'manish', avatar: null),
      User(id: '2', userName: 'ujjwal', avatar: null),
      User(id: '3', userName: 'dolly', avatar: null),
    ];
  }

  @override
  void onTransition(Transition<UsersearchEvent, UsersearchState> transition) {
    // TODO: implement onTransition
    super.onTransition(transition);
    print(transition);
  }
}
