// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_category_by_id.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GgetProductDetailsData> _$ggetProductDetailsDataSerializer =
    new _$GgetProductDetailsDataSerializer();
Serializer<GgetProductDetailsData_product>
    _$ggetProductDetailsDataProductSerializer =
    new _$GgetProductDetailsData_productSerializer();
Serializer<GgetProductDetailsData_product_category>
    _$ggetProductDetailsDataProductCategorySerializer =
    new _$GgetProductDetailsData_product_categorySerializer();

class _$GgetProductDetailsDataSerializer
    implements StructuredSerializer<GgetProductDetailsData> {
  @override
  final Iterable<Type> types = const [
    GgetProductDetailsData,
    _$GgetProductDetailsData
  ];
  @override
  final String wireName = 'GgetProductDetailsData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GgetProductDetailsData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'product',
      serializers.serialize(object.product,
          specifiedType: const FullType(GgetProductDetailsData_product)),
    ];

    return result;
  }

  @override
  GgetProductDetailsData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GgetProductDetailsDataBuilder();

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
        case 'product':
          result.product.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GgetProductDetailsData_product))!
              as GgetProductDetailsData_product);
          break;
      }
    }

    return result.build();
  }
}

class _$GgetProductDetailsData_productSerializer
    implements StructuredSerializer<GgetProductDetailsData_product> {
  @override
  final Iterable<Type> types = const [
    GgetProductDetailsData_product,
    _$GgetProductDetailsData_product
  ];
  @override
  final String wireName = 'GgetProductDetailsData_product';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GgetProductDetailsData_product object,
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
      'description',
      serializers.serialize(object.description,
          specifiedType: const FullType(String)),
      'category',
      serializers.serialize(object.category,
          specifiedType:
              const FullType(GgetProductDetailsData_product_category)),
      'images',
      serializers.serialize(object.images,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'creationAt',
      serializers.serialize(object.creationAt,
          specifiedType: const FullType(_i2.GDateTime)),
      'updatedAt',
      serializers.serialize(object.updatedAt,
          specifiedType: const FullType(_i2.GDateTime)),
    ];

    return result;
  }

  @override
  GgetProductDetailsData_product deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GgetProductDetailsData_productBuilder();

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
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'category':
          result.category.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GgetProductDetailsData_product_category))!
              as GgetProductDetailsData_product_category);
          break;
        case 'images':
          result.images.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'creationAt':
          result.creationAt.replace(serializers.deserialize(value,
              specifiedType: const FullType(_i2.GDateTime))! as _i2.GDateTime);
          break;
        case 'updatedAt':
          result.updatedAt.replace(serializers.deserialize(value,
              specifiedType: const FullType(_i2.GDateTime))! as _i2.GDateTime);
          break;
      }
    }

    return result.build();
  }
}

class _$GgetProductDetailsData_product_categorySerializer
    implements StructuredSerializer<GgetProductDetailsData_product_category> {
  @override
  final Iterable<Type> types = const [
    GgetProductDetailsData_product_category,
    _$GgetProductDetailsData_product_category
  ];
  @override
  final String wireName = 'GgetProductDetailsData_product_category';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GgetProductDetailsData_product_category object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GgetProductDetailsData_product_category deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GgetProductDetailsData_product_categoryBuilder();

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
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GgetProductDetailsData extends GgetProductDetailsData {
  @override
  final String G__typename;
  @override
  final GgetProductDetailsData_product product;

  factory _$GgetProductDetailsData(
          [void Function(GgetProductDetailsDataBuilder)? updates]) =>
      (new GgetProductDetailsDataBuilder()..update(updates))._build();

  _$GgetProductDetailsData._({required this.G__typename, required this.product})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GgetProductDetailsData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        product, r'GgetProductDetailsData', 'product');
  }

  @override
  GgetProductDetailsData rebuild(
          void Function(GgetProductDetailsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GgetProductDetailsDataBuilder toBuilder() =>
      new GgetProductDetailsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GgetProductDetailsData &&
        G__typename == other.G__typename &&
        product == other.product;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, product.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GgetProductDetailsData')
          ..add('G__typename', G__typename)
          ..add('product', product))
        .toString();
  }
}

class GgetProductDetailsDataBuilder
    implements Builder<GgetProductDetailsData, GgetProductDetailsDataBuilder> {
  _$GgetProductDetailsData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GgetProductDetailsData_productBuilder? _product;
  GgetProductDetailsData_productBuilder get product =>
      _$this._product ??= new GgetProductDetailsData_productBuilder();
  set product(GgetProductDetailsData_productBuilder? product) =>
      _$this._product = product;

  GgetProductDetailsDataBuilder() {
    GgetProductDetailsData._initializeBuilder(this);
  }

  GgetProductDetailsDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _product = $v.product.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GgetProductDetailsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GgetProductDetailsData;
  }

  @override
  void update(void Function(GgetProductDetailsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GgetProductDetailsData build() => _build();

  _$GgetProductDetailsData _build() {
    _$GgetProductDetailsData _$result;
    try {
      _$result = _$v ??
          new _$GgetProductDetailsData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GgetProductDetailsData', 'G__typename'),
              product: product.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'product';
        product.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GgetProductDetailsData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GgetProductDetailsData_product extends GgetProductDetailsData_product {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String title;
  @override
  final double price;
  @override
  final String description;
  @override
  final GgetProductDetailsData_product_category category;
  @override
  final BuiltList<String> images;
  @override
  final _i2.GDateTime creationAt;
  @override
  final _i2.GDateTime updatedAt;

  factory _$GgetProductDetailsData_product(
          [void Function(GgetProductDetailsData_productBuilder)? updates]) =>
      (new GgetProductDetailsData_productBuilder()..update(updates))._build();

  _$GgetProductDetailsData_product._(
      {required this.G__typename,
      required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.category,
      required this.images,
      required this.creationAt,
      required this.updatedAt})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GgetProductDetailsData_product', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GgetProductDetailsData_product', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'GgetProductDetailsData_product', 'title');
    BuiltValueNullFieldError.checkNotNull(
        price, r'GgetProductDetailsData_product', 'price');
    BuiltValueNullFieldError.checkNotNull(
        description, r'GgetProductDetailsData_product', 'description');
    BuiltValueNullFieldError.checkNotNull(
        category, r'GgetProductDetailsData_product', 'category');
    BuiltValueNullFieldError.checkNotNull(
        images, r'GgetProductDetailsData_product', 'images');
    BuiltValueNullFieldError.checkNotNull(
        creationAt, r'GgetProductDetailsData_product', 'creationAt');
    BuiltValueNullFieldError.checkNotNull(
        updatedAt, r'GgetProductDetailsData_product', 'updatedAt');
  }

  @override
  GgetProductDetailsData_product rebuild(
          void Function(GgetProductDetailsData_productBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GgetProductDetailsData_productBuilder toBuilder() =>
      new GgetProductDetailsData_productBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GgetProductDetailsData_product &&
        G__typename == other.G__typename &&
        id == other.id &&
        title == other.title &&
        price == other.price &&
        description == other.description &&
        category == other.category &&
        images == other.images &&
        creationAt == other.creationAt &&
        updatedAt == other.updatedAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, price.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, category.hashCode);
    _$hash = $jc(_$hash, images.hashCode);
    _$hash = $jc(_$hash, creationAt.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GgetProductDetailsData_product')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('title', title)
          ..add('price', price)
          ..add('description', description)
          ..add('category', category)
          ..add('images', images)
          ..add('creationAt', creationAt)
          ..add('updatedAt', updatedAt))
        .toString();
  }
}

class GgetProductDetailsData_productBuilder
    implements
        Builder<GgetProductDetailsData_product,
            GgetProductDetailsData_productBuilder> {
  _$GgetProductDetailsData_product? _$v;

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

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  GgetProductDetailsData_product_categoryBuilder? _category;
  GgetProductDetailsData_product_categoryBuilder get category =>
      _$this._category ??= new GgetProductDetailsData_product_categoryBuilder();
  set category(GgetProductDetailsData_product_categoryBuilder? category) =>
      _$this._category = category;

  ListBuilder<String>? _images;
  ListBuilder<String> get images =>
      _$this._images ??= new ListBuilder<String>();
  set images(ListBuilder<String>? images) => _$this._images = images;

  _i2.GDateTimeBuilder? _creationAt;
  _i2.GDateTimeBuilder get creationAt =>
      _$this._creationAt ??= new _i2.GDateTimeBuilder();
  set creationAt(_i2.GDateTimeBuilder? creationAt) =>
      _$this._creationAt = creationAt;

  _i2.GDateTimeBuilder? _updatedAt;
  _i2.GDateTimeBuilder get updatedAt =>
      _$this._updatedAt ??= new _i2.GDateTimeBuilder();
  set updatedAt(_i2.GDateTimeBuilder? updatedAt) =>
      _$this._updatedAt = updatedAt;

  GgetProductDetailsData_productBuilder() {
    GgetProductDetailsData_product._initializeBuilder(this);
  }

  GgetProductDetailsData_productBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _title = $v.title;
      _price = $v.price;
      _description = $v.description;
      _category = $v.category.toBuilder();
      _images = $v.images.toBuilder();
      _creationAt = $v.creationAt.toBuilder();
      _updatedAt = $v.updatedAt.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GgetProductDetailsData_product other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GgetProductDetailsData_product;
  }

  @override
  void update(void Function(GgetProductDetailsData_productBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GgetProductDetailsData_product build() => _build();

  _$GgetProductDetailsData_product _build() {
    _$GgetProductDetailsData_product _$result;
    try {
      _$result = _$v ??
          new _$GgetProductDetailsData_product._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GgetProductDetailsData_product', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GgetProductDetailsData_product', 'id'),
              title: BuiltValueNullFieldError.checkNotNull(
                  title, r'GgetProductDetailsData_product', 'title'),
              price: BuiltValueNullFieldError.checkNotNull(
                  price, r'GgetProductDetailsData_product', 'price'),
              description: BuiltValueNullFieldError.checkNotNull(description,
                  r'GgetProductDetailsData_product', 'description'),
              category: category.build(),
              images: images.build(),
              creationAt: creationAt.build(),
              updatedAt: updatedAt.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'category';
        category.build();
        _$failedField = 'images';
        images.build();
        _$failedField = 'creationAt';
        creationAt.build();
        _$failedField = 'updatedAt';
        updatedAt.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GgetProductDetailsData_product', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GgetProductDetailsData_product_category
    extends GgetProductDetailsData_product_category {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;

  factory _$GgetProductDetailsData_product_category(
          [void Function(GgetProductDetailsData_product_categoryBuilder)?
              updates]) =>
      (new GgetProductDetailsData_product_categoryBuilder()..update(updates))
          ._build();

  _$GgetProductDetailsData_product_category._(
      {required this.G__typename, required this.id, required this.name})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GgetProductDetailsData_product_category', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GgetProductDetailsData_product_category', 'id');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GgetProductDetailsData_product_category', 'name');
  }

  @override
  GgetProductDetailsData_product_category rebuild(
          void Function(GgetProductDetailsData_product_categoryBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GgetProductDetailsData_product_categoryBuilder toBuilder() =>
      new GgetProductDetailsData_product_categoryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GgetProductDetailsData_product_category &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GgetProductDetailsData_product_category')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class GgetProductDetailsData_product_categoryBuilder
    implements
        Builder<GgetProductDetailsData_product_category,
            GgetProductDetailsData_product_categoryBuilder> {
  _$GgetProductDetailsData_product_category? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  GgetProductDetailsData_product_categoryBuilder() {
    GgetProductDetailsData_product_category._initializeBuilder(this);
  }

  GgetProductDetailsData_product_categoryBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GgetProductDetailsData_product_category other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GgetProductDetailsData_product_category;
  }

  @override
  void update(
      void Function(GgetProductDetailsData_product_categoryBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GgetProductDetailsData_product_category build() => _build();

  _$GgetProductDetailsData_product_category _build() {
    final _$result = _$v ??
        new _$GgetProductDetailsData_product_category._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GgetProductDetailsData_product_category', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GgetProductDetailsData_product_category', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'GgetProductDetailsData_product_category', 'name'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
