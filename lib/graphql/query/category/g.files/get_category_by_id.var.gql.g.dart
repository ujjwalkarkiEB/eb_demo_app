// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_category_by_id.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GgetCategoryByIdVars> _$ggetCategoryByIdVarsSerializer =
    new _$GgetCategoryByIdVarsSerializer();

class _$GgetCategoryByIdVarsSerializer
    implements StructuredSerializer<GgetCategoryByIdVars> {
  @override
  final Iterable<Type> types = const [
    GgetCategoryByIdVars,
    _$GgetCategoryByIdVars
  ];
  @override
  final String wireName = 'GgetCategoryByIdVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GgetCategoryByIdVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GgetCategoryByIdVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GgetCategoryByIdVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GgetCategoryByIdVars extends GgetCategoryByIdVars {
  @override
  final String id;

  factory _$GgetCategoryByIdVars(
          [void Function(GgetCategoryByIdVarsBuilder)? updates]) =>
      (new GgetCategoryByIdVarsBuilder()..update(updates))._build();

  _$GgetCategoryByIdVars._({required this.id}) : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'GgetCategoryByIdVars', 'id');
  }

  @override
  GgetCategoryByIdVars rebuild(
          void Function(GgetCategoryByIdVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GgetCategoryByIdVarsBuilder toBuilder() =>
      new GgetCategoryByIdVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GgetCategoryByIdVars && id == other.id;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GgetCategoryByIdVars')..add('id', id))
        .toString();
  }
}

class GgetCategoryByIdVarsBuilder
    implements Builder<GgetCategoryByIdVars, GgetCategoryByIdVarsBuilder> {
  _$GgetCategoryByIdVars? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  GgetCategoryByIdVarsBuilder();

  GgetCategoryByIdVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GgetCategoryByIdVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GgetCategoryByIdVars;
  }

  @override
  void update(void Function(GgetCategoryByIdVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GgetCategoryByIdVars build() => _build();

  _$GgetCategoryByIdVars _build() {
    final _$result = _$v ??
        new _$GgetCategoryByIdVars._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GgetCategoryByIdVars', 'id'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
