import 'package:eb_demo_app/src/features/shop/data/model/product.dart';
import 'package:eb_demo_app/src/features/shop/presentation/blocs/cart/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';

import '../custom_shapes/container/circular_container.dart';

class CartItem extends StatefulWidget {
  const CartItem({
    super.key,
    required this.product,
  });
  final ProductSummary product;

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  void initState() {
    super.initState();
    context.read<CartBloc>().add(FetchProductCartCount(widget.product));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      buildWhen: (previous, current) {
        if (current is ProductCartCount &&
            current.productId == widget.product.id) {
          return true;
        }
        return false;
      },
      builder: (context, state) {
        int quantity = 0;

        if (state is ProductCartCount && state.productId == widget.product.id) {
          quantity = state.count;
        }

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                widget.product.images.isNotEmpty
                    ? widget.product.images[0]
                    : '',
                height: 100,
                width: 100,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Center(
                    child: Icon(
                      Icons.image,
                      size: 50,
                      color: Colors.grey,
                    ),
                  );
                },
              ),
            ),
            const Gap(10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.product.title),
                  const Gap(20),
                  Row(
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: () => context.read<CartBloc>().add(
                                DecrementProductQuantityEvent(widget.product)),
                            child: const CircularContainer(
                              backgroundColor: Colors.green,
                              child: Center(
                                child: Icon(
                                  Iconsax.minus,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const Gap(8),
                          Text(quantity.toString()), // Display quantity
                          const Gap(8),
                          InkWell(
                            onTap: () => context.read<CartBloc>().add(
                                IncrementProductQuantityEvent(widget.product)),
                            child: const CircularContainer(
                              backgroundColor: Colors.green,
                              child: Center(
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Text('\$${widget.product.price * quantity}'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
