part of 'myproducts_bloc.dart';

sealed class MyproductsState {}

final class MyProductsInitial extends MyproductsState {}

final class FetchingMyProducts extends MyproductsState {}

final class FetchedMyProducts extends MyproductsState {
  final List<ProductSummary> products;

  FetchedMyProducts({required this.products});
}

final class FailedFetchMyProducts extends MyproductsState {}

final class DeletedProduct extends MyproductsState {}

final class DeletedProductFailed extends MyproductsState {}

final class DeletingProduct extends MyproductsState {}
