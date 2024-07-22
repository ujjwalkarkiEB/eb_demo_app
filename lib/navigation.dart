import 'package:auto_route/auto_route.dart';
import 'package:eb_demo_app/core/config/route/app_route.dart';
import 'package:eb_demo_app/core/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

@RoutePage()
class HomeNavScreen extends StatefulWidget {
  const HomeNavScreen({super.key});

  @override
  State<HomeNavScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<HomeNavScreen> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        EventNavigationRoute(),
        MyEventsRoute(),
        PersonalizationRoute()
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          type: BottomNavigationBarType.shifting,

          unselectedItemColor: Colors.grey,
          elevation: 14,
          currentIndex: tabsRouter.activeIndex,
          onTap: (index) {
            // if (tabsRouter.activeIndex != index) {
            //   if (tabsRouter.activeIndex == 0) {
            //     tabsRouter.stack.first;
            //   }
            tabsRouter.setActiveIndex(index);
            // }
          },
          selectedIconTheme: const IconThemeData(color: AppColors.buttonColor),
          // selectedItemColor: .buttonColor,
          iconSize: 25,
          items: const [
            BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
            BottomNavigationBarItem(
                label: 'My Events', icon: Icon(Icons.favorite_outlined)),
            BottomNavigationBarItem(
                label: 'Profile', icon: Icon(Iconsax.profile_2user)),
          ],
        );
      },
    );
  }
}
