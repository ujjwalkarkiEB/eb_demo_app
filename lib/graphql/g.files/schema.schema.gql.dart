// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:eb_demo_app/graphql/g.files/serializers.gql.dart' as _i1;
import 'package:gql_code_builder/src/serializers/default_scalar_serializer.dart'
    as _i2;

part 'schema.schema.gql.g.dart';

abstract class GCreateCategoryDto
    implements Built<GCreateCategoryDto, GCreateCategoryDtoBuilder> {
  GCreateCategoryDto._();

  factory GCreateCategoryDto(
          [void Function(GCreateCategoryDtoBuilder b) updates]) =
      _$GCreateCategoryDto;

  String get name;
  String get image;
  static Serializer<GCreateCategoryDto> get serializer =>
      _$gCreateCategoryDtoSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateCategoryDto.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCreateCategoryDto? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateCategoryDto.serializer,
        json,
      );
}

abstract class GCreateProductDto
    implements Built<GCreateProductDto, GCreateProductDtoBuilder> {
  GCreateProductDto._();

  factory GCreateProductDto(
          [void Function(GCreateProductDtoBuilder b) updates]) =
      _$GCreateProductDto;

  String get title;
  double get price;
  String get description;
  double get categoryId;
  BuiltList<String> get images;
  static Serializer<GCreateProductDto> get serializer =>
      _$gCreateProductDtoSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateProductDto.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCreateProductDto? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateProductDto.serializer,
        json,
      );
}

abstract class GCreateUserDto
    implements Built<GCreateUserDto, GCreateUserDtoBuilder> {
  GCreateUserDto._();

  factory GCreateUserDto([void Function(GCreateUserDtoBuilder b) updates]) =
      _$GCreateUserDto;

  String get email;
  String get name;
  String get password;
  GRole? get role;
  String get avatar;
  static Serializer<GCreateUserDto> get serializer =>
      _$gCreateUserDtoSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateUserDto.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCreateUserDto? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateUserDto.serializer,
        json,
      );
}

abstract class GDateTime implements Built<GDateTime, GDateTimeBuilder> {
  GDateTime._();

  factory GDateTime([String? value]) =>
      _$GDateTime((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GDateTime> get serializer =>
      _i2.DefaultScalarSerializer<GDateTime>(
          (Object serialized) => GDateTime((serialized as String?)));
}

class GRole extends EnumClass {
  const GRole._(String name) : super(name);

  static const GRole admin = _$gRoleadmin;

  static const GRole customer = _$gRolecustomer;

  static Serializer<GRole> get serializer => _$gRoleSerializer;

  static BuiltSet<GRole> get values => _$gRoleValues;

  static GRole valueOf(String name) => _$gRoleValueOf(name);
}

abstract class GUpdateCategoryDto
    implements Built<GUpdateCategoryDto, GUpdateCategoryDtoBuilder> {
  GUpdateCategoryDto._();

  factory GUpdateCategoryDto(
          [void Function(GUpdateCategoryDtoBuilder b) updates]) =
      _$GUpdateCategoryDto;

  String? get name;
  String? get image;
  static Serializer<GUpdateCategoryDto> get serializer =>
      _$gUpdateCategoryDtoSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateCategoryDto.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUpdateCategoryDto? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateCategoryDto.serializer,
        json,
      );
}

abstract class GUpdateProductDto
    implements Built<GUpdateProductDto, GUpdateProductDtoBuilder> {
  GUpdateProductDto._();

  factory GUpdateProductDto(
          [void Function(GUpdateProductDtoBuilder b) updates]) =
      _$GUpdateProductDto;

  String? get title;
  double? get price;
  String? get description;
  double? get categoryId;
  BuiltList<String>? get images;
  static Serializer<GUpdateProductDto> get serializer =>
      _$gUpdateProductDtoSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateProductDto.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUpdateProductDto? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateProductDto.serializer,
        json,
      );
}

abstract class GUpdateUserDto
    implements Built<GUpdateUserDto, GUpdateUserDtoBuilder> {
  GUpdateUserDto._();

  factory GUpdateUserDto([void Function(GUpdateUserDtoBuilder b) updates]) =
      _$GUpdateUserDto;

  String? get email;
  String? get name;
  String? get password;
  GRole? get role;
  String? get avatar;
  static Serializer<GUpdateUserDto> get serializer =>
      _$gUpdateUserDtoSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateUserDto.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUpdateUserDto? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateUserDto.serializer,
        json,
      );
}

const Map<String, Set<String>> possibleTypesMap = {};
