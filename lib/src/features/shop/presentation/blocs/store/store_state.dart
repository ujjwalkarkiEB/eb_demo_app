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
