import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:badges/badges.dart' as badges;
import 'package:iconsax/iconsax.dart';

import '../../../../src/features/shop/presentation/blocs/cart/cart_bloc.dart';
import '../../../config/route/app_route.dart';

class CartBadge extends StatelessWidget {
  const CartBadge({super.key});

  @override
  Widget build(BuildContext context) {
    int cartItemCount = 0;

    return BlocConsumer<CartBloc, CartState>(
      listener: (context, state) {
        // Handle CartState changes if necessary
        if (state is CartItemsCount) {
          cartItemCount = state.count;
        }
      },
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
              style: const TextStyle(
                  fontSize: 10, color: Colors.white), // Adjust font size
            ),
            badgeStyle: const badges.BadgeStyle(
              badgeColor: Colors.red,
              padding: EdgeInsets.all(4), // Adjust padding to change badge size
            ),
            child: const Icon(
              Iconsax.shopping_bag,
              size: 25,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
