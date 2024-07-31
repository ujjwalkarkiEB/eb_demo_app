part of 'cart_bloc.dart';

sealed class CartState {}

final class CartInitial extends CartState {}

final class CartItemsCount extends CartState {
  final int count;

  CartItemsCount({required this.count});
}

final class CartProductAdded extends CartState {
  final String productTitle;

  CartProductAdded({required this.productTitle});
}

final class CartProductAddFailed extends CartState {
  final String msg;

  CartProductAddFailed({required this.msg});
}

final class CartProductRemoved extends CartState {}

final class CartFetchError extends CartState {}

final class CartActionError extends CartState {
  final String errorMsg;

  CartActionError(this.errorMsg);
}

final class CartActionSuccess extends CartState {
  final String successMsg;

  CartActionSuccess({required this.successMsg});
}

final class CartFetchSuccess extends CartState {
  final List<ProductSummary> cartProducts;

  CartFetchSuccess(this.cartProducts);
}

final class CheckoutSucess extends CartState {}

final class CheckoutError extends CartState {}

class ProductCartCount extends CartState {
  final int count;
  final String productId;

  ProductCartCount({required this.count, required this.productId});
}

class CheckoutPrice extends CartState {
  final double price;

  CheckoutPrice({required this.price});
}
