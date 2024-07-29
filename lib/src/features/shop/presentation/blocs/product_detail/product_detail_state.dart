part of 'product_detail_bloc.dart';

sealed class ProductDetailState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class ProductInitial extends ProductDetailState {}

final class ProductDetailFetchError extends ProductDetailState {}

final class ProductDetailFetchLoading extends ProductDetailState {}

final class ProductDetailFetchSuccess extends ProductDetailState {
  final ProductDetail detail;

  ProductDetailFetchSuccess({required this.detail});
}
