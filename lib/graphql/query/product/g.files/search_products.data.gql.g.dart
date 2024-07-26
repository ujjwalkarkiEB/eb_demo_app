// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_products.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GsearchProductsData> _$gsearchProductsDataSerializer =
    new _$GsearchProductsDataSerializer();
Serializer<GsearchProductsData_products>
    _$gsearchProductsDataProductsSerializer =
    new _$GsearchProductsData_productsSerializer();

class _$GsearchProductsDataSerializer
    implements StructuredSerializer<GsearchProductsData> {
  @override
  final Iterable<Type> types = const [
    GsearchProductsData,
    _$GsearchProductsData
  ];
  @override
  final String wireName = 'GsearchProductsData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GsearchProductsData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'products',
      serializers.serialize(object.products,
          specifiedType: const FullType(
              BuiltList, const [const FullType(GsearchProductsData_products)])),
    ];

    return result;
  }

  @override
  GsearchProductsData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GsearchProductsDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'products':
          result.products.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GsearchProductsData_products)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GsearchProductsData_productsSerializer
    implements StructuredSerializer<GsearchProductsData_products> {
  @override
  final Iterable<Type> types = const [
    GsearchProductsData_products,
    _$GsearchProductsData_products
  ];
  @override
  final String wireName = 'GsearchProductsData_products';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GsearchProductsData_products object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'price',
      serializers.serialize(object.price,
          specifiedType: const FullType(double)),
      'images',
      serializers.serialize(object.images,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
    ];

    return result;
  }

  @override
  GsearchProductsData_products deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GsearchProductsData_productsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'price':
          result.price = serializers.deserialize(value,
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

class _$GsearchProductsData extends GsearchProductsData {
  @override
  final String G__typename;
  @override
  final BuiltList<GsearchProductsData_products> products;

  factory _$GsearchProductsData(
          [void Function(GsearchProductsDataBuilder)? updates]) =>
      (new GsearchProductsDataBuilder()..update(updates))._build();

  _$GsearchProductsData._({required this.G__typename, required this.products})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GsearchProductsData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        products, r'GsearchProductsData', 'products');
  }

  @override
  GsearchProductsData rebuild(
          void Function(GsearchProductsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GsearchProductsDataBuilder toBuilder() =>
      new GsearchProductsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GsearchProductsData &&
        G__typename == other.G__typename &&
        products == other.products;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, products.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GsearchProductsData')
          ..add('G__typename', G__typename)
          ..add('products', products))
        .toString();
  }
}

class GsearchProductsDataBuilder
    implements Builder<GsearchProductsData, GsearchProductsDataBuilder> {
  _$GsearchProductsData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GsearchProductsData_products>? _products;
  ListBuilder<GsearchProductsData_products> get products =>
      _$this._products ??= new ListBuilder<GsearchProductsData_products>();
  set products(ListBuilder<GsearchProductsData_products>? products) =>
      _$this._products = products;

  GsearchProductsDataBuilder() {
    GsearchProductsData._initializeBuilder(this);
  }

  GsearchProductsDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _products = $v.products.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GsearchProductsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GsearchProductsData;
  }

  @override
  void update(void Function(GsearchProductsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GsearchProductsData build() => _build();

  _$GsearchProductsData _build() {
    _$GsearchProductsData _$result;
    try {
      _$result = _$v ??
          new _$GsearchProductsData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GsearchProductsData', 'G__typename'),
              products: products.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'products';
        products.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GsearchProductsData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GsearchProductsData_products extends GsearchProductsData_products {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String title;
  @override
  final double price;
  @override
  final BuiltList<String> images;

  factory _$GsearchProductsData_products(
          [void Function(GsearchProductsData_productsBuilder)? updates]) =>
      (new GsearchProductsData_productsBuilder()..update(updates))._build();

  _$GsearchProductsData_products._(
      {required this.G__typename,
      required this.id,
      required this.title,
      required this.price,
      required this.images})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GsearchProductsData_products', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GsearchProductsData_products', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'GsearchProductsData_products', 'title');
    BuiltValueNullFieldError.checkNotNull(
        price, r'GsearchProductsData_products', 'price');
    BuiltValueNullFieldError.checkNotNull(
        images, r'GsearchProductsData_products', 'images');
  }

  @override
  GsearchProductsData_products rebuild(
          void Function(GsearchProductsData_productsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GsearchProductsData_productsBuilder toBuilder() =>
      new GsearchProductsData_productsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GsearchProductsData_products &&
        G__typename == other.G__typename &&
        id == other.id &&
        title == other.title &&
        price == other.price &&
        images == other.images;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, price.hashCode);
    _$hash = $jc(_$hash, images.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GsearchProductsData_products')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('title', title)
          ..add('price', price)
          ..add('images', images))
        .toString();
  }
}

class GsearchProductsData_productsBuilder
    implements
        Builder<GsearchProductsData_products,
            GsearchProductsData_productsBuilder> {
  _$GsearchProductsData_products? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  double? _price;
  double? get price => _$this._price;
  set price(double? price) => _$this._price = price;

  ListBuilder<String>? _images;
  ListBuilder<String> get images =>
      _$this._images ??= new ListBuilder<String>();
  set images(ListBuilder<String>? images) => _$this._images = images;

  GsearchProductsData_productsBuilder() {
    GsearchProductsData_products._initializeBuilder(this);
  }

  GsearchProductsData_productsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _title = $v.title;
      _price = $v.price;
      _images = $v.images.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GsearchProductsData_products other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GsearchProductsData_products;
  }

  @override
  void update(void Function(GsearchProductsData_productsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GsearchProductsData_products build() => _build();

  _$GsearchProductsData_products _build() {
    _$GsearchProductsData_products _$result;
    try {
      _$result = _$v ??
          new _$GsearchProductsData_products._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GsearchProductsData_products', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GsearchProductsData_products', 'id'),
              title: BuiltValueNullFieldError.checkNotNull(
                  title, r'GsearchProductsData_products', 'title'),
              price: BuiltValueNullFieldError.checkNotNull(
                  price, r'GsearchProductsData_products', 'price'),
              images: images.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'images';
        images.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GsearchProductsData_products', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
