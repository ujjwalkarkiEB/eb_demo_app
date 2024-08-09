import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class UserSearchContainer extends StatelessWidget {
  const UserSearchContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search),
        suffixIcon: Icon(Iconsax.user),
        labelText: 'Search Users',
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
    );
  }
}
