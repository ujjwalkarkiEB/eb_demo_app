import 'package:bloc/bloc.dart';
import 'package:eb_demo_app/src/features/shop/data/repository/shop_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import '../../../data/model/category.dart';
import '../../../data/model/product.dart';

part 'home_event.dart';
part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ShopRepository _shopRepository;

  int offset = 0;
  final int _limit = 5;
  bool isFetching = false;

  HomeBloc(this._shopRepository) : super(HomeInitial()) {
    on<FetchCategoriesEvent>(_onFetchCategories);
    on<FetchTrendingProductsEvent>(_onFetchTrendingProducts);
    on<SearchProductsByTitleEvent>(_onSearchProduct, transformer: debounce());
    on<LoadMoreSuggestionsEvent>(_onLoadMoreSuggestions);
  }

  List<ProductSummary> suggestions = [];

  void _onFetchCategories(
      FetchCategoriesEvent event, Emitter<HomeState> emit) async {
    emit(HomeDataLoading());
    final categoriesResult = await _shopRepository.getCategories();

    categoriesResult.fold(
      (l) => emit(HomeDataLoadError()),
      (categories) {
        print('c: ${categories.length}');
        emit(CategoriesLoaded(categories));
      },
    );
  }

  void _onFetchTrendingProducts(
      FetchTrendingProductsEvent event, Emitter<HomeState> emit) async {
    emit(HomeDataLoading());
    final productsResult = await _shopRepository.getTrendingProducts();

    productsResult.fold(
      (l) => emit(HomeDataLoadError()),
      (products) {
        emit(TrendingProductsLoaded(products));
      },
    );
  }

  void _onSearchProduct(
      SearchProductsByTitleEvent event, Emitter<HomeState> emit) async {
    offset = 0;
    emit(SearchLoading());
    final result = await _shopRepository.searchProductsByTitle(
        query: event.query, offset: offset, limit: _limit);

    result.fold(
      (l) {
        suggestions = [];
        emit(SearchError());
      },
      (r) {
        suggestions = r;
        emit(SearchLoaded(suggestions));
      },
    );
  }

  void _onLoadMoreSuggestions(
      LoadMoreSuggestionsEvent event, Emitter<HomeState> emit) async {
    if (isFetching) return; // Prevent multiple fetches
    isFetching = true;
    emit(SearchLoadingMore());
    final result = await _shopRepository.searchProductsByTitle(
        query: event.query, offset: offset, limit: _limit);

    result.fold(
      (l) => emit(SearchError()),
      (r) {
        if (r.isNotEmpty) {
          offset += _limit;
          suggestions.addAll(r);
        }
        isFetching = false;
        emit(SearchLoaded(suggestions));
      },
    );
  }

  @override
  void onTransition(Transition<HomeEvent, HomeState> transition) {
    // TODO: implement onTransition
    super.onTransition(transition);
    print(transition);
  }
}

EventTransformer<Event> debounce<Event>(
    {Duration duration = const Duration(milliseconds: 500)}) {
  return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
}
