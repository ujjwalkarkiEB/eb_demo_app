import 'package:auto_route/auto_route.dart';
import 'package:eb_demo_app/core/config/route/app_route.dart';
import 'package:eb_demo_app/core/utils/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../../../../../../core/common/widgets/custom_shapes/container/circular_container.dart';
import '../../../../../../../core/utils/constants/images.dart';

class ProductDetailSiverAppBar extends StatelessWidget {
  const ProductDetailSiverAppBar({
    super.key,
    required this.image,
  });
  final String image;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              context.router.popAndPush(HomeRoute());
            },
            child: const CircularContainer(
              height: 40,
              width: 40,
              radius: 20,
              child: Icon(Icons.close),
            ),
          ),
          const CircularContainer(
            height: 40,
            width: 40,
            radius: 20,
            child: Icon(
              Icons.favorite,
              color: Colors.red,
            ),
          ),
        ],
      ),
      backgroundColor: AppColors.buttonColor,
      pinned: true,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(20),
        child: PreferredSize(
            preferredSize: const Size.fromHeight(0),
            child: Container(
                height: 32,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(
                        50,
                      )),
                ),
                child: Container(
                  height: 6,
                  width: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey),
                ))),
      ),
      expandedHeight: 300,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.network(
          image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
