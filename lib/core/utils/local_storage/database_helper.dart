import 'dart:io';

import 'package:eb_demo_app/core/utils/constants/strings.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

@lazySingleton
class DatabaseHelper {
  Future<void> initializeLocalDatabase() async {
    final Directory databaseDir = await getApplicationDocumentsDirectory();
    Hive.init(databaseDir.path);
    await Hive.openBox<String>(authBoxName);
    await Hive.openBox<String>(cacheBoxName);
  }

  Box<String> get authBox => Hive.box(authBoxName);
  Box<String> get cacheBox => Hive.box(cacheBoxName);
}
