import 'package:auto_route/auto_route.dart';
import 'package:eb_demo_app/core/config/route/app_route.dart';
import 'package:eb_demo_app/src/features/shop/presentation/blocs/home/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:searchfield/searchfield.dart';

import '../../../../data/model/product.dart';

class SearchContainer extends StatefulWidget {
  const SearchContainer({super.key});

  @override
  State<SearchContainer> createState() => _SearchContainerState();
}

class _SearchContainerState extends State<SearchContainer> {
  final searchTextController = TextEditingController();
  final focus = FocusNode();

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
        buildWhen: (previous, current) =>
            previous != current && current is! SearchLoadingMore,
        builder: (context, state) {
          final List<ProductSummary> suggestions =
              (state is SearchLoaded) ? state.suggestions : [];

          return SearchField<ProductSummary>(
            controller: searchTextController,
            key: const Key('SearchField'),
            itemHeight: 50,
            maxSuggestionsInViewPort: 4,
            inputType: TextInputType.text,
            suggestions: suggestions
                .map((e) => SearchFieldListItem<ProductSummary>(e.id,
                    child: ListTile(
                      leading: Image.network(
                        e.images[0],
                        errorBuilder: (context, error, stackTrace) =>
                            Image.asset("assets/images/image.jpg"),
                      ),
                      minTileHeight: 10,
                      title: Text(e.title),
                    )))
                .toList(),
            scrollbarDecoration: ScrollbarDecoration(),
            searchInputDecoration: const InputDecoration(
              prefixIcon: Icon(Icons.search),
              labelText: 'Search Products',
              floatingLabelBehavior: FloatingLabelBehavior.never,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              border: InputBorder.none,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.symmetric(horizontal: 20),
            ),
            suggestionsDecoration: suggestionDecoration,
            suggestionItemDecoration: const BoxDecoration(
              color: Colors.white,
            ),
            onSuggestionTap: (SearchFieldListItem<ProductSummary> item) {
              context.router
                  .push(ProductDetailRoute(productID: item.searchKey));

              searchTextController.clear();
              focus.unfocus();
            },
            onScroll: (offset, maxOffset) {
              if (offset >= maxOffset && !context.read<HomeBloc>().isFetching) {
                context.read<HomeBloc>().add(
                      LoadMoreSuggestionsEvent(
                        searchTextController.text,
                      ),
                    );
              }
            },
            onSearchTextChanged: (query) {
              if (query.trim() == '') {
                return [];
              }
              context.read<HomeBloc>().add(SearchProductsByTitleEvent(query));
              return suggestions
                  .map((e) => SearchFieldListItem<ProductSummary>(e.title,
                      child: ListTile(
                        title: Text(e.title),
                      )))
                  .toList();
            },
          );
        },
      ),
    );
  }
}
