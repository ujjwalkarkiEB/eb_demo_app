import 'package:auto_route/auto_route.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:eb_demo_app/core/common/widgets/snackbars/error_snackbar.dart';
import 'package:eb_demo_app/core/config/injection/injection.dart';
import 'package:eb_demo_app/core/utils/notification/notification_service.dart';
import 'package:eb_demo_app/src/features/shop/presentation/blocs/cart/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../../../core/common/widgets/cart/cart_item.dart';
import '../../../data/model/product.dart';

@RoutePage()
class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<ProductSummary> cartProducts = [];
  @override
  void initState() {
    super.initState();
    context.read<CartBloc>().add(FetchCartProductsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>(
      buildWhen: (previous, current) {
        return current is CartFetchSuccess;
      },
      listener: (context, state) {
        if (state is CartActionSuccess) {
          getIt<NotificationService>().showNotification(
            body: 'Your orders have been placed!',
            title: 'Cart Items Shipped',
          );
          context.read<CartBloc>().add(FetchCartProductsEvent());
        }

        if (state is CartActionError) {
          showFlashError(context, state.errorMsg);
        }
      },
      builder: (context, state) {
        if (state is CartFetchSuccess) {
          double checkoutPrice = context.watch<CartBloc>().checkoutPrice;
          cartProducts = state.cartProducts;
          return Scaffold(
            appBar: AppBar(
              title: const Text('Cart'),
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: cartProducts.isEmpty
                    ? () {}
                    : () {
                        context.read<CartBloc>()
                          ..add(CheckoutCartItems())
                          ..add(GetCartItemsCount());
                      },
                child: Text('Checkout \$$checkoutPrice'),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: cartProducts.isEmpty
                  ? const Center(
                      child: Text('Currently there are no products added!'),
                    )
                  : ListView.separated(
                      separatorBuilder: (context, index) => const Gap(10),
                      itemCount: cartProducts.length,
                      itemBuilder: (context, index) {
                        final product = cartProducts.reversed.toList()[index];

                        return CartItem(
                          product: product,
                        );
                      },
                    ),
            ),
          );
        }

        return Scaffold(
          appBar: AppBar(),
          body: const Center(
            child: Text('Something went wrong!'),
          ),
        );
      },
    );
  }
}
