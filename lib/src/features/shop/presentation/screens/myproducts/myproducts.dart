import 'package:auto_route/auto_route.dart';
import 'package:eb_demo_app/core/common/widgets/cards/vertical_product_card.dart';
import 'package:eb_demo_app/core/common/widgets/cart/cart_badge.dart';
import 'package:eb_demo_app/core/common/widgets/layout/grid_layout.dart';
import 'package:eb_demo_app/core/common/widgets/snackbars/error_snackbar.dart';
import 'package:eb_demo_app/core/common/widgets/snackbars/sucess_snackbar.dart';
import 'package:eb_demo_app/core/config/injection/injection.dart';
import 'package:eb_demo_app/core/utils/constants/colors.dart';
import 'package:eb_demo_app/src/features/shop/presentation/blocs/store/store_bloc.dart';
import 'package:eb_demo_app/src/features/shop/presentation/screens/myproducts/widget/filter_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:searchfield/searchfield.dart';

import '../../blocs/myproducts/myproducts_bloc.dart';

@RoutePage()
class MyProductsScreen extends StatelessWidget {
  const MyProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<MyproductsBloc>()..add(FetchMyProductsEvenet()),
      child: MultiBlocListener(
        listeners: [
          BlocListener<MyproductsBloc, MyproductsState>(
            listener: (context, state) async {
              if (state is DeletedProductFailed) {
                showFlashError(context, 'Failed to delete the Product!');
              }

              if (state is DeletedProduct) {
                await QuickAlert.show(
                  context: context,
                  type: QuickAlertType.success,
                  text: 'Product is deleted successfully!',
                  width: 50,
                );
                if (!context.mounted) {
                  return;
                }
                context.read<MyproductsBloc>().add(FetchMyProductsEvenet());
              }
            },
          ),
          BlocListener<StoreBloc, StoreState>(
            listenWhen: (previous, current) =>
                current is ProductCreateSuccessful,
            listener: (context, state) {
              if (state is ProductCreateSuccessful) {
                context.read<MyproductsBloc>().add(FetchMyProductsEvenet());
              }
            },
          ),
        ],
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              'My Products',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .apply(color: Colors.white),
            ),
            backgroundColor: AppColors.buttonColor,
            actions: const [
              Padding(
                padding: EdgeInsets.only(right: 20),
                child: CartBadge(),
              )
            ],
          ),
          body: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(14.0),
                child: SizedBox(height: 80, child: FilterDropdown()),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 9.0),
                  child: BlocBuilder<MyproductsBloc, MyproductsState>(
                    builder: (context, state) {
                      if (state is FetchedMyProducts) {
                        final products = state.products;
                        return products.isEmpty
                            ? const Center(
                                child: Text('No products created yet!'),
                              )
                            : GridLayout(
                                itemCount: products.length,
                                itemBuilder: (context, index) {
                                  return VerticalProductCard(
                                    productSummary: state.products[index],
                                    isCreator: true,
                                  );
                                },
                              );
                      } else if (state is FailedFetchMyProducts) {
                        return const Center(
                            child: Text('Failed to load products'));
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
