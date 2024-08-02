import 'package:dartz/dartz.dart';
import 'package:eb_demo_app/src/features/shop/data/data_source/local/shop_database_service.dart';
import 'package:eb_demo_app/src/features/shop/data/model/product.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/utils/error/failure/failure.dart';

abstract class CartRepository {
  Future<void> addProductToCart({required ProductSummary product});
  Future<void> removeProductFromCart({required ProductSummary product});
  Future<Either<Failure, List<ProductSummary>>> getAllProductCarts();
  Future<int> getCartProductQuantityCount({required ProductSummary product});
  Future<int> getCartItemsCount();
  Future<void> checkoutCartItems();
  Future<bool> isProductInCart({required String productID});
}

@LazySingleton(as: CartRepository)
class CartRepositoryImpl implements CartRepository {
  final ShopDatabaseService _localStorageService;

  CartRepositoryImpl(this._localStorageService);
  @override
  Future<void> addProductToCart({required ProductSummary product}) async {
    try {
      await _localStorageService.addProductToCart(product: product);
    } catch (e) {
      print('error: ${e.toString()}');
      throw Exception(const LocalStorageFailure('Error to save item to cart'));
    }
  }

  @override
  Future<Either<Failure, List<ProductSummary>>> getAllProductCarts() async {
    try {
      final cartProducts = await _localStorageService.getAllProducts();
      return right(cartProducts);
    } catch (e) {
      return left(const LocalStorageFailure('Storage access error'));
    }
  }

  @override
  Future<void> removeProductFromCart({required ProductSummary product}) async {
    try {
      await _localStorageService.removeProductFromCart(product: product);
    } catch (e) {
      throw Exception(
          const LocalStorageFailure('Error to delete item from cart'));
    }
  }

  @override
  Future<int> getCartProductQuantityCount(
      {required ProductSummary product}) async {
    return await _localStorageService.getCartProductQuantityCount(product);
  }

  @override
  Future<int> getCartItemsCount() async {
    return await _localStorageService.getCartItemsCount();
  }

  @override
  Future<void> checkoutCartItems() async {
    await _localStorageService.clearCart();
  }

  @override
  Future<bool> isProductInCart({required String productID}) async {
    return await _localStorageService.isProductInCart(productID: productID);
  }
}
