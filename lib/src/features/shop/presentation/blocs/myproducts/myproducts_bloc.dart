import 'package:bloc/bloc.dart';
import 'package:eb_demo_app/src/features/shop/data/model/category.dart';
import 'package:eb_demo_app/src/features/shop/data/repository/my_products_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../data/model/product.dart';

part 'myproducts_event.dart';
part 'myproducts_state.dart';

@injectable
class MyproductsBloc extends Bloc<MyproductsEvent, MyproductsState> {
  final MyProductsRepository _myProductsRepository;
  MyproductsBloc(this._myProductsRepository) : super(MyProductsInitial()) {
    on<FetchMyProductsEvenet>(_onFetchEvent);
    on<ApplyCategoryFilterEvent>(_applyCategoryFilter);
    on<DeleteProductEvent>(_deleteProductEvent);
  }

  void _onFetchEvent(
      FetchMyProductsEvenet event, Emitter<MyproductsState> emit) async {
    emit(FetchingMyProducts());
    final result = await _myProductsRepository.fetchMyProducts();
    result.fold(
      (failure) => emit(FailedFetchMyProducts()),
      (products) => emit(FetchedMyProducts(products: products)),
    );
  }

  void _deleteProductEvent(
      DeleteProductEvent event, Emitter<MyproductsState> emit) async {
    emit(DeletingProduct());

    final result =
        await _myProductsRepository.deleteMyProduct(product: event.product);
    result.fold(
      (failure) => emit(DeletedProductFailed()),
      (sucesmsg) {
        emit(DeletedProduct());
      },
    );
  }

  void _applyCategoryFilter(
      ApplyCategoryFilterEvent event, Emitter<MyproductsState> emit) async {}
}
