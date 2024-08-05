import 'package:auto_route/auto_route.dart';
import 'package:eb_demo_app/core/common/widgets/snackbars/error_snackbar.dart';
import 'package:eb_demo_app/core/config/injection/injection.dart';
import 'package:eb_demo_app/src/features/shop/data/model/product.dart';
import 'package:eb_demo_app/src/features/shop/presentation/blocs/cart/cart_bloc.dart';
import 'package:eb_demo_app/src/features/shop/presentation/blocs/product_detail/product_detail_bloc.dart';
import 'package:eb_demo_app/src/features/shop/presentation/screens/product_detail/widgets/product_detaul_silver_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/common/widgets/snackbars/sucess_snackbar.dart';
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
      child: BlocListener<CartBloc, CartState>(
        listener: (context, state) {
          if (state is CartProductAdded) {
            showSuccessSnackbar(
              context,
              'The Product has been added to your cart!',
            );
          }
          if (state is CartActionError) {
            showFlashError(
                context, 'This product has already been added to cart!');
          }
        },
        child: BlocBuilder<ProductDetailBloc, ProductDetailState>(
          builder: (context, state) {
            if (state is ProductDetailFetchSuccess) {
              print('lsiasdasd: ${state.detail.images}');
            }
            return Scaffold(
              bottomNavigationBar: state is ProductDetailFetchSuccess
                  ? AddCartBar(
                      product: ProductSummary(
                        id: state.detail.id,
                        title: state.detail.title,
                        price: state.detail.price,
                        images: state.detail.images,
                      ),
                    )
                  : null,
              body: CustomScrollView(
                slivers: [
                  if (state is ProductDetailFetchLoading ||
                      state is ProductInitial)
                    const SliverAppBar(
                      pinned: true,
                      automaticallyImplyLeading: false,
                      toolbarHeight: 10,
                      flexibleSpace: LinearProgressIndicator(),
                    ),
                  if (state is ProductDetailFetchSuccess)
                    ProductDetailSiverAppBar(image: state.detail.images[0]),
                  if (state is ProductDetailFetchSuccess)
                    ProductInfo(product: state.detail),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
