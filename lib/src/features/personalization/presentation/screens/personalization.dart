import 'package:auto_route/auto_route.dart';
import 'package:eb_demo_app/core/config/injection/injection.dart';
import 'package:eb_demo_app/core/config/route/app_route.dart';
import 'package:flutter/cupertino.dart';

@RoutePage()
class PersonalizationScreen extends StatelessWidget {
  const PersonalizationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print(
        ' 123 :  ${getIt<AppRouter>().root.innerRouterOf<TabsRouter>(MainNavRoute.name)?.activeIndex}');
    return const AutoRouter();
  }
}
