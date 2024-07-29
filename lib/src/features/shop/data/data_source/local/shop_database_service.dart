import 'package:eb_demo_app/core/utils/constants/strings.dart';
import 'package:eb_demo_app/core/utils/local_storage/database_helper.dart';
import 'package:injectable/injectable.dart';

import '../../model/product.dart';

abstract class ShopDatabaseService {
  Future<void> addProduct({required ProductSummary product});
  Future<void> removeProduct({required ProductSummary product});
  Future<List<ProductSummary>> getAllProducts();
}

@LazySingleton(as: ShopDatabaseService)
class ShopDatabaseServiceImpl extends ShopDatabaseService {
  final DatabaseHelper _databaseHelper;

  ShopDatabaseServiceImpl(this._databaseHelper);
  @override
  Future<void> addProduct({required ProductSummary product}) async {
    try {
      final box = _databaseHelper.cartBox;
      final existingProduct = box.values.cast<ProductSummary?>().firstWhere(
            (p) => p?.id == product.id,
            orElse: () => null,
          );

      if (existingProduct?.id != null) {
        existingProduct!.incrementQuantity();
      } else {
        product.quantity = 1;
        box.add(product);
      }

      product.save();
    } catch (e) {
      throw Exception('Local storage error: ${e.toString()}');
    }
  }

  @override
  Future<void> removeProduct({required ProductSummary product}) async {
    try {
      product.delete();
    } catch (e) {
      throw Exception('Local storage  error: ${e.toString()}');
    }
  }

  @override
  Future<List<ProductSummary>> getAllProducts() async {
    try {
      final box = _databaseHelper.cartBox;
      return box.values.toList();
    } catch (e) {
      throw Exception('Local storage  access error: ${e.toString()}');
    }
  }
}
