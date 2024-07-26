// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:eb_demo_app/graphql/g.files/schema.schema.gql.dart' as _i2;
import 'package:eb_demo_app/graphql/g.files/serializers.gql.dart' as _i1;

part 'get_product_by_id.data.gql.g.dart';

abstract class GgetProductDetailsData
    implements Built<GgetProductDetailsData, GgetProductDetailsDataBuilder> {
  GgetProductDetailsData._();

  factory GgetProductDetailsData(
          [void Function(GgetProductDetailsDataBuilder b) updates]) =
      _$GgetProductDetailsData;

  static void _initializeBuilder(GgetProductDetailsDataBuilder b) =>
      b..G__typename = 'Query';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GgetProductDetailsData_product get product;
  static Serializer<GgetProductDetailsData> get serializer =>
      _$ggetProductDetailsDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GgetProductDetailsData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GgetProductDetailsData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GgetProductDetailsData.serializer,
        json,
      );
}

abstract class GgetProductDetailsData_product
    implements
        Built<GgetProductDetailsData_product,
            GgetProductDetailsData_productBuilder> {
  GgetProductDetailsData_product._();

  factory GgetProductDetailsData_product(
          [void Function(GgetProductDetailsData_productBuilder b) updates]) =
      _$GgetProductDetailsData_product;

  static void _initializeBuilder(GgetProductDetailsData_productBuilder b) =>
      b..G__typename = 'Product';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  String get title;
  double get price;
  String get description;
  GgetProductDetailsData_product_category get category;
  BuiltList<String> get images;
  _i2.GDateTime get creationAt;
  _i2.GDateTime get updatedAt;
  static Serializer<GgetProductDetailsData_product> get serializer =>
      _$ggetProductDetailsDataProductSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GgetProductDetailsData_product.serializer,
        this,
      ) as Map<String, dynamic>);

  static GgetProductDetailsData_product? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GgetProductDetailsData_product.serializer,
        json,
      );
}

abstract class GgetProductDetailsData_product_category
    implements
        Built<GgetProductDetailsData_product_category,
            GgetProductDetailsData_product_categoryBuilder> {
  GgetProductDetailsData_product_category._();

  factory GgetProductDetailsData_product_category(
      [void Function(GgetProductDetailsData_product_categoryBuilder b)
          updates]) = _$GgetProductDetailsData_product_category;

  static void _initializeBuilder(
          GgetProductDetailsData_product_categoryBuilder b) =>
      b..G__typename = 'Category';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  String get name;
  static Serializer<GgetProductDetailsData_product_category> get serializer =>
      _$ggetProductDetailsDataProductCategorySerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GgetProductDetailsData_product_category.serializer,
        this,
      ) as Map<String, dynamic>);

  static GgetProductDetailsData_product_category? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GgetProductDetailsData_product_category.serializer,
        json,
      );
}
