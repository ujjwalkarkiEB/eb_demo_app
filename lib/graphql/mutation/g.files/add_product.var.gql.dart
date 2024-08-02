// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:eb_demo_app/graphql/g.files/serializers.gql.dart' as _i1;

part 'add_product.var.gql.g.dart';

abstract class GAddProductVars
    implements Built<GAddProductVars, GAddProductVarsBuilder> {
  GAddProductVars._();

  factory GAddProductVars([void Function(GAddProductVarsBuilder b) updates]) =
      _$GAddProductVars;

  String get title;
  double get price;
  String get description;
  double get categoryId;
  BuiltList<String> get images;
  static Serializer<GAddProductVars> get serializer =>
      _$gAddProductVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAddProductVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GAddProductVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GAddProductVars.serializer,
        json,
      );
}
