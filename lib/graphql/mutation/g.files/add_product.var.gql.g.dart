// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_product.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GAddProductVars> _$gAddProductVarsSerializer =
    new _$GAddProductVarsSerializer();

class _$GAddProductVarsSerializer
    implements StructuredSerializer<GAddProductVars> {
  @override
  final Iterable<Type> types = const [GAddProductVars, _$GAddProductVars];
  @override
  final String wireName = 'GAddProductVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GAddProductVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'price',
      serializers.serialize(object.price,
          specifiedType: const FullType(double)),
      'description',
      serializers.serialize(object.description,
          specifiedType: const FullType(String)),
      'categoryId',
      serializers.serialize(object.categoryId,
          specifiedType: const FullType(double)),
      'images',
      serializers.serialize(object.images,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
    ];

    return result;
  }

  @override
  GAddProductVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GAddProductVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'price':
          result.price = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'categoryId':
          result.categoryId = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
        case 'images':
          result.images.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GAddProductVars extends GAddProductVars {
  @override
  final String title;
  @override
  final double price;
  @override
  final String description;
  @override
  final double categoryId;
  @override
  final BuiltList<String> images;

  factory _$GAddProductVars([void Function(GAddProductVarsBuilder)? updates]) =>
      (new GAddProductVarsBuilder()..update(updates))._build();

  _$GAddProductVars._(
      {required this.title,
      required this.price,
      required this.description,
      required this.categoryId,
      required this.images})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(title, r'GAddProductVars', 'title');
    BuiltValueNullFieldError.checkNotNull(price, r'GAddProductVars', 'price');
    BuiltValueNullFieldError.checkNotNull(
        description, r'GAddProductVars', 'description');
    BuiltValueNullFieldError.checkNotNull(
        categoryId, r'GAddProductVars', 'categoryId');
    BuiltValueNullFieldError.checkNotNull(images, r'GAddProductVars', 'images');
  }

  @override
  GAddProductVars rebuild(void Function(GAddProductVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAddProductVarsBuilder toBuilder() =>
      new GAddProductVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAddProductVars &&
        title == other.title &&
        price == other.price &&
        description == other.description &&
        categoryId == other.categoryId &&
        images == other.images;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, price.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, categoryId.hashCode);
    _$hash = $jc(_$hash, images.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GAddProductVars')
          ..add('title', title)
          ..add('price', price)
          ..add('description', description)
          ..add('categoryId', categoryId)
          ..add('images', images))
        .toString();
  }
}

class GAddProductVarsBuilder
    implements Builder<GAddProductVars, GAddProductVarsBuilder> {
  _$GAddProductVars? _$v;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  double? _price;
  double? get price => _$this._price;
  set price(double? price) => _$this._price = price;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  double? _categoryId;
  double? get categoryId => _$this._categoryId;
  set categoryId(double? categoryId) => _$this._categoryId = categoryId;

  ListBuilder<String>? _images;
  ListBuilder<String> get images =>
      _$this._images ??= new ListBuilder<String>();
  set images(ListBuilder<String>? images) => _$this._images = images;

  GAddProductVarsBuilder();

  GAddProductVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _price = $v.price;
      _description = $v.description;
      _categoryId = $v.categoryId;
      _images = $v.images.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GAddProductVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GAddProductVars;
  }

  @override
  void update(void Function(GAddProductVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GAddProductVars build() => _build();

  _$GAddProductVars _build() {
    _$GAddProductVars _$result;
    try {
      _$result = _$v ??
          new _$GAddProductVars._(
              title: BuiltValueNullFieldError.checkNotNull(
                  title, r'GAddProductVars', 'title'),
              price: BuiltValueNullFieldError.checkNotNull(
                  price, r'GAddProductVars', 'price'),
              description: BuiltValueNullFieldError.checkNotNull(
                  description, r'GAddProductVars', 'description'),
              categoryId: BuiltValueNullFieldError.checkNotNull(
                  categoryId, r'GAddProductVars', 'categoryId'),
              images: images.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'images';
        images.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GAddProductVars', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
