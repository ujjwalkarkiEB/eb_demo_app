part of 'store_bloc.dart';

sealed class StoreState {}

final class StoreInitial extends StoreState {}

final class CategoryProductsFetched extends StoreState {
  final List<ProductSummary> categpryProducts;

  CategoryProductsFetched(this.categpryProducts);
}

final class CategoryProductsFetchError extends StoreState {}

final class CategoryProductsLoading extends StoreState {}

final class FilteredProductsFetched extends StoreState {
  final List<ProductSummary> filteredProducts;

  FilteredProductsFetched({required this.filteredProducts});
}

final class FetchedLoadMoreProducts extends StoreState {
  final List<ProductSummary> loadedProducts;

  FetchedLoadMoreProducts({required this.loadedProducts});
}

// states for creating products
final class ProductInputFieldError extends StoreState {
  final String field;
  final String msg;

  ProductInputFieldError({required this.field, required this.msg});
}

final class ProductCreateSuccessful extends StoreState {}

final class ProductCreateError extends StoreState {}

final class ProductCreateLoading extends StoreState {}
