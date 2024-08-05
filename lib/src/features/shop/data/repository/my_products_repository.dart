import 'package:dartz/dartz.dart';
import 'package:eb_demo_app/core/utils/error/failure/failure.dart';
import 'package:eb_demo_app/src/features/shop/data/data_source/local/shop_database_service.dart';
import 'package:eb_demo_app/src/features/shop/data/data_source/remote/shop_remote_source.dart';
import 'package:eb_demo_app/src/features/shop/data/model/product.dart';
import 'package:injectable/injectable.dart';

abstract class MyProductsRepository {
  Future<Either<Failure, List<ProductSummary>>> fetchMyProducts();
  Future<Either<Failure, String>> deleteMyProduct(
      {required ProductSummary product});
  Future<Either<Failure, String>> storeMyProduct(String title, double price,
      String description, double categoryId, List<String> images);
}

@LazySingleton(as: MyProductsRepository)
class MyProductsRepositoryImpl extends MyProductsRepository {
  final ShopDatabaseService _databaseService;
  final ShopRemoteSource _remoteSource;

  MyProductsRepositoryImpl(this._databaseService, this._remoteSource);
  @override
  Future<Either<Failure, String>> deleteMyProduct(
      {required ProductSummary product}) async {
    try {
      await _databaseService.deleteMyProduct(product: product);
      return right('Product is deleted successfully!');
    } catch (e) {
      return left(const UnknownFailure('Failed to delete the product!'));
    }
  }

  @override
  Future<Either<Failure, List<ProductSummary>>> fetchMyProducts() async {
    try {
      final products = await _databaseService.fetchMyProducts();
      return right(products);
    } catch (e) {
      return left(const UnknownFailure('Unable to fetch the products!'));
    }
  }

  @override
  Future<Either<Failure, String>> storeMyProduct(String title, double price,
      String description, double categoryId, List<String> images) async {
    try {
      final createdProduct = await _remoteSource.createProduct(
          title, price, description, categoryId, images);
      await _databaseService.storeMyProduct(product: createdProduct);

      return right('Product is created successfully!');
    } catch (e) {
      return left(const UnknownFailure('Failed to delete the product!'));
    }
  }
}
