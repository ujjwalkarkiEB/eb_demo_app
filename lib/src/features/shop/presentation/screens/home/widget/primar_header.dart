import 'package:auto_route/auto_route.dart';
import 'package:eb_demo_app/core/config/route/app_route.dart';
import 'package:eb_demo_app/src/features/shop/presentation/blocs/cart/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/utils/helpers/helper_functions.dart';

class PrimaryHeader extends StatelessWidget {
  const PrimaryHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    int cartItemCount = 0;

    return ListTile(
      leading: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            HelperFunctions.getGreeting(TimeOfDay.now()),
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: Colors.white),
          ),
          Text(
            'Ujjwal Karki',
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .apply(color: Colors.white),
          ),
        ],
      ),
      trailing: BlocConsumer<CartBloc, CartState>(
        listener: (context, state) {},
        buildWhen: (previous, current) => current is CartItemsCount,
        builder: (context, state) {
          if (state is CartItemsCount) {
            cartItemCount = state.count;
          }

          return InkWell(
            onTap: () {
              context.router.push(const CartRoute());
            },
            child: badges.Badge(
              showBadge: cartItemCount > 0,
              badgeContent: Text(
                cartItemCount.toString(),
                style: TextStyle(
                    fontSize: 10, color: Colors.white), // Adjust font size
              ),
              badgeStyle: badges.BadgeStyle(
                badgeColor: Colors.red,
                padding:
                    EdgeInsets.all(4), // Adjust padding to change badge size
              ),
              child: Icon(
                Icons.cabin,
                size: 30,
                color: Colors.white,
              ),
            ),
          );
        },
      ),
    );
  }
}
