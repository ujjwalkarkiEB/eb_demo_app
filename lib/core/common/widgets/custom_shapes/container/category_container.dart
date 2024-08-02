import 'package:eb_demo_app/src/features/shop/data/model/category.dart';
import 'package:flutter/material.dart';

class CategoryContainer extends StatelessWidget {
  const CategoryContainer(
      {super.key, required this.category, required this.isActive});
  final ProductCategory category;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 100,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isActive ? Colors.green : Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        category.name.toUpperCase(),
        style: TextStyle(
          color: isActive
              ? Colors.white
              : productCategoryInfo[category]!['color'] as Color,
        ),
      ),
    );
  }
}
