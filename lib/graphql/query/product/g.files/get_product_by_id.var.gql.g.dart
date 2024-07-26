// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_product_by_id.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GgetProductDetailsVars> _$ggetProductDetailsVarsSerializer =
    new _$GgetProductDetailsVarsSerializer();

class _$GgetProductDetailsVarsSerializer
    implements StructuredSerializer<GgetProductDetailsVars> {
  @override
  final Iterable<Type> types = const [
    GgetProductDetailsVars,
    _$GgetProductDetailsVars
  ];
  @override
  final String wireName = 'GgetProductDetailsVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GgetProductDetailsVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GgetProductDetailsVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GgetProductDetailsVarsBuilder();

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

class _$GgetProductDetailsVars extends GgetProductDetailsVars {
  @override
  final String id;

  factory _$GgetProductDetailsVars(
          [void Function(GgetProductDetailsVarsBuilder)? updates]) =>
      (new GgetProductDetailsVarsBuilder()..update(updates))._build();

  _$GgetProductDetailsVars._({required this.id}) : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'GgetProductDetailsVars', 'id');
  }

  @override
  GgetProductDetailsVars rebuild(
          void Function(GgetProductDetailsVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GgetProductDetailsVarsBuilder toBuilder() =>
      new GgetProductDetailsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GgetProductDetailsVars && id == other.id;
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
    return (newBuiltValueToStringHelper(r'GgetProductDetailsVars')
          ..add('id', id))
        .toString();
  }
}

class GgetProductDetailsVarsBuilder
    implements Builder<GgetProductDetailsVars, GgetProductDetailsVarsBuilder> {
  _$GgetProductDetailsVars? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  GgetProductDetailsVarsBuilder();

  GgetProductDetailsVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GgetProductDetailsVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GgetProductDetailsVars;
  }

  @override
  void update(void Function(GgetProductDetailsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GgetProductDetailsVars build() => _build();

  _$GgetProductDetailsVars _build() {
    final _$result = _$v ??
        new _$GgetProductDetailsVars._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GgetProductDetailsVars', 'id'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
