// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_category_by_id.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GgetCategoryByIdData> _$ggetCategoryByIdDataSerializer =
    new _$GgetCategoryByIdDataSerializer();
Serializer<GgetCategoryByIdData_category>
    _$ggetCategoryByIdDataCategorySerializer =
    new _$GgetCategoryByIdData_categorySerializer();
Serializer<GgetCategoryByIdData_category_products>
    _$ggetCategoryByIdDataCategoryProductsSerializer =
    new _$GgetCategoryByIdData_category_productsSerializer();

class _$GgetCategoryByIdDataSerializer
    implements StructuredSerializer<GgetCategoryByIdData> {
  @override
  final Iterable<Type> types = const [
    GgetCategoryByIdData,
    _$GgetCategoryByIdData
  ];
  @override
  final String wireName = 'GgetCategoryByIdData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GgetCategoryByIdData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'category',
      serializers.serialize(object.category,
          specifiedType: const FullType(GgetCategoryByIdData_category)),
    ];

    return result;
  }

  @override
  GgetCategoryByIdData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GgetCategoryByIdDataBuilder();

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
        case 'category':
          result.category.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GgetCategoryByIdData_category))!
              as GgetCategoryByIdData_category);
          break;
      }
    }

    return result.build();
  }
}

class _$GgetCategoryByIdData_categorySerializer
    implements StructuredSerializer<GgetCategoryByIdData_category> {
  @override
  final Iterable<Type> types = const [
    GgetCategoryByIdData_category,
    _$GgetCategoryByIdData_category
  ];
  @override
  final String wireName = 'GgetCategoryByIdData_category';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GgetCategoryByIdData_category object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'image',
      serializers.serialize(object.image,
          specifiedType: const FullType(String)),
      'products',
      serializers.serialize(object.products,
          specifiedType: const FullType(BuiltList,
              const [const FullType(GgetCategoryByIdData_category_products)])),
    ];

    return result;
  }

  @override
  GgetCategoryByIdData_category deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GgetCategoryByIdData_categoryBuilder();

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
        case 'image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'products':
          result.products.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GgetCategoryByIdData_category_products)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GgetCategoryByIdData_category_productsSerializer
    implements StructuredSerializer<GgetCategoryByIdData_category_products> {
  @override
  final Iterable<Type> types = const [
    GgetCategoryByIdData_category_products,
    _$GgetCategoryByIdData_category_products
  ];
  @override
  final String wireName = 'GgetCategoryByIdData_category_products';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GgetCategoryByIdData_category_products object,
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
  GgetCategoryByIdData_category_products deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GgetCategoryByIdData_category_productsBuilder();

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

class _$GgetCategoryByIdData extends GgetCategoryByIdData {
  @override
  final String G__typename;
  @override
  final GgetCategoryByIdData_category category;

  factory _$GgetCategoryByIdData(
          [void Function(GgetCategoryByIdDataBuilder)? updates]) =>
      (new GgetCategoryByIdDataBuilder()..update(updates))._build();

  _$GgetCategoryByIdData._({required this.G__typename, required this.category})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GgetCategoryByIdData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        category, r'GgetCategoryByIdData', 'category');
  }

  @override
  GgetCategoryByIdData rebuild(
          void Function(GgetCategoryByIdDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GgetCategoryByIdDataBuilder toBuilder() =>
      new GgetCategoryByIdDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GgetCategoryByIdData &&
        G__typename == other.G__typename &&
        category == other.category;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, category.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GgetCategoryByIdData')
          ..add('G__typename', G__typename)
          ..add('category', category))
        .toString();
  }
}

class GgetCategoryByIdDataBuilder
    implements Builder<GgetCategoryByIdData, GgetCategoryByIdDataBuilder> {
  _$GgetCategoryByIdData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GgetCategoryByIdData_categoryBuilder? _category;
  GgetCategoryByIdData_categoryBuilder get category =>
      _$this._category ??= new GgetCategoryByIdData_categoryBuilder();
  set category(GgetCategoryByIdData_categoryBuilder? category) =>
      _$this._category = category;

  GgetCategoryByIdDataBuilder() {
    GgetCategoryByIdData._initializeBuilder(this);
  }

  GgetCategoryByIdDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _category = $v.category.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GgetCategoryByIdData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GgetCategoryByIdData;
  }

  @override
  void update(void Function(GgetCategoryByIdDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GgetCategoryByIdData build() => _build();

  _$GgetCategoryByIdData _build() {
    _$GgetCategoryByIdData _$result;
    try {
      _$result = _$v ??
          new _$GgetCategoryByIdData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GgetCategoryByIdData', 'G__typename'),
              category: category.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'category';
        category.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GgetCategoryByIdData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GgetCategoryByIdData_category extends GgetCategoryByIdData_category {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;
  @override
  final String image;
  @override
  final BuiltList<GgetCategoryByIdData_category_products> products;

  factory _$GgetCategoryByIdData_category(
          [void Function(GgetCategoryByIdData_categoryBuilder)? updates]) =>
      (new GgetCategoryByIdData_categoryBuilder()..update(updates))._build();

  _$GgetCategoryByIdData_category._(
      {required this.G__typename,
      required this.id,
      required this.name,
      required this.image,
      required this.products})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GgetCategoryByIdData_category', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GgetCategoryByIdData_category', 'id');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GgetCategoryByIdData_category', 'name');
    BuiltValueNullFieldError.checkNotNull(
        image, r'GgetCategoryByIdData_category', 'image');
    BuiltValueNullFieldError.checkNotNull(
        products, r'GgetCategoryByIdData_category', 'products');
  }

  @override
  GgetCategoryByIdData_category rebuild(
          void Function(GgetCategoryByIdData_categoryBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GgetCategoryByIdData_categoryBuilder toBuilder() =>
      new GgetCategoryByIdData_categoryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GgetCategoryByIdData_category &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name &&
        image == other.image &&
        products == other.products;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, image.hashCode);
    _$hash = $jc(_$hash, products.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GgetCategoryByIdData_category')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name)
          ..add('image', image)
          ..add('products', products))
        .toString();
  }
}

class GgetCategoryByIdData_categoryBuilder
    implements
        Builder<GgetCategoryByIdData_category,
            GgetCategoryByIdData_categoryBuilder> {
  _$GgetCategoryByIdData_category? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  ListBuilder<GgetCategoryByIdData_category_products>? _products;
  ListBuilder<GgetCategoryByIdData_category_products> get products =>
      _$this._products ??=
          new ListBuilder<GgetCategoryByIdData_category_products>();
  set products(ListBuilder<GgetCategoryByIdData_category_products>? products) =>
      _$this._products = products;

  GgetCategoryByIdData_categoryBuilder() {
    GgetCategoryByIdData_category._initializeBuilder(this);
  }

  GgetCategoryByIdData_categoryBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _name = $v.name;
      _image = $v.image;
      _products = $v.products.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GgetCategoryByIdData_category other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GgetCategoryByIdData_category;
  }

  @override
  void update(void Function(GgetCategoryByIdData_categoryBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GgetCategoryByIdData_category build() => _build();

  _$GgetCategoryByIdData_category _build() {
    _$GgetCategoryByIdData_category _$result;
    try {
      _$result = _$v ??
          new _$GgetCategoryByIdData_category._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GgetCategoryByIdData_category', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GgetCategoryByIdData_category', 'id'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'GgetCategoryByIdData_category', 'name'),
              image: BuiltValueNullFieldError.checkNotNull(
                  image, r'GgetCategoryByIdData_category', 'image'),
              products: products.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'products';
        products.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GgetCategoryByIdData_category', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GgetCategoryByIdData_category_products
    extends GgetCategoryByIdData_category_products {
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
  final BuiltList<String> images;
  @override
  final _i2.GDateTime creationAt;
  @override
  final _i2.GDateTime updatedAt;

  factory _$GgetCategoryByIdData_category_products(
          [void Function(GgetCategoryByIdData_category_productsBuilder)?
              updates]) =>
      (new GgetCategoryByIdData_category_productsBuilder()..update(updates))
          ._build();

  _$GgetCategoryByIdData_category_products._(
      {required this.G__typename,
      required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.images,
      required this.creationAt,
      required this.updatedAt})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GgetCategoryByIdData_category_products', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GgetCategoryByIdData_category_products', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'GgetCategoryByIdData_category_products', 'title');
    BuiltValueNullFieldError.checkNotNull(
        price, r'GgetCategoryByIdData_category_products', 'price');
    BuiltValueNullFieldError.checkNotNull(
        description, r'GgetCategoryByIdData_category_products', 'description');
    BuiltValueNullFieldError.checkNotNull(
        images, r'GgetCategoryByIdData_category_products', 'images');
    BuiltValueNullFieldError.checkNotNull(
        creationAt, r'GgetCategoryByIdData_category_products', 'creationAt');
    BuiltValueNullFieldError.checkNotNull(
        updatedAt, r'GgetCategoryByIdData_category_products', 'updatedAt');
  }

  @override
  GgetCategoryByIdData_category_products rebuild(
          void Function(GgetCategoryByIdData_category_productsBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GgetCategoryByIdData_category_productsBuilder toBuilder() =>
      new GgetCategoryByIdData_category_productsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GgetCategoryByIdData_category_products &&
        G__typename == other.G__typename &&
        id == other.id &&
        title == other.title &&
        price == other.price &&
        description == other.description &&
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
    _$hash = $jc(_$hash, images.hashCode);
    _$hash = $jc(_$hash, creationAt.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GgetCategoryByIdData_category_products')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('title', title)
          ..add('price', price)
          ..add('description', description)
          ..add('images', images)
          ..add('creationAt', creationAt)
          ..add('updatedAt', updatedAt))
        .toString();
  }
}

class GgetCategoryByIdData_category_productsBuilder
    implements
        Builder<GgetCategoryByIdData_category_products,
            GgetCategoryByIdData_category_productsBuilder> {
  _$GgetCategoryByIdData_category_products? _$v;

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

  GgetCategoryByIdData_category_productsBuilder() {
    GgetCategoryByIdData_category_products._initializeBuilder(this);
  }

  GgetCategoryByIdData_category_productsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _title = $v.title;
      _price = $v.price;
      _description = $v.description;
      _images = $v.images.toBuilder();
      _creationAt = $v.creationAt.toBuilder();
      _updatedAt = $v.updatedAt.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GgetCategoryByIdData_category_products other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GgetCategoryByIdData_category_products;
  }

  @override
  void update(
      void Function(GgetCategoryByIdData_category_productsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GgetCategoryByIdData_category_products build() => _build();

  _$GgetCategoryByIdData_category_products _build() {
    _$GgetCategoryByIdData_category_products _$result;
    try {
      _$result = _$v ??
          new _$GgetCategoryByIdData_category_products._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GgetCategoryByIdData_category_products', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GgetCategoryByIdData_category_products', 'id'),
              title: BuiltValueNullFieldError.checkNotNull(
                  title, r'GgetCategoryByIdData_category_products', 'title'),
              price: BuiltValueNullFieldError.checkNotNull(
                  price, r'GgetCategoryByIdData_category_products', 'price'),
              description: BuiltValueNullFieldError.checkNotNull(description,
                  r'GgetCategoryByIdData_category_products', 'description'),
              images: images.build(),
              creationAt: creationAt.build(),
              updatedAt: updatedAt.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'images';
        images.build();
        _$failedField = 'creationAt';
        creationAt.build();
        _$failedField = 'updatedAt';
        updatedAt.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GgetCategoryByIdData_category_products',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
