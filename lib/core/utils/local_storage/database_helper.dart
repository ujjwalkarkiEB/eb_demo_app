import 'dart:io';

import 'package:eb_demo_app/core/utils/constants/strings.dart';
import 'package:eb_demo_app/src/features/shop/data/model/product.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

@lazySingleton
class DatabaseHelper {
  Future<void> initializeLocalDatabase() async {
    final Directory databaseDir = await getApplicationDocumentsDirectory();
    Hive.init(databaseDir.path);
    Hive.registerAdapter(ProductSummaryAdapter());
    Hive.openBox<String>(authBoxName);
    await Hive.openLazyBox<ProductSummary>(cartBoxName);
    Hive.openBox<String>(settingsBoxName);
  }

  Box<String> get authBox => Hive.box(authBoxName);
  Box<ProductSummary> get cartBox => Hive.box(cartBoxName);
  Box<String> get settingsBox => Hive.box(settingsBoxName);
}
