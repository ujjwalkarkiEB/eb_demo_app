import 'package:auto_route/auto_route.dart';
import 'package:eb_demo_app/core/common/widgets/layout/grid_layout.dart';
import 'package:eb_demo_app/core/config/injection/injection.dart';
import 'package:eb_demo_app/core/utils/constants/colors.dart';
import 'package:eb_demo_app/core/utils/constants/images.dart';
import 'package:eb_demo_app/core/utils/helpers/helper_functions.dart';
import 'package:eb_demo_app/src/features/shop/presentation/blocs/home/home_bloc.dart';
import 'package:eb_demo_app/src/features/shop/presentation/screens/homenav/home/widget/promo_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../../core/common/widgets/cards/vertical_product_card.dart';
import '../../../../../../../core/common/widgets/listile/section_header.dart';
import '../../../../data/model/category.dart';
import '../../../../data/model/product.dart';
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
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => getIt<HomeBloc>()..add(HomeDataFetchEvent()),
      child: Scaffold(
        backgroundColor: AppColors.buttonColor,
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeDataLoadError) {
              return const Center(
                  child: Text('Something went wrong',
                      style: TextStyle(color: Colors.red)));
            }

            if (state is HomeDataLoaded) {
              trendingProducts = state.trendingProducts;
              categories = state.categories!;
            }
            return Column(
              children: [
                SafeArea(
                  child: SizedBox(
                    height: screenSize.height * 0.36,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Primary header
                          const PrimaryHeader(),
                          const Gap(10),
                          // Search Container
                          const SearchContainer(),
                          const SectionHeader(
                            title: 'Popular Categories',
                          ),

                          // category lists
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
                        // promo carousel slider
                        const PromoSlider(
                          promoBanners: [
                            AppImages.productImg1,
                            AppImages.productImg2,
                            AppImages.productImg3,
                            AppImages.productImg4,
                          ],
                        ),
                        const SectionHeader(
                          title: 'Products',
                          isViewAll: true,
                          textColor: Colors.black,
                        ),
                        // top products grid view
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
            );
          },
        ),
      ),
    );
  }

  Widget _buildCategories(List<CategorySummary> categories) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        separatorBuilder: (__, _) => const Gap(20),
        itemBuilder: (context, index) {
          // final category = categories[index];
          return Column(
            children: [
              const CircleAvatar(
                backgroundColor: Colors.white,
                radius: 30,
              ),
              Spacer(),
              Text(
                'category',
                style: TextStyle(color: Colors.white),
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
        return VerticalProductCard(
          productTitle: product.title,
          price: product.price.toString(),
          createdAt: '',
          image: product.images[0],
        );
      },
    );
  }
}
