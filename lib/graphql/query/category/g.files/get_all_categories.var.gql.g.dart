// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_categories.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GgetAllCategoriesVars> _$ggetAllCategoriesVarsSerializer =
    new _$GgetAllCategoriesVarsSerializer();

class _$GgetAllCategoriesVarsSerializer
    implements StructuredSerializer<GgetAllCategoriesVars> {
  @override
  final Iterable<Type> types = const [
    GgetAllCategoriesVars,
    _$GgetAllCategoriesVars
  ];
  @override
  final String wireName = 'GgetAllCategoriesVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GgetAllCategoriesVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GgetAllCategoriesVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GgetAllCategoriesVarsBuilder().build();
  }
}

class _$GgetAllCategoriesVars extends GgetAllCategoriesVars {
  factory _$GgetAllCategoriesVars(
          [void Function(GgetAllCategoriesVarsBuilder)? updates]) =>
      (new GgetAllCategoriesVarsBuilder()..update(updates))._build();

  _$GgetAllCategoriesVars._() : super._();

  @override
  GgetAllCategoriesVars rebuild(
          void Function(GgetAllCategoriesVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GgetAllCategoriesVarsBuilder toBuilder() =>
      new GgetAllCategoriesVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GgetAllCategoriesVars;
  }

  @override
  int get hashCode {
    return 305203240;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GgetAllCategoriesVars').toString();
  }
}

class GgetAllCategoriesVarsBuilder
    implements Builder<GgetAllCategoriesVars, GgetAllCategoriesVarsBuilder> {
  _$GgetAllCategoriesVars? _$v;

  GgetAllCategoriesVarsBuilder();

  @override
  void replace(GgetAllCategoriesVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GgetAllCategoriesVars;
  }

  @override
  void update(void Function(GgetAllCategoriesVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GgetAllCategoriesVars build() => _build();

  _$GgetAllCategoriesVars _build() {
    final _$result = _$v ?? new _$GgetAllCategoriesVars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
