import 'package:auto_route/auto_route.dart';
import 'package:eb_demo_app/core/config/injection/injection.dart';
import 'package:eb_demo_app/core/config/route/app_route.dart';
import 'package:eb_demo_app/core/global_bloc/session/session_bloc.dart';
import 'package:eb_demo_app/core/utils/constants/colors.dart';
import 'package:eb_demo_app/core/utils/session/session_config.dart';
import 'package:eb_demo_app/src/features/personalization/presentation/bloc/personalization_bloc.dart';
import 'package:eb_demo_app/src/features/shop/presentation/blocs/store/store_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:local_session_timeout/local_session_timeout.dart';
import 'package:quickalert/quickalert.dart';

@RoutePage()
class MainNavScreen extends StatefulWidget {
  const MainNavScreen({super.key});

  @override
  State<MainNavScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainNavScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<StoreBloc>()..add(FetchCategoryProducts()),
        ),
        BlocProvider(
          create: (context) =>
              getIt<PersonalizationBloc>()..add(ProfileFetchRequestEvent()),
        ),
      ],
      child: BlocListener<SessionBloc, BlocSessionState>(
        listener: (context, state) async {
          if (state is SessionExpired) {
            await QuickAlert.show(
              context: context,
              type: QuickAlertType.warning,
              text: 'Sesssion is expired! Reidrecting to login again',
              width: 50,
            );
            if (!context.mounted) {
              return;
            }
            context.router.pushAndPopUntil(
              const SigninRoute(),
              predicate: (route) => false,
            );
          }
        },
        child: SessionTimeoutManager(
          sessionConfig: getIt<SessionManager>().sessionConfig,
          child: AutoTabsScaffold(
            routes: const [
              HomeRoute(),
              StoreRoute(),
              MyProductsRoute(),
              PersonalizationRoute(),
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
                selectedIconTheme:
                    const IconThemeData(color: AppColors.buttonColor),
                // selectedItemColor: .buttonColor,
                iconSize: 25,
                items: const [
                  BottomNavigationBarItem(
                    label: 'Home',
                    icon: Icon(Icons.home),
                  ),
                  BottomNavigationBarItem(
                      label: 'Store', icon: Icon(Icons.store)),
                  BottomNavigationBarItem(
                      label: 'Wishlist', icon: Icon(Icons.favorite)),
                  BottomNavigationBarItem(
                      label: 'Profile', icon: Icon(Iconsax.profile_2user)),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
