import 'package:auto_route/auto_route.dart';
import 'package:eb_demo_app/core/common/widgets/cards/vertical_product_card.dart';
import 'package:eb_demo_app/core/common/widgets/cart/cart_badge.dart';
import 'package:eb_demo_app/core/common/widgets/layout/grid_layout.dart';
import 'package:eb_demo_app/core/utils/constants/colors.dart';
import 'package:eb_demo_app/src/features/shop/data/model/product.dart';
import 'package:flutter/material.dart';
import 'package:searchfield/searchfield.dart';

@RoutePage()
class MyproductsScreen extends StatelessWidget {
  const MyproductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final suggestions = ['Clothes', 'Electronics', 'Furniture']
        .map((e) => SearchFieldListItem(e))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Products',
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .apply(color: Colors.white),
        ),
        backgroundColor: AppColors.buttonColor,
        actions: const [CartBadge()],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: SizedBox(
              height: 80,
              child: SearchField(
                suggestions: suggestions,
                searchInputDecoration: const InputDecoration(
                  label: Text('Select Category'),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  icon: Icon(IconData(0xf068, fontFamily: 'MaterialIcons')),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 9.0),
              child: SingleChildScrollView(
                child: GridLayout(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return VerticalProductCard(
                      productSummary: ProductSummary(
                        id: 'asdas',
                        title: 'Product $index',
                        price: 1212,
                        images: [''],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
