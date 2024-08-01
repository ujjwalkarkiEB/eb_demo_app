import 'package:auto_route/auto_route.dart';
import 'package:eb_demo_app/src/features/authentication/presentation/screens/otp/otp_screen.dart';
import 'package:flutter/material.dart';
import '../../../navigation.dart';
import '../../../src/features/authentication/presentation/screens/onBoarding/onboarding_screen.dart';
import '../../../src/features/authentication/presentation/screens/password_config/email_verification/email_verification.dart';
import '../../../src/features/authentication/presentation/screens/password_config/forgot_psw/forgot_psw.dart';
import '../../../src/features/authentication/presentation/screens/password_config/reset_password/rest_password.dart';
import '../../../src/features/authentication/presentation/screens/signin/signin_screen.dart';
import '../../../src/features/authentication/presentation/screens/signup/signup_screen.dart';

import '../../../src/features/personalization/data/model/profile.dart';
import '../../../src/features/personalization/presentation/screens/personalization.dart';
import '../../../src/features/personalization/presentation/screens/profile/profile.dart';
import '../../../src/features/personalization/presentation/screens/settings/settings.dart';
import '../../../src/features/shop/presentation/screens/cart/cart.dart';
import '../../../src/features/shop/presentation/screens/home/home.dart';
import '../../../src/features/shop/presentation/screens/product_detail/product_detail.dart';
import '../../../src/features/shop/presentation/screens/product_review/product_review.dart';
import '../../../src/features/shop/presentation/screens/store/store.dart';
import '../../../src/features/shop/presentation/screens/wishlist/wishlist.dart';
import '../../../src/splash_screen.dart';

part 'app_route.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        // AutoRoute(initial: true, page: SplashRoute.page),

        AutoRoute(page: OnboardingRoute.page),
        // AutoRoute(initial: true, page: SigninRoute.page),
        AutoRoute(page: EmailVerificationRoute.page),
        AutoRoute(page: ForgotPasswordRoute.page),
        AutoRoute(page: ResetPasswordRoute.page),
        AutoRoute(page: SignupRoute.page),
        AutoRoute(page: OtpRoute.page),

        // navigation bar routes configuration
        AutoRoute(
          initial: true,
          page: MainNavRoute.page,
          children: [
            AutoRoute(page: HomeRoute.page),

            AutoRoute(page: StoreRoute.page),
            AutoRoute(page: WishlistRoute.page),
            AutoRoute(
                initial: true,
                page: PersonalizationRoute.page,
                maintainState: false,
                children: [
                  AutoRoute(initial: true, page: SettingRoute.page),
                  AutoRoute(page: ProfileRoute.page),
                ]),

            //  global route for homenav
          ],
        ),
        AutoRoute(page: ProductDetailRoute.page),
        AutoRoute(page: ProductReviewRoute.page),
        AutoRoute(page: CartRoute.page),
      ];
}
