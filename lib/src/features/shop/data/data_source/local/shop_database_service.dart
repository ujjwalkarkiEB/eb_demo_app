import 'package:eb_demo_app/core/utils/constants/strings.dart';
import 'package:eb_demo_app/core/utils/local_storage/database_helper.dart';
import 'package:injectable/injectable.dart';

import '../../model/product.dart';

abstract class ShopDatabaseService {
  Future<void> addProduct({required ProductSummary product});
  Future<void> removeProduct({required ProductSummary product});
  Future<List<ProductSummary>> getAllProducts();
  Future<int> getCartProductQuantityCount(ProductSummary product);
  Future<int> getCartItemsCount();
  Future<void> clearCart();
  Future<bool> isProductInCart({required String productID});
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
        // Save after incrementing
        existingProduct.save();
      } else {
        product.quantity = 1;
        box.add(product);
        // Save when adding new product
        product.save();
      }
    } catch (e) {
      throw Exception('Local storage error: ${e.toString()}');
    }
  }

  @override
  Future<void> removeProduct({required ProductSummary product}) async {
    try {
      final box = _databaseHelper.cartBox;
      final existingProduct = box.values.cast<ProductSummary?>().firstWhere(
            (p) => p?.id == product.id,
            orElse: () => null,
          );

      if (existingProduct != null) {
        if (existingProduct.quantity > 1) {
          existingProduct.decrementQuantity();
          existingProduct.save(); // Save after decrementing
        } else {
          box.delete(
              existingProduct.key); // Remove the product if quantity is 1
        }
      }
    } catch (e) {
      throw Exception('Local storage error: ${e.toString()}');
    }
  }

  @override
  Future<List<ProductSummary>> getAllProducts() async {
    try {
      final box = _databaseHelper.cartBox;
      return box.values.toList();
    } catch (e) {
      throw Exception('Local storage access error: ${e.toString()}');
    }
  }

  @override
  Future<int> getCartProductQuantityCount(ProductSummary product) async {
    try {
      final box = _databaseHelper.cartBox;
      final existingProduct = box.values.cast<ProductSummary?>().firstWhere(
            (p) => p?.id == product.id,
            orElse: () => null,
          );

      if (existingProduct != null) {
        return existingProduct.quantity;
      } else {
        return 0;
      }
    } catch (e) {
      return 0;
    }
  }

  @override
  Future<int> getCartItemsCount() async {
    final box = _databaseHelper.cartBox;
    return box.values.toList().length;
  }

  @override
  Future<void> clearCart() async {
    final box = _databaseHelper.cartBox;
    await box.clear();
  }

  @override
  Future<bool> isProductInCart({required String productID}) async {
    try {
      final box = _databaseHelper.cartBox;
      final existingProduct = box.values.cast<ProductSummary?>().firstWhere(
            (p) => p?.id == productID,
            orElse: () => null,
          );
      return existingProduct != null;
    } catch (e) {
      throw Exception('Local storage access error: ${e.toString()}');
    }
  }
}
