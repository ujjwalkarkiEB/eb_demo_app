import 'package:auto_route/auto_route.dart';
import 'package:eb_demo_app/core/config/route/app_route.dart';
import 'package:eb_demo_app/src/features/shop/presentation/blocs/cart/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/common/widgets/cart/cart_badge.dart';
import '../../../../../../../core/utils/helpers/helper_functions.dart';

class PrimaryHeader extends StatelessWidget {
  const PrimaryHeader({super.key});

  @override
  Widget build(BuildContext context) {
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
      trailing: const CartBadge(), // Use CartBadge widget
    );
  }
}
