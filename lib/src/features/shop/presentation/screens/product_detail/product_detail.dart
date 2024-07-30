import 'package:auto_route/auto_route.dart';
import 'package:eb_demo_app/core/config/injection/injection.dart';
import 'package:eb_demo_app/src/features/shop/data/model/product.dart';
import 'package:eb_demo_app/src/features/shop/presentation/blocs/product_detail/product_detail_bloc.dart';

import 'package:eb_demo_app/src/features/shop/presentation/screens/product_detail/widgets/product_detaul_silver_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/add_cart_bar.dart';
import 'widgets/product_info.dart';

@RoutePage()
class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.productID});
  final String productID;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<ProductDetailBloc>()..add(ProductDetailFetchEvent(productID)),
      child: BlocConsumer<ProductDetailBloc, ProductDetailState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is ProductDetailFetchLoading || state is ProductInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is ProductDetailFetchSuccess) {
            final product = state.detail;
            return Scaffold(
              bottomNavigationBar: AddCartBar(
                product: ProductSummary(
                    id: state.detail.id,
                    title: product.title,
                    price: product.price,
                    images: product.images),
              ),
              body: CustomScrollView(
                slivers: [
                  ProductDetailSiverAppBar(image: state.detail.images[0]),
                  ProductInfo(
                    product: state.detail,
                  ),
                ],
              ),
            );
          }
          return const Center(
            child: Text('Something Went Wrong1'),
          );
        },
      ),
    );
  }
}
