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
  final int _limit = 5; // Define the limit of items to fetch each time

  HomeBloc(this._shopRepository) : super(HomeInitial()) {
    on<HomeDataFetchEvent>(_onHomeDataFech);
    on<SearchProductsByTitleEvent>(_onSearchProduct, transformer: debounce());
    on<LoadMoreSuggestionsEvent>(_onLoadMoreSuggestions);
  }

  List<ProductSummary> suggestions = [];

  void _onHomeDataFech(
      HomeDataFetchEvent event, Emitter<HomeState> emit) async {
    emit(HomeDataLoaded([], const []));
  }

  void _onSearchProduct(
      SearchProductsByTitleEvent event, Emitter<HomeState> emit) async {
    // Reset offset for new search query
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
        emit(SearchLoaded(suggestions));
      },
    );
  }
}

EventTransformer<Event> debounce<Event>(
    {Duration duration = const Duration(milliseconds: 500)}) {
  return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
}
