import 'package:dartz/dartz.dart';
import 'package:eb_demo_app/core/utils/error/exception/api_exception.dart';
import 'package:eb_demo_app/core/utils/error/failure/failure.dart';
import 'package:eb_demo_app/src/features/shop/data/data_source/remote/shop_remote_source.dart';
import 'package:eb_demo_app/src/features/shop/data/model/category.dart';
import 'package:eb_demo_app/src/features/shop/data/model/product.dart';
import 'package:injectable/injectable.dart';

abstract class ShopRepository {
  Future<Either<Failure, List<ProductSummary>>> getTrendingProducts();
  Future<Either<Failure, List<CategorySummary>>> getCategories();

  Future<Either<Failure, List<ProductSummary>>> searchProductsByTitle(
      {required String query, required int offset, required int limit});
}

@LazySingleton(as: ShopRepository)
class ShopRepositoryImpl implements ShopRepository {
  final ShopRemoteSource _shopRemoteSource;

  ShopRepositoryImpl(this._shopRemoteSource);
  @override
  Future<Either<Failure, List<ProductSummary>>> getTrendingProducts() async {
    try {
      final result = await _shopRemoteSource.getTrendingProducts();
      return right(result);
    } on ApiException {
      return left(const ServerFailure('Server Error'));
    } catch (e) {
      return left(const UnknownFailure('Something went wrong!'));
    }
  }

  @override
  Future<Either<Failure, List<ProductSummary>>> searchProductsByTitle(
      {required String query, required int offset, required int limit}) async {
    try {
      final result = await _shopRemoteSource.searchProductsByTitle(
        query,
        limit,
        offset,
      );
      return right(result);
    } on ApiException {
      return left(const ServerFailure('Server Error'));
    } catch (e) {
      return left(const UnknownFailure('Something went wrong!'));
    }
  }

  @override
  Future<Either<Failure, List<CategorySummary>>> getCategories() async {
    try {
      final result = await _shopRemoteSource.getAllCategories();
      print('categories result: $result');

      return right(result.sublist(0, 5));
    } on ApiException catch (e) {
      print('All categories fetch error: ${e.toString()}');
      return left(const ServerFailure('Server Error'));
    } catch (e) {
      print('unkown categories fetch error: ${e.toString()}');

      return left(const UnknownFailure('Something went wrong!'));
    }
  }
}
