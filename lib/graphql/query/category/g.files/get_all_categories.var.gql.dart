// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:eb_demo_app/graphql/g.files/serializers.gql.dart' as _i1;

part 'get_all_categories.var.gql.g.dart';

abstract class GgetAllCategoriesVars
    implements Built<GgetAllCategoriesVars, GgetAllCategoriesVarsBuilder> {
  GgetAllCategoriesVars._();

  factory GgetAllCategoriesVars(
          [void Function(GgetAllCategoriesVarsBuilder b) updates]) =
      _$GgetAllCategoriesVars;

  static Serializer<GgetAllCategoriesVars> get serializer =>
      _$ggetAllCategoriesVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GgetAllCategoriesVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GgetAllCategoriesVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GgetAllCategoriesVars.serializer,
        json,
      );
}
