// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:eb_demo_app/graphql/g.files/serializers.gql.dart' as _i1;

part 'search_products.data.gql.g.dart';

abstract class GsearchProductsData
    implements Built<GsearchProductsData, GsearchProductsDataBuilder> {
  GsearchProductsData._();

  factory GsearchProductsData(
          [void Function(GsearchProductsDataBuilder b) updates]) =
      _$GsearchProductsData;

  static void _initializeBuilder(GsearchProductsDataBuilder b) =>
      b..G__typename = 'Query';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GsearchProductsData_products> get products;
  static Serializer<GsearchProductsData> get serializer =>
      _$gsearchProductsDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GsearchProductsData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GsearchProductsData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GsearchProductsData.serializer,
        json,
      );
}

abstract class GsearchProductsData_products
    implements
        Built<GsearchProductsData_products,
            GsearchProductsData_productsBuilder> {
  GsearchProductsData_products._();

  factory GsearchProductsData_products(
          [void Function(GsearchProductsData_productsBuilder b) updates]) =
      _$GsearchProductsData_products;

  static void _initializeBuilder(GsearchProductsData_productsBuilder b) =>
      b..G__typename = 'Product';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  String get title;
  double get price;
  BuiltList<String> get images;
  static Serializer<GsearchProductsData_products> get serializer =>
      _$gsearchProductsDataProductsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GsearchProductsData_products.serializer,
        this,
      ) as Map<String, dynamic>);

  static GsearchProductsData_products? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GsearchProductsData_products.serializer,
        json,
      );
}
