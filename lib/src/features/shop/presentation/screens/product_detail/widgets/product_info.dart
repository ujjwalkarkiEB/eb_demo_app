import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:read_more_text/read_more_text.dart';

import '../../../../../../../core/common/widgets/custom_shapes/container/circular_container.dart';
import '../../../../../../../core/common/widgets/listile/section_header.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // QrPreviewTile(),
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
                  '\$250',
                  style: TextStyle(decoration: TextDecoration.lineThrough),
                ),
                Gap(20),
                Text('\$175')
              ],
            ),
            Text('Green Nike Sports'),
            Text('Status:  In Stock'),
            SizedBox(
                width: double.infinity,
                child:
                    ElevatedButton(onPressed: () {}, child: Text('Checkout'))),
            Text('Description'),
            ReadMoreText(
              'This is a very long text to demo the usages of this package\n'
              'This is a very long text to demo the usages of this package\n'
              'This is a very long text to demo the usages of this package\n'
              'This is a very long text to demo the usages of this package',
              numLines: 2,
              readMoreText: 'Read more',
              readLessText: 'Read less',
            ),
            ReadMoreText(
              'This is a very long text to demo the usages of this package\n'
              'This is a very long text to demo the usages of this package\n'
              'This is a very long text to demo the usages of this package\n'
              'This is a very long text to demo the usages of this package',
              numLines: 2,
              readMoreText: 'Read more',
              readLessText: 'Read less',
            ),
            ReadMoreText(
              'This is a very long text to demo the usages of this package\n'
              'This is a very long text to demo the usages of this package\n'
              'This is a very long text to demo the usages of this package\n'
              'This is a very long text to demo the usages of this package',
              numLines: 2,
              readMoreText: 'Read more',
              readLessText: 'Read less',
            ),
            ReadMoreText(
              'This is a very long text to demo the usages of this package\n'
              'This is a very long text to demo the usages of this package\n'
              'This is a very long text to demo the usages of this package\n'
              'This is a very long text to demo the usages of this package',
              numLines: 2,
              readMoreText: 'Read more',
              readLessText: 'Read less',
            ),
            ReadMoreText(
              'This is a very long text to demo the usages of this package\n'
              'This is a very long text to demo the usages of this package\n'
              'This is a very long text to demo the usages of this package\n'
              'This is a very long text to demo the usages of this package',
              numLines: 2,
              readMoreText: 'Read more',
              readLessText: 'Read less',
            ),
            ReadMoreText(
              'This is a very long text to demo the usages of this package\n'
              'This is a very long text to demo the usages of this package\n'
              'This is a very long text to demo the usages of this package\n'
              'This is a very long text to demo the usages of this package',
              numLines: 2,
              readMoreText: 'Read more',
              readLessText: 'Read less',
            ),
            ReadMoreText(
              'This is a very long text to demo the usages of this package\n'
              'This is a very long text to demo the usages of this package\n'
              'This is a very long text to demo the usages of this package\n'
              'This is a very long text to demo the usages of this package',
              numLines: 2,
              readMoreText: 'Read more',
              readLessText: 'Read less',
            ),
            ReadMoreText(
              'This is a very long text to demo the usages of this package\n'
              'This is a very long text to demo the usages of this package\n'
              'This is a very long text to demo the usages of this package\n'
              'This is a very long text to demo the usages of this package',
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
