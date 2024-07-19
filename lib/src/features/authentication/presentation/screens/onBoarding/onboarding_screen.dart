import 'package:auto_route/auto_route.dart';
import 'package:eb_demo_app/core/config/route/app_route.dart';
import 'package:eb_demo_app/core/utils/constants/images.dart';
import 'package:flutter/material.dart';

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
  int _index = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
        length: screens.length, vsync: this, initialIndex: _index);
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  void _nextPage() {
    if (_index < screens.length - 1) {
      _index++;
      tabController.animateTo(_index);
    } else {
      context.router
          .pushAndPopUntil(const SigninRoute(), predicate: (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 240, 247, 229),
            Color.fromARGB(255, 77, 195, 138),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
                top: 60,
                right: 20,
                child: TextButton(
                    onPressed: () {
                      context.router.pushAndPopUntil(const SigninRoute(),
                          predicate: (route) => false);
                    },
                    child: const Text('Skip'))),
            TabBarView(
              controller: tabController,
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
            )
          ],
        ),
      ),
      floatingActionButton: ButtonBar(
        children: [
          FloatingActionButton(
            backgroundColor: Colors.amberAccent,
            shape: const CircleBorder(),
            onPressed: _nextPage,
            child: const Icon(
              Icons.arrow_right_sharp,
              color: Colors.white,
              size: 50,
            ),
          )
        ],
      ),
    );
  }
}
