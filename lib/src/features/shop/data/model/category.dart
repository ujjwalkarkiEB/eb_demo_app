import 'product.dart';

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
