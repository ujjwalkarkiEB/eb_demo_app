import 'package:eb_demo_app/src/features/shop/data/model/product.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:read_more_text/read_more_text.dart';

import '../../../../../../../core/common/widgets/custom_shapes/container/circular_container.dart';
import '../../../../../../../core/common/widgets/listile/section_header.dart';
import 'qr_preview.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({
    super.key,
    required this.product,
  });

  final ProductDetail product;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            QrPreviewTile(
              data: product.toQrData(),
            ),
            Row(
              children: [
                CircularContainer(
                  height: 20,
                  width: 50,
                  backgroundColor: Colors.yellow,
                  child: Center(child: Text('25%')),
                  radius: 20,
                ),
                Gap(20),
                Text(
                  '\$${product.price * 1.25}',
                  style: TextStyle(decoration: TextDecoration.lineThrough),
                ),
                Gap(20),
                Text('\$${product.price}')
              ],
            ),
            Text(product.title.toUpperCase()),
            Text('Status:  In Stock'),
            Text('Description'),
            ReadMoreText(
              product.description,
              numLines: 2,
              readMoreText: 'Read more',
              readLessText: 'Read less',
            ),
            Divider(),
            SectionHeader(
              title: 'Reviews(100)',
              textColor: Colors.black,
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(Icons.menu),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
