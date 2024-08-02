import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:eb_demo_app/src/features/shop/data/model/category.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import 'package:eb_demo_app/src/features/shop/data/model/product.dart';
import 'package:eb_demo_app/src/features/shop/data/repository/store_repository.dart';

part 'store_event.dart';
part 'store_state.dart';

@injectable
class StoreBloc extends Bloc<StoreEvent, StoreState> {
  final StoreRepository _storeRepository;

  StoreBloc(this._storeRepository) : super(StoreInitial()) {
    on<FetchCategoryProducts>(_onFetchCategoryProducts);
    on<ApplyPriceFilterEvent>(_onApplyPriceFilterEvent);
    on<LoadMoreEvent>(_onLoadMore);
    on<CreateProductEvent>(_onCreatedProductEvent);
  }

  final int _limit = 10;
  int _offset = 0;
  // flag to represent if more items to load
  bool hasLoadingMore = true;
  List<ProductSummary> categoryProducts = [];

  // ----- create products input
  ProductCategory? selectedCategory;
  List<String>? pickedProductImages;
  // --------

  Future<void> _onFetchCategoryProducts(
    FetchCategoryProducts event,
    Emitter<StoreState> emit,
  ) async {
    emit(CategoryProductsLoading());
    // reset offset when switching tabs
    _offset = 0;
    hasLoadingMore = true;
    final result = await _storeRepository.fetchCategoryProducts(
        categoryID: event.categoryID, offset: _offset);

    result.fold(
      (failure) => emit(CategoryProductsFetchError()),
      (products) {
        categoryProducts = products;
        emit(CategoryProductsFetched(categoryProducts));
      },
    );
  }

  Future<void> _onApplyPriceFilterEvent(
    ApplyPriceFilterEvent event,
    Emitter<StoreState> emit,
  ) async {
    emit(CategoryProductsLoading());
    hasLoadingMore = false;
    final result = await _storeRepository.applyPriceFilter(
      categoryID: event.categoryId,
      minPrice: event.minPrice.toInt(),
      maxPrice: event.maxPrice.toInt(),
    );

    result.fold(
      (failure) => emit(CategoryProductsFetchError()),
      (products) => emit(FilteredProductsFetched(filteredProducts: products)),
    );
  }

  void _onLoadMore(LoadMoreEvent event, Emitter<StoreState> emit) async {
    if (!hasLoadingMore) {
      return;
    }
    await Future.delayed(const Duration(seconds: 1));
    final result = await _storeRepository.fetchCategoryProducts(
        categoryID: event.categoryID, offset: _offset + _limit);

    result.fold(
      (failure) => emit(CategoryProductsFetchError()),
      (products) {
        if (products.isEmpty) {
          hasLoadingMore = false;
        }
        categoryProducts.addAll(products);
        emit(FetchedLoadMoreProducts(loadedProducts: categoryProducts));
      },
    );
  }

  void _onCreatedProductEvent(
      CreateProductEvent event, Emitter<StoreState> emit) async {
    try {
      emit(ProductCreateLoading());
      if (selectedCategory == null || pickedProductImages == null) {
        emit(ProductInputFieldError(
            field: 'Field', msg: 'Please provide all input details'));
        return;
      }
      final categoryID = productCategoryInfo[selectedCategory]!['id'] as int;
      await _storeRepository.createdProduct(
          title: event.title,
          description: event.description,
          price: event.price,
          categoryID: double.parse(categoryID.toString()),
          images: pickedProductImages!);
      emit(ProductCreateSuccessful());
    } catch (e) {
      emit(ProductCreateError());
    }
  }
}
