import 'package:auto_route/auto_route.dart';
import 'package:eb_demo_app/core/common/widgets/layout/grid_layout.dart';
import 'package:eb_demo_app/core/utils/constants/colors.dart';
import 'package:eb_demo_app/core/utils/constants/images.dart';
import 'package:eb_demo_app/src/features/shop/presentation/screens/homenav/home/widget/promo_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:badges/badges.dart' as badges;

import '../../../../../../../core/common/widgets/cards/vertical_product_card.dart';
import '../../../../../../../core/common/widgets/listile/section_header.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.buttonColor,
      body: Column(
        children: [
          SafeArea(
            child: SizedBox(
              height: screenSize.height * 0.3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    ListTile(
                        leading: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Good day for shopping',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .apply(color: Colors.white),
                            ),
                            Text(
                              'Ujjwal Karki',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .apply(color: Colors.white),
                            )
                          ],
                        ),
                        trailing: const SizedBox(
                          width: 40,
                          height: 40,
                          child: Stack(
                            children: [
                              Icon(
                                Icons.cabin,
                                size: 30,
                                color: Colors.white,
                              ),
                              Positioned(
                                top: -1,
                                right: 0,
                                child: badges.Badge(
                                  badgeContent: Text(
                                    '100',
                                    style: TextStyle(
                                        fontSize: 10,
                                        color:
                                            Colors.white), // Adjust font size
                                  ),
                                  badgeStyle: badges.BadgeStyle(
                                    badgeColor: Colors.red,
                                    padding: EdgeInsets.all(
                                        4), // Adjust padding to change badge size
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                    const Gap(10),

                    // Search Container
                    Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search, color: Colors.grey),
                          hintText: "Search",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 16),
                        ),
                      ),
                    ),

                    // category section header
                    const SectionHeader(
                      title: 'Popular Categories',
                    ),

                    // category lists
                    Expanded(
                      child: SizedBox(
                        height: 60,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          separatorBuilder: (__, _) => const Gap(20),
                          itemBuilder: (context, index) {
                            return const Column(
                              children: [
                                CircleAvatar(
                                  // backgroundImage:
                                  //     AssetImage(AppImages.userImage),
                                  backgroundColor: Colors.white,
                                  radius: 30,
                                ),
                                Text(
                                  'Category',
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
                color: Colors.white,
              ),
              child: ListView(
                children: [
                  const Gap(5),
                  const SizedBox(
                    child: PromoSlider(
                      promoBanners: [
                        AppImages.productImg1,
                        AppImages.productImg2,
                        AppImages.productImg3,
                        AppImages.productImg4,
                      ],
                    ),
                  ),
                  const SectionHeader(
                    title: 'Products',
                    isViewAll: true,
                    textColor: Colors.black,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: GridLayout(
                      itemCount: 10,
                      itemBuilder: (p0, p1) {
                        return const VerticalProductCard(
                          productTitle: 'goldtsar',
                          price: '12',
                          createdAt: '1-1-1',
                          image: '',
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
