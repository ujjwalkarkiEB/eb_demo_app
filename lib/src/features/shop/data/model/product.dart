import 'dart:convert';

import 'package:eb_demo_app/core/utils/mixins/quantity_mixin.dart';
import 'package:eb_demo_app/graphql/query/product/g.files/get_product_by_id.data.gql.dart';
import 'package:hive/hive.dart';

part 'product.g.dart';

@HiveType(typeId: 1)
class ProductSummary extends HiveObject with QuantityMixin {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  double price;
  @HiveField(3)
  final List<String> images;
  double? categoryID;

  ProductSummary(
      {required this.id,
      required this.title,
      required this.price,
      required this.images,
      this.categoryID});
}

class ProductDetail extends ProductSummary {
  final String description;
  final String categoryName;
  final DateTime creationAt;
  final DateTime updatedAt;

  ProductDetail({
    required super.id,
    required super.title,
    required super.price,
    required super.images,
    required this.description,
    required this.categoryName,
    required this.creationAt,
    required this.updatedAt,
  });

  factory ProductDetail.fromModel(GgetProductDetailsData data) {
    final product = data.product;

    return ProductDetail(
      id: product.id,
      title: product.title,
      price: product.price,
      images: product.images
          .map<String>((image) => image.replaceAll(RegExp(r'\[|\]|\"'), ''))
          .toList(),
      description: product.description,
      categoryName: product.category.name,
      creationAt: DateTime.parse(product.creationAt.value.toString()),
      updatedAt: DateTime.parse(product.updatedAt.value.toString()),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'price': price,
    };
  }

  String toQrData() {
    return json.encode(toJson());
  }
}
