import 'package:eb_demo_app/src/features/shop/presentation/blocs/cart/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/utils/constants/colors.dart';
import 'package:eb_demo_app/src/features/shop/data/model/product.dart';

class AddCartBar extends StatefulWidget {
  final ProductSummary product;

  const AddCartBar({
    super.key,
    required this.product,
  });

  @override
  State<AddCartBar> createState() => _AddCartBarState();
}

class _AddCartBarState extends State<AddCartBar> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      alignment: Alignment.centerRight,
      decoration: const BoxDecoration(
        color: AppColors.whiteSmoke,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: ElevatedButton(
          onPressed: () {
            context.read<CartBloc>().add(AddProductToCartEvent(widget.product));
          },
          child: const Text(
            'Add to cart',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
