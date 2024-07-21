import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/config/route/app_route.dart';
import '../../../../../../core/utils/constants/images.dart';
import '../../blocs/onbaording_bloc/onboarding_bloc.dart';
import 'widget/onboard_sub_screen.dart';

const List<Widget> screens = [
  OnboardingScreenWidget(
    title: 'Time To be Social',
    subTitle: 'Discover new connections and expand your network.',
    image: AppImages.onBoardingImg1,
  ),
  OnboardingScreenWidget(
    title: 'Stay Connected',
    subTitle: 'Keep in touch with friends and family anytime, anywhere.',
    image: AppImages.onBoardingImg2,
  ),
  OnboardingScreenWidget(
    title: 'Be Mobile',
    subTitle: 'Enjoy seamless access on the go with our mobile app.',
    image: AppImages.onBoardingImg3,
  ),
];

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: screens.length,
      vsync: this,
      initialIndex: 0,
    );
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  void _nextPage(BuildContext context) {
    context.read<OnboardingBloc>().add(OnboardingNextPageEvent());
  }

  void _skipOnboarding(BuildContext context) {
    context.read<OnboardingBloc>().add(SkipButtonEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OnboardingBloc(),
      child: BlocConsumer<OnboardingBloc, OnboardingState>(
          listener: (context, state) {
        if (state is OnboardingNextPage) {
          tabController.animateTo(
            state.nextPage,
          );
        }
        if (state is OnboardingCompleted) {
          context.router.pushAndPopUntil(const SigninRoute(),
              predicate: (route) => false);
        }
      }, builder: (context, state) {
        bool isLastPage = false;

        if (state is OnboardingNextPage) {
          isLastPage = state.nextPage == 2;
        }
        return Scaffold(
          body: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 240, 247, 229),
                  Color.fromARGB(255, 77, 195, 138),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                TabBarView(
                  controller: tabController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: screens,
                ),
                Positioned(
                  bottom: 40,
                  child: TabPageSelector(
                    controller: tabController,
                    color: Colors.white,
                    borderStyle: BorderStyle.none,
                    selectedColor: Colors.yellow,
                  ),
                ),
                Positioned(
                  top: 60,
                  right: 20,
                  child: Visibility(
                    visible: !isLastPage,
                    child: TextButton(
                      onPressed: () => _skipOnboarding(context),
                      child: const Text('Skip'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: ButtonBar(
            children: [
              FloatingActionButton(
                backgroundColor: Colors.amberAccent,
                shape: const CircleBorder(),
                onPressed: () => _nextPage(context),
                child: const Icon(
                  Icons.arrow_right_sharp,
                  color: Colors.white,
                  size: 50,
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
