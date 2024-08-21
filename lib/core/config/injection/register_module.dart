// injection.dart
import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';

import '../route/app_route.dart';

@module
abstract class RegisterModule {
  @singleton
  AppRouter get appRouter => AppRouter();
}
