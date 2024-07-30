part of 'cart_bloc.dart';

abstract class CartEvent {}

class GetCartItemsCount extends CartEvent {}

class FetchCartProductsEvent extends CartEvent {}

class AddProductToCartEvent extends CartEvent {
  final ProductSummary product;

  AddProductToCartEvent(this.product);
}

class DeleteProductFromCartEvent extends CartEvent {
  final ProductSummary product;

  DeleteProductFromCartEvent(this.product);
}

class FetchProductCartCount extends CartEvent {
  final ProductSummary product;

  FetchProductCartCount(this.product);
}

class IncrementProductQuantityEvent extends CartEvent {
  final ProductSummary product;
  IncrementProductQuantityEvent(this.product);
}

class DecrementProductQuantityEvent extends CartEvent {
  final ProductSummary product;

  DecrementProductQuantityEvent(this.product);
}

class CheckoutCartItems extends CartEvent {}
