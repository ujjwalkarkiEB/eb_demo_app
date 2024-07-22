import 'package:auto_route/auto_route.dart';
import 'package:eb_demo_app/src/features/authentication/presentation/screens/otp/otp_screen.dart';
import '../../../navigation.dart';
import '../../../src/features/authentication/presentation/screens/onBoarding/onboarding_screen.dart';
import '../../../src/features/authentication/presentation/screens/password_config/email_verification/email_verification.dart';
import '../../../src/features/authentication/presentation/screens/password_config/forgot_psw/forgot_psw.dart';
import '../../../src/features/authentication/presentation/screens/password_config/reset_password/rest_password.dart';
import '../../../src/features/authentication/presentation/screens/signin/signin_screen.dart';
import '../../../src/features/authentication/presentation/screens/signup/signup_screen.dart';
import '../../../src/features/event/presentation/screens/all_events/all_events.dart';
import '../../../src/features/event/presentation/screens/event_detail/event_detail.dart';
import '../../../src/features/event/presentation/screens/event_navigation.dart';
import '../../../src/features/event/presentation/screens/my_events/my_events.dart';
import '../../../src/features/personalization/presentation/screens/personalization.dart';
import '../../../src/features/personalization/presentation/screens/profile/profile.dart';
import '../../../src/features/personalization/presentation/screens/settings/settings.dart';

part 'app_route.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(initial: true, page: OnboardingRoute.page),
        AutoRoute(page: SigninRoute.page),
        AutoRoute(page: EmailVerificationRoute.page),
        AutoRoute(page: ForgotPasswordRoute.page),
        AutoRoute(page: ResetPasswordRoute.page),
        AutoRoute(page: SignupRoute.page),
        AutoRoute(page: OtpRoute.page),

        // navigation bar routes configuration
        AutoRoute(page: HomeNavRoute.page, children: [
          AutoRoute(page: EventNavigationRoute.page, children: [
            AutoRoute(initial: true, page: AllEventsRoute.page),
            AutoRoute(page: EventDetailRoute.page),
          ]),
          AutoRoute(page: MyEventsRoute.page),
          AutoRoute(
              initial: true,
              page: PersonalizationRoute.page,
              maintainState: false,
              children: [
                AutoRoute(initial: true, page: SettingRoute.page),
                AutoRoute(page: ProfileRoute.page),
              ]),
        ]),
      ];
}
