import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/images.dart';
import '../custom_shapes/container/circular_container.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.producTitle,
    required this.image,
  });

  final String producTitle;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // image
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            AppImages.productImg1,
            height: 100,
            width: 100,
            fit: BoxFit.cover,
          ),
        ),
        const Gap(10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(producTitle),
              Gap(20),
              const Row(
                children: [
                  Row(
                    children: [
                      CircularContainer(
                        backgroundColor: Colors.green,
                        child: Center(
                            child: Icon(
                          Iconsax.minus,
                          color: Colors.white,
                        )),
                      ),
                      Gap(8),
                      Text('4'),
                      Gap(8),
                      CircularContainer(
                        backgroundColor: Colors.green,
                        child: Center(
                            child: Icon(
                          Icons.add,
                          color: Colors.white,
                        )),
                      )
                    ],
                  ),
                  Spacer(),
                  Text('\$200'),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
