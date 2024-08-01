import 'package:auto_route/auto_route.dart';
import 'package:eb_demo_app/core/config/route/app_route.dart';
import 'package:eb_demo_app/src/features/shop/presentation/screens/store/widget/filter_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:eb_demo_app/core/common/widgets/cart/cart_badge.dart';
import 'package:eb_demo_app/src/features/shop/data/model/product.dart';
import 'package:eb_demo_app/src/features/shop/data/repository/store_repository.dart';

import '../../../../../../core/config/injection/injection.dart';
import '../../blocs/store/store_bloc.dart';

@RoutePage()
class StoreScreen extends StatefulWidget {
  const StoreScreen({super.key});

  @override
  StoreScreenState createState() => StoreScreenState();
}

class StoreScreenState extends State<StoreScreen> {
  final scrollController = ScrollController();
  int _selectedCategoryId = 1;
  List<ProductSummary> products = [];

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_onScroll);
    // Fetch initial category products
    context
        .read<StoreBloc>()
        .add(FetchCategoryProducts(categoryID: _selectedCategoryId.toDouble()));
  }

  void _onScroll() {
    if (scrollController.offset == scrollController.position.maxScrollExtent &&
        context.read<StoreBloc>().hasLoadingMore) {
      context
          .read<StoreBloc>()
          .add(LoadMoreEvent(categoryID: _selectedCategoryId.toDouble()));
    }
  }

  void _fetchCategoryProducts(int categoryId) {
    context
        .read<StoreBloc>()
        .add(FetchCategoryProducts(categoryID: categoryId.toDouble()));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title:
              Text('Store', style: Theme.of(context).textTheme.headlineMedium),
          actions: const [CartBadge()],
          bottom: TabBar(
            isScrollable: true,
            labelColor: Colors.white,
            indicatorColor: Colors.white,
            dividerColor: Colors.white,
            tabs: const [
              Tab(text: 'Clothes'),
              Tab(text: 'Electronics'),
              Tab(text: 'Furniture'),
              Tab(text: 'Shoes'),
              Tab(text: 'Miscellaneous'),
            ],
            onTap: (index) {
              _selectedCategoryId = index + 1; // Map tab index to category ID
              _fetchCategoryProducts(_selectedCategoryId);
            },
          ),
        ),
        body: Column(
          children: [
            FilterSection(
              initialMinPrice: 0,
              initialMaxPrice: 1000,
              categoryID: _selectedCategoryId.toDouble(),
            ),
            Expanded(
              child: BlocBuilder<StoreBloc, StoreState>(
                builder: (context, state) {
                  if (state is CategoryProductsLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state is CategoryProductsFetchError) {
                    return const Center(child: Text('Failed to load products'));
                  }

                  if (state is CategoryProductsFetched ||
                      state is FilteredProductsFetched ||
                      state is FetchedLoadMoreProducts) {
                    if (state is CategoryProductsFetched) {
                      products = state.categpryProducts;
                    } else if (state is FilteredProductsFetched) {
                      products = state.filteredProducts;
                    } else if (state is FetchedLoadMoreProducts) {
                      products = state.loadedProducts;
                    }

                    return ListView.builder(
                      controller: scrollController,
                      itemCount: products.length +
                          (context.read<StoreBloc>().hasLoadingMore
                              ? 1
                              : 0), // Add 1 for the loading indicator if more products are being loaded
                      itemBuilder: (context, index) {
                        if (index == products.length) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        final product = products[index];
                        return ListTile(
                          onTap: () {
                            context.router.push(
                                ProductDetailRoute(productID: product.id));
                          },
                          title: Text(product.title),
                          subtitle: Text('\$${product.price}'),
                          trailing: Image.network(
                            product.images[0],
                            errorBuilder: (context, error, stackTrace) =>
                                Image.asset("assets/images/image.jpg"),
                          ),
                        );
                      },
                    );
                  }

                  return const Center(child: Text('No products available'));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
