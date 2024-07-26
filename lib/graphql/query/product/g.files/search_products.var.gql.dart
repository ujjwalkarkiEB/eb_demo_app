// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:eb_demo_app/graphql/g.files/serializers.gql.dart' as _i1;

part 'search_products.var.gql.g.dart';

abstract class GsearchProductsVars
    implements Built<GsearchProductsVars, GsearchProductsVarsBuilder> {
  GsearchProductsVars._();

  factory GsearchProductsVars(
          [void Function(GsearchProductsVarsBuilder b) updates]) =
      _$GsearchProductsVars;

  String? get title;
  int? get price_min;
  int? get price_max;
  double? get categoryId;
  int? get limit;
  int? get offset;
  static Serializer<GsearchProductsVars> get serializer =>
      _$gsearchProductsVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GsearchProductsVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GsearchProductsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GsearchProductsVars.serializer,
        json,
      );
}
