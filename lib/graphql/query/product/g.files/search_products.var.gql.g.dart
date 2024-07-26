// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_products.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GsearchProductsVars> _$gsearchProductsVarsSerializer =
    new _$GsearchProductsVarsSerializer();

class _$GsearchProductsVarsSerializer
    implements StructuredSerializer<GsearchProductsVars> {
  @override
  final Iterable<Type> types = const [
    GsearchProductsVars,
    _$GsearchProductsVars
  ];
  @override
  final String wireName = 'GsearchProductsVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GsearchProductsVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.price_min;
    if (value != null) {
      result
        ..add('price_min')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.price_max;
    if (value != null) {
      result
        ..add('price_max')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.categoryId;
    if (value != null) {
      result
        ..add('categoryId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.limit;
    if (value != null) {
      result
        ..add('limit')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.offset;
    if (value != null) {
      result
        ..add('offset')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  GsearchProductsVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GsearchProductsVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'price_min':
          result.price_min = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'price_max':
          result.price_max = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'categoryId':
          result.categoryId = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'limit':
          result.limit = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'offset':
          result.offset = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$GsearchProductsVars extends GsearchProductsVars {
  @override
  final String? title;
  @override
  final int? price_min;
  @override
  final int? price_max;
  @override
  final double? categoryId;
  @override
  final int? limit;
  @override
  final int? offset;

  factory _$GsearchProductsVars(
          [void Function(GsearchProductsVarsBuilder)? updates]) =>
      (new GsearchProductsVarsBuilder()..update(updates))._build();

  _$GsearchProductsVars._(
      {this.title,
      this.price_min,
      this.price_max,
      this.categoryId,
      this.limit,
      this.offset})
      : super._();

  @override
  GsearchProductsVars rebuild(
          void Function(GsearchProductsVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GsearchProductsVarsBuilder toBuilder() =>
      new GsearchProductsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GsearchProductsVars &&
        title == other.title &&
        price_min == other.price_min &&
        price_max == other.price_max &&
        categoryId == other.categoryId &&
        limit == other.limit &&
        offset == other.offset;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, price_min.hashCode);
    _$hash = $jc(_$hash, price_max.hashCode);
    _$hash = $jc(_$hash, categoryId.hashCode);
    _$hash = $jc(_$hash, limit.hashCode);
    _$hash = $jc(_$hash, offset.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GsearchProductsVars')
          ..add('title', title)
          ..add('price_min', price_min)
          ..add('price_max', price_max)
          ..add('categoryId', categoryId)
          ..add('limit', limit)
          ..add('offset', offset))
        .toString();
  }
}

class GsearchProductsVarsBuilder
    implements Builder<GsearchProductsVars, GsearchProductsVarsBuilder> {
  _$GsearchProductsVars? _$v;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  int? _price_min;
  int? get price_min => _$this._price_min;
  set price_min(int? price_min) => _$this._price_min = price_min;

  int? _price_max;
  int? get price_max => _$this._price_max;
  set price_max(int? price_max) => _$this._price_max = price_max;

  double? _categoryId;
  double? get categoryId => _$this._categoryId;
  set categoryId(double? categoryId) => _$this._categoryId = categoryId;

  int? _limit;
  int? get limit => _$this._limit;
  set limit(int? limit) => _$this._limit = limit;

  int? _offset;
  int? get offset => _$this._offset;
  set offset(int? offset) => _$this._offset = offset;

  GsearchProductsVarsBuilder();

  GsearchProductsVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _price_min = $v.price_min;
      _price_max = $v.price_max;
      _categoryId = $v.categoryId;
      _limit = $v.limit;
      _offset = $v.offset;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GsearchProductsVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GsearchProductsVars;
  }

  @override
  void update(void Function(GsearchProductsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GsearchProductsVars build() => _build();

  _$GsearchProductsVars _build() {
    final _$result = _$v ??
        new _$GsearchProductsVars._(
            title: title,
            price_min: price_min,
            price_max: price_max,
            categoryId: categoryId,
            limit: limit,
            offset: offset);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
