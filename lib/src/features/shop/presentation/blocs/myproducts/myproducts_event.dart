part of 'myproducts_bloc.dart';

sealed class MyproductsEvent {}

final class FetchMyProductsEvenet extends MyproductsEvent {}

final class ApplyCategoryFilterEvent extends MyproductsEvent {
  final ProductCategory category;

  ApplyCategoryFilterEvent({required this.category});
}

final class DeleteProductEvent extends MyproductsEvent {
  final ProductSummary product;

  DeleteProductEvent({required this.product});
}
