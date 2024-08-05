import 'package:dartz/dartz.dart';
import 'package:eb_demo_app/src/features/shop/data/data_source/remote/shop_remote_source.dart';
import 'package:eb_demo_app/src/features/shop/data/model/product.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/utils/error/exception/api_exception.dart';
import '../../../../../core/utils/error/failure/failure.dart';

abstract class ProductRepository {
  Future<Either<Failure, ProductDetail>> getProductDetail({required String id});
  Future<void> toggleProductLike({required String id});
}

@LazySingleton(as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository {
  final ShopRemoteSource _remoteSource;

  ProductRepositoryImpl(this._remoteSource);
  @override
  Future<Either<Failure, ProductDetail>> getProductDetail(
      {required String id}) async {
    try {
      final result = await _remoteSource.getProductDetails(id);
      return right(result);
    } on ApiException {
      return left(const ServerFailure('Server Error'));
    } catch (e) {
      return left(const UnknownFailure('Something went wrong!'));
    }
  }

  @override
  Future<void> toggleProductLike({required String id}) {
    // TODO: implement toggleProductLike
    throw UnimplementedError();
  }
}
