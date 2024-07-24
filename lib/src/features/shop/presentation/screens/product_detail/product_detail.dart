import 'package:auto_route/auto_route.dart';

import 'package:eb_demo_app/src/features/shop/presentation/screens/product_detail/widgets/product_detaul_silver_appbar.dart';
import 'package:flutter/material.dart';

import 'widgets/add_cart_bar.dart';
import 'widgets/product_info.dart';

@RoutePage()
class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: AddCartBar(),
      body: CustomScrollView(
        slivers: [
          ProductDetailSiverAppBar(),
          ProductInfo(),
        ],
      ),
    );
  }
}
