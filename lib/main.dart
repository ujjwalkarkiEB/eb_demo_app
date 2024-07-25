import 'package:eb_demo_app/core/config/injection/injection.dart';
import 'package:eb_demo_app/core/utils/local_storage/database_helper.dart';
import 'package:eb_demo_app/src/app.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper().initializeLocalDatabase();
  configureDependencies();
  runApp(const MyApp());
}
