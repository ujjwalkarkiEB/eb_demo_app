import 'package:eb_demo_app/src/features/shop/presentation/blocs/store/store_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../../core/common/widgets/custom_shapes/container/category_container.dart';
import '../../../../../../data/model/category.dart';

class CategorySection extends StatefulWidget {
  const CategorySection({
    super.key,
  });

  @override
  State<CategorySection> createState() => _CategorySectionState();
}

class _CategorySectionState extends State<CategorySection> {
  ProductCategory? _selectedCategory;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 140,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisExtent: 50,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: ProductCategory.values.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    context.read<StoreBloc>().selectedCategory =
                        ProductCategory.values[index];

                    _selectedCategory = ProductCategory.values[index];
                  });
                },
                child: CategoryContainer(
                  isActive: _selectedCategory == ProductCategory.values[index],
                  category: ProductCategory.values[index],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
