import 'package:flutter/material.dart';

import 'product.dart';

enum ProductCategory { clothes, electronics, furniture, shoes, miscellaneous }

const productCategoryInfo = {
  ProductCategory.clothes: {
    'id': 1,
    'color': Colors.green,
  },
  ProductCategory.electronics: {
    'id': 2,
    'color': Colors.red,
  },
  ProductCategory.furniture: {
    'id': 3,
    'color': Colors.blue,
  },
  ProductCategory.shoes: {
    'id': 4,
    'color': Colors.yellow,
  },
  ProductCategory.miscellaneous: {
    'id': 5,
    'color': Colors.brown,
  },
};

class CategorySummary {
  final String id;
  final String name;
  final String image;

  CategorySummary({
    required this.id,
    required this.name,
    required this.image,
  });
}

class CategoryDetail extends CategorySummary {
  final List<ProductSummary> products;

  CategoryDetail({
    required super.id,
    required super.name,
    required this.products,
    required super.image,
  });
}
