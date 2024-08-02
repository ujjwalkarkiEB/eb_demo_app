part of 'store_bloc.dart';

sealed class StoreEvent {}

final class FetchCategoryProducts extends StoreEvent {
  final double categoryID;

  FetchCategoryProducts({required this.categoryID});
}

final class ApplyPriceFilterEvent extends StoreEvent {
  final double categoryId;
  final double maxPrice;
  final double minPrice;

  ApplyPriceFilterEvent(
      {required this.categoryId,
      required this.maxPrice,
      required this.minPrice});
}

final class LoadMoreEvent extends StoreEvent {
  final double categoryID;

  LoadMoreEvent({required this.categoryID});
}

final class CreateProductEvent extends StoreEvent {
  final String title;
  final String description;
  final double price;

  CreateProductEvent(
      {required this.title, required this.description, required this.price});
}
