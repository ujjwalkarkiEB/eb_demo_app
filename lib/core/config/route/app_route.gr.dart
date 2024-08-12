// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_route.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    CartRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CartScreen(),
      );
    },
    ChatNavigatioRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ChatNavigatioScreen(),
      );
    },
    EmailVerificationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const EmailVerificationScreen(),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ForgotPasswordScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    MainNavRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainNavScreen(),
      );
    },
    MyProductsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MyProductsScreen(),
      );
    },
    OnboardingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OnboardingScreen(),
      );
    },
    OtpRoute.name: (routeData) {
      final args = routeData.argsAs<OtpRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: OtpScreen(
          key: args.key,
          userID: args.userID,
          isRedirectedFromLogin: args.isRedirectedFromLogin,
        ),
      );
    },
    PersonalizationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PersonalizationScreen(),
      );
    },
    PrivateChatRoomRoute.name: (routeData) {
      final args = routeData.argsAs<PrivateChatRoomRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PrivateChatRoomScreen(
          key: args.key,
          reciverID: args.reciverID,
        ),
      );
    },
    ProductCreateRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProductCreateScreen(),
      );
    },
    ProductDetailRoute.name: (routeData) {
      final args = routeData.argsAs<ProductDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ProductDetailScreen(
          key: args.key,
          productID: args.productID,
        ),
      );
    },
    ProductReviewRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProductReviewScreen(),
      );
    },
    ProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfileScreen(),
      );
    },
    ResetPasswordRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ResetPasswordScreen(),
      );
    },
    SettingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingScreen(),
      );
    },
    SigninRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SigninScreen(),
      );
    },
    SignupRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignupScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashScreen(),
      );
    },
    StoreRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const StoreScreen(),
      );
    },
    UserChatsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UserChatsScreen(),
      );
    },
  };
}

/// generated route for
/// [CartScreen]
class CartRoute extends PageRouteInfo<void> {
  const CartRoute({List<PageRouteInfo>? children})
      : super(
          CartRoute.name,
          initialChildren: children,
        );

  static const String name = 'CartRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ChatNavigatioScreen]
class ChatNavigatioRoute extends PageRouteInfo<void> {
  const ChatNavigatioRoute({List<PageRouteInfo>? children})
      : super(
          ChatNavigatioRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChatNavigatioRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EmailVerificationScreen]
class EmailVerificationRoute extends PageRouteInfo<void> {
  const EmailVerificationRoute({List<PageRouteInfo>? children})
      : super(
          EmailVerificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'EmailVerificationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ForgotPasswordScreen]
class ForgotPasswordRoute extends PageRouteInfo<void> {
  const ForgotPasswordRoute({List<PageRouteInfo>? children})
      : super(
          ForgotPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MainNavScreen]
class MainNavRoute extends PageRouteInfo<void> {
  const MainNavRoute({List<PageRouteInfo>? children})
      : super(
          MainNavRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainNavRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MyProductsScreen]
class MyProductsRoute extends PageRouteInfo<void> {
  const MyProductsRoute({List<PageRouteInfo>? children})
      : super(
          MyProductsRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyProductsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OnboardingScreen]
class OnboardingRoute extends PageRouteInfo<void> {
  const OnboardingRoute({List<PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OtpScreen]
class OtpRoute extends PageRouteInfo<OtpRouteArgs> {
  OtpRoute({
    Key? key,
    required String userID,
    bool isRedirectedFromLogin = false,
    List<PageRouteInfo>? children,
  }) : super(
          OtpRoute.name,
          args: OtpRouteArgs(
            key: key,
            userID: userID,
            isRedirectedFromLogin: isRedirectedFromLogin,
          ),
          initialChildren: children,
        );

  static const String name = 'OtpRoute';

  static const PageInfo<OtpRouteArgs> page = PageInfo<OtpRouteArgs>(name);
}

class OtpRouteArgs {
  const OtpRouteArgs({
    this.key,
    required this.userID,
    this.isRedirectedFromLogin = false,
  });

  final Key? key;

  final String userID;

  final bool isRedirectedFromLogin;

  @override
  String toString() {
    return 'OtpRouteArgs{key: $key, userID: $userID, isRedirectedFromLogin: $isRedirectedFromLogin}';
  }
}

/// generated route for
/// [PersonalizationScreen]
class PersonalizationRoute extends PageRouteInfo<void> {
  const PersonalizationRoute({List<PageRouteInfo>? children})
      : super(
          PersonalizationRoute.name,
          initialChildren: children,
        );

  static const String name = 'PersonalizationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PrivateChatRoomScreen]
class PrivateChatRoomRoute extends PageRouteInfo<PrivateChatRoomRouteArgs> {
  PrivateChatRoomRoute({
    Key? key,
    required String reciverID,
    List<PageRouteInfo>? children,
  }) : super(
          PrivateChatRoomRoute.name,
          args: PrivateChatRoomRouteArgs(
            key: key,
            reciverID: reciverID,
          ),
          initialChildren: children,
        );

  static const String name = 'PrivateChatRoomRoute';

  static const PageInfo<PrivateChatRoomRouteArgs> page =
      PageInfo<PrivateChatRoomRouteArgs>(name);
}

class PrivateChatRoomRouteArgs {
  const PrivateChatRoomRouteArgs({
    this.key,
    required this.reciverID,
  });

  final Key? key;

  final String reciverID;

  @override
  String toString() {
    return 'PrivateChatRoomRouteArgs{key: $key, reciverID: $reciverID}';
  }
}

/// generated route for
/// [ProductCreateScreen]
class ProductCreateRoute extends PageRouteInfo<void> {
  const ProductCreateRoute({List<PageRouteInfo>? children})
      : super(
          ProductCreateRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProductCreateRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProductDetailScreen]
class ProductDetailRoute extends PageRouteInfo<ProductDetailRouteArgs> {
  ProductDetailRoute({
    Key? key,
    required String productID,
    List<PageRouteInfo>? children,
  }) : super(
          ProductDetailRoute.name,
          args: ProductDetailRouteArgs(
            key: key,
            productID: productID,
          ),
          initialChildren: children,
        );

  static const String name = 'ProductDetailRoute';

  static const PageInfo<ProductDetailRouteArgs> page =
      PageInfo<ProductDetailRouteArgs>(name);
}

class ProductDetailRouteArgs {
  const ProductDetailRouteArgs({
    this.key,
    required this.productID,
  });

  final Key? key;

  final String productID;

  @override
  String toString() {
    return 'ProductDetailRouteArgs{key: $key, productID: $productID}';
  }
}

/// generated route for
/// [ProductReviewScreen]
class ProductReviewRoute extends PageRouteInfo<void> {
  const ProductReviewRoute({List<PageRouteInfo>? children})
      : super(
          ProductReviewRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProductReviewRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfileScreen]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ResetPasswordScreen]
class ResetPasswordRoute extends PageRouteInfo<void> {
  const ResetPasswordRoute({List<PageRouteInfo>? children})
      : super(
          ResetPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ResetPasswordRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingScreen]
class SettingRoute extends PageRouteInfo<void> {
  const SettingRoute({List<PageRouteInfo>? children})
      : super(
          SettingRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SigninScreen]
class SigninRoute extends PageRouteInfo<void> {
  const SigninRoute({List<PageRouteInfo>? children})
      : super(
          SigninRoute.name,
          initialChildren: children,
        );

  static const String name = 'SigninRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SignupScreen]
class SignupRoute extends PageRouteInfo<void> {
  const SignupRoute({List<PageRouteInfo>? children})
      : super(
          SignupRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignupRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [StoreScreen]
class StoreRoute extends PageRouteInfo<void> {
  const StoreRoute({List<PageRouteInfo>? children})
      : super(
          StoreRoute.name,
          initialChildren: children,
        );

  static const String name = 'StoreRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UserChatsScreen]
class UserChatsRoute extends PageRouteInfo<void> {
  const UserChatsRoute({List<PageRouteInfo>? children})
      : super(
          UserChatsRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserChatsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
