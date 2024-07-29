import 'package:auto_route/auto_route.dart';
import 'package:eb_demo_app/core/config/route/app_route.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

import '../../../../../../../../core/utils/helpers/helper_functions.dart';

class PrimaryHeader extends StatelessWidget {
  const PrimaryHeader({
    super.key,
  });

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
          )
        ],
      ),
      trailing: SizedBox(
        width: 40,
        height: 40,
        child: Stack(
          children: [
            Icon(
              Icons.cabin,
              size: 30,
              color: Colors.white,
            ),
            Positioned(
              top: -1,
              right: 0,
              child: InkWell(
                onTap: () {
                  context.router.push(CartRoute());
                },
                child: badges.Badge(
                  badgeContent: Text(
                    '100',
                    style: TextStyle(
                        fontSize: 10, color: Colors.white), // Adjust font size
                  ),
                  badgeStyle: badges.BadgeStyle(
                    badgeColor: Colors.red,
                    padding: EdgeInsets.all(
                        4), // Adjust padding to change badge size
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
