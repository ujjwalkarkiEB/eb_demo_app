// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:eb_demo_app/graphql/g.files/serializers.gql.dart' as _i1;

part 'get_all_categories.data.gql.g.dart';

abstract class GgetAllCategoriesData
    implements Built<GgetAllCategoriesData, GgetAllCategoriesDataBuilder> {
  GgetAllCategoriesData._();

  factory GgetAllCategoriesData(
          [void Function(GgetAllCategoriesDataBuilder b) updates]) =
      _$GgetAllCategoriesData;

  static void _initializeBuilder(GgetAllCategoriesDataBuilder b) =>
      b..G__typename = 'Query';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GgetAllCategoriesData_categories> get categories;
  static Serializer<GgetAllCategoriesData> get serializer =>
      _$ggetAllCategoriesDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GgetAllCategoriesData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GgetAllCategoriesData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GgetAllCategoriesData.serializer,
        json,
      );
}

abstract class GgetAllCategoriesData_categories
    implements
        Built<GgetAllCategoriesData_categories,
            GgetAllCategoriesData_categoriesBuilder> {
  GgetAllCategoriesData_categories._();

  factory GgetAllCategoriesData_categories(
          [void Function(GgetAllCategoriesData_categoriesBuilder b) updates]) =
      _$GgetAllCategoriesData_categories;

  static void _initializeBuilder(GgetAllCategoriesData_categoriesBuilder b) =>
      b..G__typename = 'Category';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  String get name;
  String get image;
  static Serializer<GgetAllCategoriesData_categories> get serializer =>
      _$ggetAllCategoriesDataCategoriesSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GgetAllCategoriesData_categories.serializer,
        this,
      ) as Map<String, dynamic>);

  static GgetAllCategoriesData_categories? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GgetAllCategoriesData_categories.serializer,
        json,
      );
}
