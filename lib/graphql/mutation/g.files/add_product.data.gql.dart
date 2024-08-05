// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:eb_demo_app/graphql/g.files/serializers.gql.dart' as _i1;

part 'add_product.data.gql.g.dart';

abstract class GAddProductData
    implements Built<GAddProductData, GAddProductDataBuilder> {
  GAddProductData._();

  factory GAddProductData([void Function(GAddProductDataBuilder b) updates]) =
      _$GAddProductData;

  static void _initializeBuilder(GAddProductDataBuilder b) =>
      b..G__typename = 'Mutation';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GAddProductData_addProduct get addProduct;
  static Serializer<GAddProductData> get serializer =>
      _$gAddProductDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAddProductData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GAddProductData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GAddProductData.serializer,
        json,
      );
}

abstract class GAddProductData_addProduct
    implements
        Built<GAddProductData_addProduct, GAddProductData_addProductBuilder> {
  GAddProductData_addProduct._();

  factory GAddProductData_addProduct(
          [void Function(GAddProductData_addProductBuilder b) updates]) =
      _$GAddProductData_addProduct;

  static void _initializeBuilder(GAddProductData_addProductBuilder b) =>
      b..G__typename = 'Product';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  String get title;
  double get price;
  BuiltList<String> get images;
  GAddProductData_addProduct_category get category;
  static Serializer<GAddProductData_addProduct> get serializer =>
      _$gAddProductDataAddProductSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAddProductData_addProduct.serializer,
        this,
      ) as Map<String, dynamic>);

  static GAddProductData_addProduct? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GAddProductData_addProduct.serializer,
        json,
      );
}

abstract class GAddProductData_addProduct_category
    implements
        Built<GAddProductData_addProduct_category,
            GAddProductData_addProduct_categoryBuilder> {
  GAddProductData_addProduct_category._();

  factory GAddProductData_addProduct_category(
      [void Function(GAddProductData_addProduct_categoryBuilder b)
          updates]) = _$GAddProductData_addProduct_category;

  static void _initializeBuilder(
          GAddProductData_addProduct_categoryBuilder b) =>
      b..G__typename = 'Category';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  static Serializer<GAddProductData_addProduct_category> get serializer =>
      _$gAddProductDataAddProductCategorySerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAddProductData_addProduct_category.serializer,
        this,
      ) as Map<String, dynamic>);

  static GAddProductData_addProduct_category? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GAddProductData_addProduct_category.serializer,
        json,
      );
}
