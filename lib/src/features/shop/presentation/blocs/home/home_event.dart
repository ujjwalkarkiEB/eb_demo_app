part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

final class FetchCategoriesEvent extends HomeEvent {}

final class FetchTrendingProductsEvent extends HomeEvent {}

final class SearchProductsByTitleEvent extends HomeEvent {
  final String query;

  const SearchProductsByTitleEvent(this.query);

  @override
  List<Object> get props => [query];
}

final class LoadMoreSuggestionsEvent extends HomeEvent {
  final String query;

  const LoadMoreSuggestionsEvent(this.query);

  @override
  List<Object> get props => [query];
}
