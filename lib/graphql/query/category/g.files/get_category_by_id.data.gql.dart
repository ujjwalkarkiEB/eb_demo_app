// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:eb_demo_app/graphql/g.files/schema.schema.gql.dart' as _i2;
import 'package:eb_demo_app/graphql/g.files/serializers.gql.dart' as _i1;

part 'get_category_by_id.data.gql.g.dart';

abstract class GgetCategoryByIdData
    implements Built<GgetCategoryByIdData, GgetCategoryByIdDataBuilder> {
  GgetCategoryByIdData._();

  factory GgetCategoryByIdData(
          [void Function(GgetCategoryByIdDataBuilder b) updates]) =
      _$GgetCategoryByIdData;

  static void _initializeBuilder(GgetCategoryByIdDataBuilder b) =>
      b..G__typename = 'Query';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GgetCategoryByIdData_category get category;
  static Serializer<GgetCategoryByIdData> get serializer =>
      _$ggetCategoryByIdDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GgetCategoryByIdData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GgetCategoryByIdData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GgetCategoryByIdData.serializer,
        json,
      );
}

abstract class GgetCategoryByIdData_category
    implements
        Built<GgetCategoryByIdData_category,
            GgetCategoryByIdData_categoryBuilder> {
  GgetCategoryByIdData_category._();

  factory GgetCategoryByIdData_category(
          [void Function(GgetCategoryByIdData_categoryBuilder b) updates]) =
      _$GgetCategoryByIdData_category;

  static void _initializeBuilder(GgetCategoryByIdData_categoryBuilder b) =>
      b..G__typename = 'Category';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  String get name;
  String get image;
  BuiltList<GgetCategoryByIdData_category_products> get products;
  static Serializer<GgetCategoryByIdData_category> get serializer =>
      _$ggetCategoryByIdDataCategorySerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GgetCategoryByIdData_category.serializer,
        this,
      ) as Map<String, dynamic>);

  static GgetCategoryByIdData_category? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GgetCategoryByIdData_category.serializer,
        json,
      );
}

abstract class GgetCategoryByIdData_category_products
    implements
        Built<GgetCategoryByIdData_category_products,
            GgetCategoryByIdData_category_productsBuilder> {
  GgetCategoryByIdData_category_products._();

  factory GgetCategoryByIdData_category_products(
      [void Function(GgetCategoryByIdData_category_productsBuilder b)
          updates]) = _$GgetCategoryByIdData_category_products;

  static void _initializeBuilder(
          GgetCategoryByIdData_category_productsBuilder b) =>
      b..G__typename = 'Product';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  String get title;
  double get price;
  String get description;
  BuiltList<String> get images;
  _i2.GDateTime get creationAt;
  _i2.GDateTime get updatedAt;
  static Serializer<GgetCategoryByIdData_category_products> get serializer =>
      _$ggetCategoryByIdDataCategoryProductsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GgetCategoryByIdData_category_products.serializer,
        this,
      ) as Map<String, dynamic>);

  static GgetCategoryByIdData_category_products? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GgetCategoryByIdData_category_products.serializer,
        json,
      );
}
