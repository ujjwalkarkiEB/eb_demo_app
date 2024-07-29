part of 'product_detail_bloc.dart';

sealed class ProductDetailEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

final class ProductDetailFetchEvent extends ProductDetailEvent {
  final String productID;

  ProductDetailFetchEvent(this.productID);
}

final class ToggleProductLikeEvent extends ProductDetailEvent {}
