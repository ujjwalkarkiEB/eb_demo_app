part of 'store_bloc.dart';

sealed class StoreEvent {}

final class FetchCategoryProducts extends StoreEvent {
  FetchCategoryProducts();
}

final class ApplyPriceFilterEvent extends StoreEvent {
  final double maxPrice;
  final double minPrice;

  ApplyPriceFilterEvent({required this.maxPrice, required this.minPrice});
}

final class LoadMoreEvent extends StoreEvent {
  LoadMoreEvent();
}

final class CreateProductEvent extends StoreEvent {
  final String title;
  final String description;
  final double price;

  CreateProductEvent(
      {required this.title, required this.description, required this.price});
}
