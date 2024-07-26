// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:eb_demo_app/graphql/g.files/serializers.gql.dart' as _i1;

part 'get_category_by_id.var.gql.g.dart';

abstract class GgetProductDetailsVars
    implements Built<GgetProductDetailsVars, GgetProductDetailsVarsBuilder> {
  GgetProductDetailsVars._();

  factory GgetProductDetailsVars(
          [void Function(GgetProductDetailsVarsBuilder b) updates]) =
      _$GgetProductDetailsVars;

  String get id;
  static Serializer<GgetProductDetailsVars> get serializer =>
      _$ggetProductDetailsVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GgetProductDetailsVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GgetProductDetailsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GgetProductDetailsVars.serializer,
        json,
      );
}
