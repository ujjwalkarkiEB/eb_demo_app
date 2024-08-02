import 'package:dartz/dartz.dart';
import 'package:eb_demo_app/core/utils/error/failure/failure.dart';
import 'package:eb_demo_app/src/features/shop/data/data_source/local/shop_database_service.dart';
import 'package:eb_demo_app/src/features/shop/data/data_source/remote/shop_remote_source.dart';
import 'package:eb_demo_app/src/features/shop/data/model/product.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/utils/error/exception/api_exception.dart';

abstract class StoreRepository {
  Future<void> createdProduct(
      {required String title,
      required String description,
      required double price,
      required double categoryID,
      required List<String> images});
  Future<Either<Failure, List<ProductSummary>>> fetchCategoryProducts(
      {required double categoryID, required int offset});
  Future<Either<Failure, List<ProductSummary>>> applyPriceFilter(
      {required double categoryID,
      required int minPrice,
      required int maxPrice});
}

@LazySingleton(as: StoreRepository)
class StoreRepositoryImpl extends StoreRepository {
  final ShopRemoteSource _remoteSource;
  final ShopDatabaseService _databaseService;

  StoreRepositoryImpl(this._remoteSource, this._databaseService);
  @override
  Future<Either<Failure, List<ProductSummary>>> applyPriceFilter(
      {required double categoryID,
      required int minPrice,
      required int maxPrice}) async {
    try {
      final result = await _remoteSource.applyPriceFilter(
          categoryID: categoryID, maxPrice: maxPrice, minPrice: minPrice);
      return right(result);
    } on ApiException {
      return left(const ServerFailure('Server Error'));
    } catch (e) {
      return left(const UnknownFailure('Something went wrong!'));
    }
  }

  @override
  Future<Either<Failure, List<ProductSummary>>> fetchCategoryProducts(
      {required double categoryID, required int offset}) async {
    try {
      final result = await _remoteSource.fetchCategoryProducts(
          categoryID: categoryID, offset: offset);
      return right(result);
    } on ApiException {
      return left(const ServerFailure('Server Error'));
    } catch (e) {
      return left(const UnknownFailure('Something went wrong!'));
    }
  }

  @override
  Future<void> createdProduct(
      {required String title,
      required String description,
      required double price,
      required double categoryID,
      required List<String> images}) async {
    try {
      final product = await _remoteSource.createProduct(
          title, price, description, categoryID, images);

      print('product id: ${product.id}');
      await _databaseService.addCreatedProduct(product: product);
    } catch (e) {
      throw UnknownException('Failed to create product: ${e.toString()}');
    }
  }
}
