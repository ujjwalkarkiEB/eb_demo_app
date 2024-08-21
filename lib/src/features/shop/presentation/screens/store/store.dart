import 'package:auto_route/auto_route.dart';
import 'package:eb_demo_app/core/config/injection/injection.dart';
import 'package:eb_demo_app/core/config/route/app_route.dart';
import 'package:eb_demo_app/src/features/shop/presentation/screens/store/widget/modal/add_product_modal.dart';
import 'package:eb_demo_app/src/features/shop/presentation/screens/store/widget/filter_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:eb_demo_app/core/common/widgets/cart/cart_badge.dart';
import 'package:eb_demo_app/src/features/shop/data/model/product.dart';

import '../../blocs/store/store_bloc.dart';

@RoutePage()
class StoreScreen extends StatefulWidget {
  const StoreScreen({super.key});

  @override
  StoreScreenState createState() => StoreScreenState();
}

class StoreScreenState extends State<StoreScreen> {
  final scrollController = ScrollController();
  List<ProductSummary> products = [];

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_onScroll);
    print(
        ' store :  ${getIt<AppRouter>().root.innerRouterOf<TabsRouter>(MainNavRoute.name)?.activeIndex}');
  }

  void _onScroll() {
    // ensure controller is attached to list view builder
    if (!scrollController.hasClients) {
      return;
    }
    // check if user has scrolled bottom of the list and if more items are yet to be loaded! i.e. available

    if (scrollController.offset == scrollController.position.maxScrollExtent &&
        context.read<StoreBloc>().hasLoadingMore) {
      context.read<StoreBloc>().add(LoadMoreEvent());
    }
  }

  void _fetchCategoryProducts() {
    context.read<StoreBloc>().add(FetchCategoryProducts());
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
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: CartBadge(),
            ),
          ],
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
              context.read<StoreBloc>().selectedTabCategory = index + 1;

              _fetchCategoryProducts();
            },
          ),
        ),
        body: Column(
          children: [
            const FilterSection(
              initialMinPrice: 0,
              initialMaxPrice: 1000,
            ),
            Expanded(
              child: BlocBuilder<StoreBloc, StoreState>(
                buildWhen: (previous, current) =>
                    current is! ProductCreateSuccessful ||
                    current is! ProductCreateError ||
                    current is! ProductCreateLoading ||
                    current is! ProductInputFieldError,
                builder: (context, state) {
                  if (state is CategoryProductsLoading ||
                      state is StoreInitial) {
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

                    return products.isEmpty
                        ? const Center(
                            child: Text('No products available!'),
                          )
                        : ListView.builder(
                            controller: scrollController,
                            itemCount: products.length +
                                (context.read<StoreBloc>().hasLoadingMore
                                    ? 1
                                    : 0),
                            itemBuilder: (context, index) {
                              if (index == products.length) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }

                              final product = products[index];
                              return ListTile(
                                onTap: () {
                                  context.router.push(ProductDetailRoute(
                                      productID: product.id));
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

                  return const Center(child: Text('Something went wrong!'));
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (_) => BlocProvider.value(
                value: context.read<StoreBloc>(),
                child: const ProductCreateScreen(),
              ),
            );
          },
          shape: const CircleBorder(),
          backgroundColor: Colors.green,
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
