// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:eb_demo_app/graphql/g.files/serializers.gql.dart' as _i1;

part 'get_category_by_id.var.gql.g.dart';

abstract class GgetCategoryByIdVars
    implements Built<GgetCategoryByIdVars, GgetCategoryByIdVarsBuilder> {
  GgetCategoryByIdVars._();

  factory GgetCategoryByIdVars(
          [void Function(GgetCategoryByIdVarsBuilder b) updates]) =
      _$GgetCategoryByIdVars;

  String get id;
  static Serializer<GgetCategoryByIdVars> get serializer =>
      _$ggetCategoryByIdVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GgetCategoryByIdVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GgetCategoryByIdVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GgetCategoryByIdVars.serializer,
        json,
      );
}
