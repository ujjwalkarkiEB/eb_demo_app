import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../../core/config/route/app_route.dart';

class UserSearchContainer extends StatelessWidget {
  const UserSearchContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.push(UserListRoute());
      },
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          suffixIcon: Icon(Iconsax.user),
          labelText: 'Search Users',
        ),
        enabled: false,
      ),
    );
  }
}
