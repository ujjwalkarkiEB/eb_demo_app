import 'package:eb_demo_app/src/features/shop/data/model/product.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../../core/common/widgets/cards/vertical_product_card.dart';
import '../../../../../../../core/common/widgets/layout/grid_layout.dart';

Widget buildShimmerCategories() {
  return SizedBox(
    height: 80,
    child: ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      separatorBuilder: (__, _) => const Gap(20),
      itemBuilder: (context, index) {
        return Column(
          children: [
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: const CircleAvatar(
                radius: 30,
                backgroundColor: Colors.grey,
              ),
            ),
            const Spacer(),
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                width: 60,
                height: 10,
                color: Colors.grey,
              ),
            ),
          ],
        );
      },
    ),
  );
}

Widget buildShimmerProducts() {
  return GridLayout(
    itemCount: 10,
    itemBuilder: (context, index) {
      return Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: VerticalProductCard(
          productSummary:
              ProductSummary(id: '', price: 0, title: '', images: []),
        ),
      );
    },
  );
}
