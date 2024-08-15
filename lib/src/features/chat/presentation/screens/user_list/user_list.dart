import 'package:auto_route/auto_route.dart';
import 'package:eb_demo_app/core/config/route/app_route.dart';
import 'package:eb_demo_app/src/features/chat/data/model/user.dart';
import 'package:eb_demo_app/src/features/chat/presentation/blocs/usersearch/usersearch_bloc.dart';
import 'package:eb_demo_app/src/features/chat/presentation/blocs/usersearch/usersearch_event.dart';
import 'package:eb_demo_app/src/features/chat/presentation/blocs/usersearch/usersearch_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

final List<String> dummyUsers = ['User 1', 'User 2', 'User 3'];

@RoutePage()
class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  UserListScreenState createState() => UserListScreenState();
}

class UserListScreenState extends State<UserListScreen> {
  final TextEditingController _searchController = TextEditingController();
  bool _isSearchActive = false;

  @override
  void initState() {
    super.initState();
    context.read<UsersearchBloc>().add(FetchAllUserListEvent());
  }

  void _clearSearch() {
    context.read<UsersearchBloc>().add(DisableSearchEvent());
    _searchController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersearchBloc, UsersearchState>(
      builder: (context, state) {
        if (state is SearchActiveState) {
          _isSearchActive = true;
        }
        if (state is SearchInactiveState) {
          _isSearchActive = false;
        }

        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                floating: true,
                pinned: true,
                backgroundColor: Colors.green,
                title: TextField(
                  controller: _searchController,
                  autofocus: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: _isSearchActive
                        ? IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: _clearSearch,
                          )
                        : const Icon(Iconsax.user),
                    labelText: 'Search Users',
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                  ),
                  onChanged: (value) => context
                      .read<UsersearchBloc>()
                      .add(SearchUserEvent(query: value)),
                ),
              ),
              if (state is UserListFetchLoading)
                const SliverFillRemaining(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final user = state.users[index];
                    return ListTile(
                      title: Text(user.userName),
                      onTap: () {
                        context.router.replace(PrivateChatRoomRoute(
                            reciverID: user.id, receiverName: user.userName));
                      },
                    );
                  },
                  childCount: state.users.length,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
