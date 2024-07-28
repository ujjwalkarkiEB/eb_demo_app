part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class HomeDataLoading extends HomeState {}

final class HomeDataLoadError extends HomeState {}

final class HomeDataLoaded extends HomeState {
  final List<ProductSummary> trendingProducts;
  final List<CategorySummary>? categories;

  const HomeDataLoaded(this.trendingProducts, this.categories);
}

class SearchLoading extends HomeState {}

class SearchLoaded extends HomeState {
  final List<ProductSummary> suggestions;

  const SearchLoaded(this.suggestions);

  @override
  List<Object> get props => [suggestions];
}

class SearchError extends HomeState {}

class SearchLoadingMore extends HomeState {}
