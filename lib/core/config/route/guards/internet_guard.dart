import 'package:auto_route/auto_route.dart';
import 'package:eb_demo_app/core/config/injection/injection.dart';
import 'package:eb_demo_app/core/config/route/app_route.dart';
import 'package:eb_demo_app/core/utils/helpers/internet_connection_helpers.dart';

class InternetGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final internetHelpers = getIt<InternetConnectionHelpers>();

    internetHelpers.hasInternet().then((isConnected) {
      if (isConnected) {
        resolver.next();
      } else {
        router.push(const NoInternetRoute());
      }
    });
  }
}
