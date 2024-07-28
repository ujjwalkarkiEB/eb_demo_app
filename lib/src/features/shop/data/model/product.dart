import 'package:eb_demo_app/graphql/query/product/g.files/get_product_by_id.data.gql.dart';

class ProductSummary {
  final String id;
  final String title;
  final double price;
  final List<String> images;

  ProductSummary({
    required this.id,
    required this.title,
    required this.price,
    required this.images,
  });
}

class ProductDetail extends ProductSummary {
  final String description;
  final String categoryID;
  final DateTime creationAt;
  final DateTime updatedAt;

  ProductDetail({
    required super.id,
    required super.title,
    required super.price,
    required super.images,
    required this.description,
    required this.categoryID,
    required this.creationAt,
    required this.updatedAt,
  });

  factory ProductDetail.fromModel(GgetProductDetailsData data) {
    final product = data.product;

    return ProductDetail(
      id: product.id,
      title: product.title,
      price: product.price,
      images: List<String>.from(product.images),
      description: product.description,
      categoryID: product.category.id,
      creationAt: DateTime.parse(product.creationAt.toString()),
      updatedAt: DateTime.parse(product.updatedAt.toString()),
    );
  }
}
