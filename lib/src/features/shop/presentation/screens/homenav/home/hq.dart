// import 'package:auto_route/auto_route.dart';
// import 'package:eb_demo_app/core/common/widgets/layout/grid_layout.dart';
// import 'package:eb_demo_app/core/config/injection/injection.dart';
// import 'package:eb_demo_app/core/utils/constants/colors.dart';
// import 'package:eb_demo_app/core/utils/constants/images.dart';
// import 'package:eb_demo_app/core/utils/helpers/helper_functions.dart';
// import 'package:eb_demo_app/src/features/shop/presentation/blocs/home/home_bloc.dart';
// import 'package:eb_demo_app/src/features/shop/presentation/screens/homenav/home/widget/promo_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:gap/gap.dart';
// import 'package:shimmer/shimmer.dart';
// import 'package:badges/badges.dart' as badges;

// import '../../../../../../../core/common/widgets/cards/vertical_product_card.dart';
// import '../../../../../../../core/common/widgets/listile/section_header.dart';
// import '../../../../data/model/category.dart';
// import '../../../../data/model/product.dart';

// @RoutePage()
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   List<CategorySummary> categories = [];
//   List<ProductSummary> trendingProducts = [];
//   @override
//   Widget build(BuildContext context) {
//     final screenSize = MediaQuery.of(context).size;
//     return BlocProvider(
//       create: (context) => getIt<HomeBloc>()..add(HomeDataFetchEvent()),
//       child: Scaffold(
//         backgroundColor: AppColors.buttonColor,
//         body: BlocBuilder<HomeBloc, HomeState>(
//           builder: (context, state) {
//             if (state is HomeDataLoadError) {
//               return Center(
//                   child: Text('Something went wrong',
//                       style: TextStyle(color: Colors.red)));
//             }

//             if (state is HomeDataLoaded) {
//               trendingProducts = state.trendingProducts;
//               categories = state.categories!;
//             }
//             return Column(
//               children: [
//                 SafeArea(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         ListTile(
//                           leading: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 HelperFunctions.getGreeting(TimeOfDay.now()),
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .headlineSmall!
//                                     .apply(color: Colors.white),
//                               ),
//                               Text(
//                                 'Ujjwal Karki',
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .titleSmall!
//                                     .apply(color: Colors.white),
//                               )
//                             ],
//                           ),
//                           trailing: const SizedBox(
//                             width: 40,
//                             height: 40,
//                             child: Stack(
//                               children: [
//                                 Icon(
//                                   Icons.cabin,
//                                   size: 30,
//                                   color: Colors.white,
//                                 ),
//                                 Positioned(
//                                   top: -1,
//                                   right: 0,
//                                   child: badges.Badge(
//                                     badgeContent: Text(
//                                       '100',
//                                       style: TextStyle(
//                                           fontSize: 10,
//                                           color:
//                                               Colors.white), // Adjust font size
//                                     ),
//                                     badgeStyle: badges.BadgeStyle(
//                                       badgeColor: Colors.red,
//                                       padding: EdgeInsets.all(
//                                           4), // Adjust padding to change badge size
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         const Gap(10),
//                         // Search Container
//                         Container(
//                           clipBehavior: Clip.hardEdge,
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                           child: const TextField(
//                             decoration: InputDecoration(
//                               prefixIcon:
//                                   Icon(Icons.search, color: Colors.grey),
//                               hintText: "Search",
//                               hintStyle: TextStyle(color: Colors.grey),
//                               border: InputBorder.none,
//                               enabledBorder: InputBorder.none,
//                               focusedBorder: InputBorder.none,
//                               errorBorder: InputBorder.none,
//                               disabledBorder: InputBorder.none,
//                               contentPadding: EdgeInsets.symmetric(
//                                   vertical: 12, horizontal: 16),
//                             ),
//                           ),
//                         ),
//                         const SectionHeader(
//                           title: 'Popular Categories',
//                         ),
//                         BlocBuilder<HomeBloc, HomeState>(
//                             builder: (context, state) {
//                           if (state is HomeDataLoading ||
//                               state is HomeInitial) {
//                             return _buildShimmerCategories();
//                           }

//                           return _buildCategories(categories);
//                         }),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: Container(
//                     clipBehavior: Clip.hardEdge,
//                     decoration: const BoxDecoration(
//                       borderRadius:
//                           BorderRadius.vertical(top: Radius.circular(40)),
//                       color: Colors.white,
//                     ),
//                     child: ListView(
//                       children: [
//                         const Gap(5),
//                         const SizedBox(
//                           child: PromoSlider(
//                             promoBanners: [
//                               AppImages.productImg1,
//                               AppImages.productImg2,
//                               AppImages.productImg3,
//                               AppImages.productImg4,
//                             ],
//                           ),
//                         ),
//                         const SectionHeader(
//                           title: 'Products',
//                           isViewAll: true,
//                           textColor: Colors.black,
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(18.0),
//                           child: BlocBuilder<HomeBloc, HomeState>(
//                             builder: (context, state) {
//                               if (state is HomeDataLoading ||
//                                   state is HomeInitial) {
//                                 return _buildShimmerProducts();
//                               }
//                               return _buildProducts(trendingProducts);
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }

//   Widget _buildShimmerCategories() {
//     return SizedBox(
//       height: 60,
//       child: ListView.separated(
//         scrollDirection: Axis.horizontal,
//         itemCount: 10,
//         separatorBuilder: (__, _) => const Gap(20),
//         itemBuilder: (context, index) {
//           return Column(
//             children: [
//               Shimmer.fromColors(
//                 baseColor: Colors.grey[300]!,
//                 highlightColor: Colors.grey[100]!,
//                 child: CircleAvatar(
//                   radius: 30,
//                   backgroundColor: Colors.grey,
//                 ),
//               ),
//               Shimmer.fromColors(
//                 baseColor: Colors.grey[300]!,
//                 highlightColor: Colors.grey[100]!,
//                 child: Container(
//                   width: 60,
//                   height: 10,
//                   color: Colors.grey,
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }

//   Widget _buildCategories(List<CategorySummary> categories) {
//     return SizedBox(
//       height: 60,
//       child: ListView.separated(
//         scrollDirection: Axis.horizontal,
//         itemCount: categories.length,
//         separatorBuilder: (__, _) => const Gap(20),
//         itemBuilder: (context, index) {
//           final category = categories[index];
//           return Column(
//             children: [
//               const CircleAvatar(
//                 backgroundColor: Colors.white,
//                 radius: 30,
//               ),
//               Text(
//                 category.name,
//                 style: TextStyle(color: Colors.white),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }

//   Widget _buildShimmerProducts() {
//     return GridLayout(
//       itemCount: 10,
//       itemBuilder: (context, index) {
//         return Shimmer.fromColors(
//           baseColor: Colors.grey[300]!,
//           highlightColor: Colors.grey[100]!,
//           child: VerticalProductCard(
//             productTitle: '',
//             price: '',
//             createdAt: '',
//             image: '',
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildProducts(List<ProductSummary> trendingProducts) {
//     return GridLayout(
//       itemCount: trendingProducts.length,
//       itemBuilder: (context, index) {
//         final product = trendingProducts[index];
//         return VerticalProductCard(
//           productTitle: product.title,
//           price: product.price.toString(),
//           createdAt: '',
//           image: product.images[0],
//         );
//       },
//     );
//   }
// }
