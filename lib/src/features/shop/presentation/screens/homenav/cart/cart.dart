import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../../../core/common/widgets/cart/cart_item.dart';

@RoutePage()
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(onPressed: () {}, child: Text('Checkout \$2000')),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: ListView.separated(
          separatorBuilder: (context, index) => const Gap(10),
          itemCount: 20,
          itemBuilder: (context, index) {
            return CartItem(producTitle: 'GoldStar Shoes', image: '');
          },
        ),
      ),
    );
  }
}
