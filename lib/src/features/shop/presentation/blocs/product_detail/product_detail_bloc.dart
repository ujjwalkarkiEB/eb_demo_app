import 'package:bloc/bloc.dart';
import 'package:eb_demo_app/src/features/shop/data/repository/product_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../data/model/product.dart';

part 'product_detail_event.dart';
part 'product_detail_state.dart';

@injectable
class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  final ProductRepository _productRepository;
  ProductDetailBloc(this._productRepository) : super(ProductInitial()) {
    on<ProductDetailFetchEvent>(_onProducDetailFetch);
    on<ToggleProductLikeEvent>(_onToggleProductLike);
  }

  void _onProducDetailFetch(
      ProductDetailFetchEvent event, Emitter<ProductDetailState> emit) async {
    final result =
        await _productRepository.getProductDetail(id: event.productID);
    print('rs: ${result}');
    result.fold(
      (l) => emit(ProductDetailFetchError()),
      (r) => emit(ProductDetailFetchSuccess(detail: r)),
    );
  }

  void _onToggleProductLike(
      ToggleProductLikeEvent event, Emitter<ProductDetailState> emit) async {}
}
