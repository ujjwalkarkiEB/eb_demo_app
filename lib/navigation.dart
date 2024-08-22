import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:eb_demo_app/core/common/widgets/snackbars/error_snackbar.dart';
import 'package:eb_demo_app/core/common/widgets/snackbars/sucess_snackbar.dart';
import 'package:eb_demo_app/core/config/injection/injection.dart';
import 'package:eb_demo_app/core/config/route/app_route.dart';
import 'package:eb_demo_app/core/global_bloc/bloc/internet_bloc.dart';
import 'package:eb_demo_app/core/global_bloc/session/session_bloc.dart';
import 'package:eb_demo_app/core/utils/constants/colors.dart';
import 'package:eb_demo_app/src/features/chat/presentation/blocs/socket/socket_bloc.dart';
import 'package:eb_demo_app/src/features/personalization/presentation/bloc/personalization_bloc.dart';
import 'package:eb_demo_app/src/features/shop/presentation/blocs/store/store_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quickalert/quickalert.dart';

@RoutePage()
class MainNavScreen extends StatefulWidget {
  const MainNavScreen({super.key});

  @override
  State<MainNavScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainNavScreen> {
  @override
  void initState() {
    super.initState();
    // start subscribing stram to  listen for timeout events
    // context.read<SessionBloc>().add(StartListeningEvent());
    // open socket connection for listening events
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                getIt<SocketBloc>()..add(OpenSocketConnection())),
        BlocProvider(
          create: (context) => getIt<StoreBloc>()..add(FetchCategoryProducts()),
        ),
        BlocProvider(
          create: (context) => getIt<PersonalizationBloc>(),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<SessionBloc, BlocSessionState>(
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
          ),
          BlocListener<SocketBloc, SocketState>(
            listener: (context, state) {
              if (state is OnlineUsersState) {
                log('emitted');
              }
            },
          ),
          BlocListener<InternetBloc, InternetState>(
            listener: (context, state) {
              // if (state is Online) {
              //   showSuccessSnackbar(
              //       context, 'Your Internet Connection is Restored');
              // }
              if (state is Offline) {
                // ScaffoldMessenger.of(context).showMaterialBanner(MaterialBanner(
                //     content: const Text('You are in offline mode!'),
                //     contentTextStyle:
                //         const TextStyle(color: Colors.white, fontSize: 14),
                //     backgroundColor: Colors.red,
                //     leadingPadding: const EdgeInsets.only(right: 30),
                //     leading: const Icon(
                //       Icons.signal_wifi_connected_no_internet_4,
                //     ),
                //     actions: [
                //       TextButton(
                //           onPressed: () {
                //             Navigator.of(context).pop();
                //           },
                //           child: const Text('Dismiss')),
                //     ]));
                showFlashError(context, 'You are in offline mode!',
                    icon: Icons.signal_wifi_connected_no_internet_4);
              }
            },
          ),
        ],
        child: AutoTabsScaffold(
          routes: const [
            HomeRoute(),
            StoreRoute(),
            MyProductsRoute(),
            ChatNavigatioRoute(),
            PersonalizationRoute(),
          ],
          bottomNavigationBuilder: (_, tabsRouter) {
            return BottomNavigationBar(
              type: BottomNavigationBarType.shifting,

              unselectedItemColor: Colors.grey,
              elevation: 14,
              currentIndex: tabsRouter.activeIndex,
              onTap: (index) {
                if (tabsRouter.activeIndex != index) {
                  tabsRouter.setActiveIndex(index);
                }
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
                    label: 'Chats', icon: Icon(Icons.message)),
                BottomNavigationBarItem(
                    label: 'Profile', icon: Icon(Iconsax.profile_2user)),
              ],
            );
          },
        ),
      ),
    );
  }
}
