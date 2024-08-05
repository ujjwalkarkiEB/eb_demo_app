import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:gap/gap.dart';
import 'package:auto_route/auto_route.dart';
import 'package:eb_demo_app/core/common/widgets/custom_shapes/container/circular_container.dart';
import 'package:eb_demo_app/src/features/shop/data/model/product.dart';
import 'package:eb_demo_app/src/features/shop/presentation/blocs/cart/cart_bloc.dart';
import 'package:eb_demo_app/src/features/shop/presentation/blocs/myproducts/myproducts_bloc.dart'; // Import your Bloc
import 'package:eb_demo_app/core/config/route/app_route.dart';

class VerticalProductCard extends StatelessWidget {
  const VerticalProductCard(
      {super.key, required this.productSummary, this.isCreator = false});
  final ProductSummary productSummary;
  final bool isCreator;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.router.push(ProductDetailRoute(productID: productSummary.id));
      },
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(255, 198, 221, 199),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image thumbnail
                Container(
                  height: 150,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  child: CachedNetworkImage(
                    imageUrl: productSummary.images.isNotEmpty
                        ? productSummary.images[0]
                        : '',
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
                    errorWidget: (context, url, error) => Image.asset(
                      'assets/images/image.jpg',
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const Gap(10),
                // Attributes
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    productSummary.title,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                const Spacer(),
                // Add button
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
                ),
              ],
            ),
          ),
          if (isCreator)
            Positioned(
              top: 5,
              right: 0,
              child: PopupMenuButton<String>(
                icon: const Icon(Icons.more_vert, color: Colors.white),
                onSelected: (value) {
                  if (value == 'delete') {
                    context
                        .read<MyproductsBloc>()
                        .add(DeleteProductEvent(product: productSummary));
                  }
                },
                itemBuilder: (context) => [
                  const PopupMenuItem<String>(
                    value: 'delete',
                    child: Row(
                      children: [
                        Icon(Icons.delete, color: Colors.red),
                        SizedBox(width: 8),
                        Text('Delete', style: TextStyle(color: Colors.red)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
