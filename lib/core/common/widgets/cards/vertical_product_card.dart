import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:gap/gap.dart';
import 'package:auto_route/auto_route.dart';
import 'package:eb_demo_app/core/common/widgets/custom_shapes/container/circular_container.dart';
import 'package:eb_demo_app/src/features/shop/data/model/product.dart';
import 'package:eb_demo_app/src/features/shop/presentation/blocs/cart/cart_bloc.dart';
import 'package:eb_demo_app/core/config/route/app_route.dart';

class VerticalProductCard extends StatelessWidget {
  const VerticalProductCard({super.key, required this.productSummary});
  final ProductSummary productSummary;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.router.push(ProductDetailRoute(productID: productSummary.id));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color.fromARGB(255, 198, 221, 199),
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
                  child: CachedNetworkImage(
                    imageUrl: productSummary.images.isNotEmpty
                        ? productSummary.images[0]
                        : 'assets/images/image.jpg',
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) => const Center(
                      child: Icon(Icons.error),
                    ),
                  ),
                ),
                Positioned(
                    top: 2,
                    right: 2,
                    child: InkWell(
                      onTap: () {},
                      child: const CircularContainer(
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
              child: Text(
                productSummary.title,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            const Spacer(),
            // add button
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${productSummary.price}\$'),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                    ),
                    child: InkWell(
                      onTap: () async {
                        context
                            .read<CartBloc>()
                            .add(AddProductToCartEvent(productSummary));
                      },
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
