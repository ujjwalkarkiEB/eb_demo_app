import 'package:auto_route/auto_route.dart';
import 'package:eb_demo_app/core/common/widgets/layout/grid_layout.dart';
import 'package:eb_demo_app/core/common/widgets/snackbars/error_snackbar.dart';
import 'package:eb_demo_app/core/common/widgets/snackbars/sucess_snackbar.dart';
import 'package:eb_demo_app/core/config/injection/injection.dart';
import 'package:eb_demo_app/core/config/route/app_route.dart';
import 'package:eb_demo_app/core/utils/constants/colors.dart';
import 'package:eb_demo_app/core/utils/constants/images.dart';
import 'package:eb_demo_app/src/features/personalization/presentation/bloc/personalization_bloc.dart';
import 'package:eb_demo_app/src/features/shop/presentation/blocs/cart/cart_bloc.dart';
import 'package:eb_demo_app/src/features/shop/presentation/blocs/home/home_bloc.dart';
import 'package:eb_demo_app/src/features/shop/presentation/screens/home/widget/promo_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:quickalert/quickalert.dart';

import '../../../../../../core/common/widgets/cards/vertical_product_card.dart';
import '../../../../../../core/common/widgets/listile/section_header.dart';
import '../../../data/model/category.dart';
import '../../../data/model/product.dart';
import 'widget/primar_header.dart';
import 'widget/search_container.dart';
import 'widget/shimmers.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CategorySummary> categories = [];
  List<ProductSummary> trendingProducts = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<PersonalizationBloc>().add(ProfileFetchRequestEvent());
    print(
        ' home :  ${getIt<AppRouter>().root.innerRouterOf<TabsRouter>(MainNavRoute.name)?.activeIndex}');
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => getIt<HomeBloc>()
        ..add(FetchCategoriesEvent())
        ..add(FetchTrendingProductsEvent()),
      child: Scaffold(
        backgroundColor: AppColors.buttonColor,
        body: MultiBlocListener(
          listeners: [
            BlocListener<CartBloc, CartState>(
              listener: (context, state) {
                if (state is CartProductAdded) {
                  showSuccessSnackbar(
                    context,
                    '${state.productTitle} has been added to your cart list!',
                  );
                }
                if (state is CartProductAddFailed) {
                  showFlashError(context, state.msg);
                }
              },
            ),
          ],
          child: BlocBuilder<HomeBloc, HomeState>(
            buildWhen: (previous, current) => previous != current,
            builder: (context, state) {
              if (state is HomeDataLoadError) {
                return const Center(
                    child: Text('Something went wrong',
                        style: TextStyle(color: Colors.red)));
              }

              if (state is CategoriesLoaded) {
                categories = state.categories;
              }

              if (state is TrendingProductsLoaded) {
                trendingProducts = state.trendingProducts;
              }

              return RefreshIndicator(
                onRefresh: () async {
                  context.read<HomeBloc>().add(FetchCategoriesEvent());
                  await Future.delayed(const Duration(milliseconds: 500));
                  context.read<HomeBloc>().add(FetchTrendingProductsEvent());
                },
                child: Column(
                  children: [
                    SafeArea(
                      child: SizedBox(
                        height: screenSize.height * 0.35,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const PrimaryHeader(),
                              const Gap(10),
                              const SearchContainer(),
                              const SectionHeader(
                                title: 'Popular Categories',
                              ),
                              BlocBuilder<HomeBloc, HomeState>(
                                  builder: (context, state) {
                                if (state is HomeDataLoading ||
                                    state is HomeInitial) {
                                  return buildShimmerCategories();
                                }
                                return _buildCategories(categories);
                              }),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: const BoxDecoration(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(40)),
                          color: Colors.white,
                        ),
                        child: ListView(
                          children: [
                            const PromoSlider(
                              promoBanners: [
                                AppImages.productImg1,
                                AppImages.productImg2,
                                AppImages.productImg3,
                                AppImages.productImg4,
                              ],
                            ),
                            const SectionHeader(
                              title: 'Top 10 Products',
                              isViewAll: true,
                              textColor: Colors.black,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: BlocBuilder<HomeBloc, HomeState>(
                                builder: (context, state) {
                                  if (state is HomeDataLoading ||
                                      state is HomeInitial) {
                                    return buildShimmerProducts();
                                  }
                                  return _buildProducts(trendingProducts);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildCategories(List<CategorySummary> categories) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (__, _) => const Gap(20),
        itemBuilder: (context, index) {
          final category = categories[index];
          return Column(
            children: [
              CircleAvatar(
                backgroundImage: category.image.trim().isEmpty
                    ? const AssetImage(AppImages.productImg1)
                    : NetworkImage(
                        category.image,
                      ),
                radius: 30,
              ),
              const Spacer(),
              Text(
                category.name,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildProducts(List<ProductSummary> trendingProducts) {
    return GridLayout(
      itemCount: trendingProducts.length,
      itemBuilder: (context, index) {
        final product = trendingProducts[index];
        return GestureDetector(
          onTap: () {
            QuickAlert.show(
              context: context,
              type: QuickAlertType.info,
              title: 'Product Selected',
              text: '${product.title} selected!',
            );
          },
          child: VerticalProductCard(
            productSummary: product,
          ),
        );
      },
    );
  }
}
