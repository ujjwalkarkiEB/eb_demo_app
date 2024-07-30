import 'package:bloc/bloc.dart';
import 'package:eb_demo_app/src/features/shop/data/repository/cart_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../data/model/product.dart';

part 'cart_event.dart';
part 'cart_state.dart';

@injectable
class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepository _cartRepository;
  CartBloc(this._cartRepository) : super(CartInitial()) {
    on<FetchCartProductsEvent>(_onFetchEvent);
    on<GetCartItemsCount>(_onGetCartItemsCount);
    on<AddProductToCartEvent>(_onAddToCartEvent);
    on<DeleteProductFromCartEvent>(_onRemoveProduct);
    on<FetchProductCartCount>(_onCartCountFetchEvent);
    on<IncrementProductQuantityEvent>(_onIncrementQuantityEvent);
    on<DecrementProductQuantityEvent>(_onDecrementQuantityEvent);
    on<CheckoutCartItems>(_onCheckout);
  }

  double checkoutPrice = 0;

  void _onFetchEvent(
      FetchCartProductsEvent event, Emitter<CartState> emit) async {
    final result = await _cartRepository.getAllProductCarts();
    result.fold(
      (l) => emit(CartFetchError()),
      (r) {
        checkoutPrice =
            r.fold(0, (sum, item) => sum + (item.price * item.quantity));
        emit(CartFetchSuccess(r));
      },
    );
  }

  void _onAddToCartEvent(
      AddProductToCartEvent event, Emitter<CartState> emit) async {
    try {
      await _cartRepository.addProductToCart(product: event.product);

      emit(CartActionSuccess(successMsg: 'Product is added successfully!'));
    } catch (e) {
      emit(CartActionError('Failed to add product!'));
    }
  }

  void _onRemoveProduct(
      DeleteProductFromCartEvent event, Emitter<CartState> emit) async {
    try {
      await _cartRepository.removeProductFromCart(product: event.product);

      emit(CartActionSuccess(successMsg: 'Products is removed successfully!'));
    } catch (e) {
      emit(CartActionError('Failed to remove product!'));
    }
  }

  void _onCartCountFetchEvent(
      FetchProductCartCount event, Emitter<CartState> emit) async {
    final count = await _cartRepository.getCartProductQuantityCount(
        product: event.product);
    emit(ProductCartCount(count: count, productId: event.product.id));
  }

  void _onIncrementQuantityEvent(
      IncrementProductQuantityEvent event, Emitter<CartState> emit) async {
    event.product.incrementQuantity();
    print('inc: ${event.product.quantity}');

    checkoutPrice += event.product.price * event.product.quantity;
    print('inc checkoutprice: $checkoutPrice');

    emit(ProductCartCount(
      count: event.product.quantity,
      productId: event.product.id,
    ));
    emit(CheckoutPrice(price: checkoutPrice));
  }

  void _onDecrementQuantityEvent(
      DecrementProductQuantityEvent event, Emitter<CartState> emit) async {
    event.product.decrementQuantity();
    print('dec: ${event.product.quantity}');
    if (event.product.quantity > 1) {
      checkoutPrice -= event.product.price * event.product.quantity;
      print('dec checkoutprice: $checkoutPrice');
    }

    emit(ProductCartCount(
      count: event.product.quantity,
      productId: event.product.id,
    ));
    emit(CheckoutPrice(price: checkoutPrice));
  }

  void _onGetCartItemsCount(
      GetCartItemsCount event, Emitter<CartState> emit) async {
    final count = await _cartRepository.getCartItemsCount();
    emit(CartItemsCount(count: count));
  }

  void _onCheckout(CheckoutCartItems event, Emitter<CartState> emit) async {
    try {
      await _cartRepository.checkoutCartItems();
      emit(CartActionSuccess(successMsg: 'You orders are placed!'));
    } catch (e) {
      emit(CartActionError('Failed to place orders'));
    }
  }

  @override
  void onTransition(Transition<CartEvent, CartState> transition) {
    // TODO: implement
    super.onTransition(transition);
    print(transition);
  }
}
