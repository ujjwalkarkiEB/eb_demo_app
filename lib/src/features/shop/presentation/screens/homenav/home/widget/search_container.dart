import 'package:auto_route/auto_route.dart';
import 'package:eb_demo_app/core/config/route/app_route.dart';
import 'package:eb_demo_app/src/features/shop/presentation/blocs/home/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:searchfield/searchfield.dart';

import '../../../../../data/model/product.dart';

class SearchContainer extends StatefulWidget {
  const SearchContainer({super.key});

  @override
  State<SearchContainer> createState() => _SearchContainerState();
}

class _SearchContainerState extends State<SearchContainer> {
  final searchTextController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final suggestionDecoration = SuggestionDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(24),
    );

    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          final suggestions = (state is SearchLoaded) ? state.suggestions : [];
          final isLoadingMore = state is SearchLoadingMore;
          print(isLoadingMore);

          return SearchField(
            controller: searchTextController,
            showEmpty: isLoadingMore,
            emptyWidget: Container(
                decoration: suggestionDecoration,
                // item*maxItems
                child: const Center(
                    child: CircularProgressIndicator(
                  color: Colors.black,
                ))),
            key: const Key('SearchField'),
            itemHeight: 50,
            maxSuggestionsInViewPort: 3,
            suggestions:
                suggestions.map((e) => SearchFieldListItem(e.title)).toList(),
            scrollbarDecoration: ScrollbarDecoration(),
            searchInputDecoration: const InputDecoration(
              fillColor: Colors.white,
              prefixIcon: Icon(Icons.search, color: Colors.grey),
              hintText: "Search",
              hintStyle: TextStyle(color: Colors.grey),
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            ),
            suggestionsDecoration: suggestionDecoration,
            suggestionItemDecoration: const BoxDecoration(
              color: Colors.white,
            ),
            onSuggestionTap: (x) {
              context.router.push(const ProductDetailRoute());
              searchTextController.clear();
              Focus.of(context).unfocus();
            },
            onScroll: (offset, maxOffset) {
              if (offset >= maxOffset) {
                setState(() {
                  isLoading = true;
                });
                context.read<HomeBloc>().add(
                      LoadMoreSuggestionsEvent(
                        searchTextController.text,
                      ),
                    );
              }
            },
            onSearchTextChanged: (query) {
              // if searched query is empty by clearing show empty suggestions
              if (query.trim() == '') {
                return [];
              }
              context.read<HomeBloc>().add(SearchProductsByTitleEvent(query));
              return suggestions
                  .map((e) => SearchFieldListItem(e.title))
                  .toList();
            },
          );
        },
      ),
    );
  }
}
