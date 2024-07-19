import 'package:auto_route/auto_route.dart';
import 'package:eb_demo_app/src/features/authentication/presentation/screens/otp/otp_screen.dart';

import '../../../src/features/authentication/presentation/screens/onBoarding/onboarding_screen.dart';
import '../../../src/features/authentication/presentation/screens/signin/signin_screen.dart';
import '../../../src/features/authentication/presentation/screens/signup/signup_screen.dart';

part 'app_route.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(initial: true, page: OnboardingRoute.page),
        AutoRoute(page: SigninRoute.page),
        AutoRoute(page: SignupRoute.page),
        AutoRoute(page: OtpRoute.page),
      ];
}
