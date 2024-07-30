import 'package:auto_route/auto_route.dart';
import 'package:eb_demo_app/core/common/widgets/custom_shapes/container/circular_container.dart';
import 'package:eb_demo_app/core/config/route/app_route.dart';
import 'package:eb_demo_app/src/features/shop/data/model/product.dart';
import 'package:eb_demo_app/src/features/shop/presentation/blocs/cart/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';

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
                  child: productSummary.images.isNotEmpty
                      ? Image.network(
                          productSummary.images[0],
                          width: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                                width: double.infinity,
                                color: const Color.fromARGB(255, 221, 214, 214),
                                child: Icon(Icons.image));
                          },
                        )
                      : const Center(
                          child: Icon(
                            Icons.image,
                            size: 50,
                            color: Colors.grey,
                          ),
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
                      onTap: () {
                        context
                            .read<CartBloc>()
                            .add(AddProductToCartEvent(productSummary));
                        context.read<CartBloc>().add(GetCartItemsCount());
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
