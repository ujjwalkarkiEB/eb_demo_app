import 'package:eb_demo_app/core/config/injection/injection.dart';
import 'package:eb_demo_app/core/utils/local_storage/database_helper.dart';
import 'package:eb_demo_app/core/utils/notification/notification_service.dart';
import 'package:eb_demo_app/src/app.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // register dependenciies to getit
  configureDependencies();
  // initialize notificationservice
  await getIt<NotificationService>().initNotification();

  final databaseHelper = getIt<DatabaseHelper>();
  // initialize local database
  await databaseHelper.initializeLocalDatabase();
  runApp(const MyApp());
}
