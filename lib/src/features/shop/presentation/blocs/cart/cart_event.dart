part of 'cart_bloc.dart';

sealed class CartEvent {}

final class FetchCartProductsEvent extends CartEvent {}

final class DeleteProductFromCartEvent extends CartEvent {
  final ProductSummary product;

  DeleteProductFromCartEvent(this.product);
}

final class AddProductToCartEvent extends CartEvent {
  final ProductSummary product;

  AddProductToCartEvent(this.product);
}
