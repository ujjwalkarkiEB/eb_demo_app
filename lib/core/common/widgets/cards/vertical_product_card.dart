import 'package:auto_route/auto_route.dart';
import 'package:eb_demo_app/core/common/widgets/custom_shapes/container/circular_container.dart';
import 'package:eb_demo_app/core/config/route/app_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/images.dart';

class VerticalProductCard extends StatelessWidget {
  const VerticalProductCard({
    super.key,
    required this.productTitle,
    required this.createdAt,
    required this.price,
    required this.image,
  });

  final String productTitle;
  final String createdAt;
  final String price;
  final String image;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.router.push(ProductDetailRoute());
        print('clicked');
      },
      child: Container(
        width: 180,
        height: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color.fromARGB(255, 173, 201, 174),
          // boxShadow: [
          //   BoxShadow(
          //       color: Colors.black.withOpacity(0.1),
          //       blurRadius: 50,
          //       spreadRadius: 7,
          //       offset: const Offset(0, 2))
          // ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // image thumbnail
            Stack(
              children: [
                Container(
                  height: 150,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  child: Image.network(
                    image,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                    top: 2,
                    right: 2,
                    child: InkWell(
                      onTap: () {},
                      child: CircularContainer(
                        height: 40,
                        width: 40,
                        backgroundColor: Colors.white,
                        radius: 20,
                        child: Icon(
                          Iconsax.heart5,
                          color: Colors.red,
                        ),
                      ),
                    )),
              ],
            ),
            const Gap(10),
            // attributes
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(productTitle),
                  Text(createdAt),
                ],
              ),
            ),
            const Spacer(),
            // add button
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('$price\$'),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                    ),
                    child: InkWell(
                      onTap: () {},
                      child: const SizedBox(
                        height: 40,
                        width: 40,
                        child: Icon(
                          Icons.add,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
