// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_product.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GAddProductData> _$gAddProductDataSerializer =
    new _$GAddProductDataSerializer();
Serializer<GAddProductData_addProduct> _$gAddProductDataAddProductSerializer =
    new _$GAddProductData_addProductSerializer();
Serializer<GAddProductData_addProduct_category>
    _$gAddProductDataAddProductCategorySerializer =
    new _$GAddProductData_addProduct_categorySerializer();

class _$GAddProductDataSerializer
    implements StructuredSerializer<GAddProductData> {
  @override
  final Iterable<Type> types = const [GAddProductData, _$GAddProductData];
  @override
  final String wireName = 'GAddProductData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GAddProductData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'addProduct',
      serializers.serialize(object.addProduct,
          specifiedType: const FullType(GAddProductData_addProduct)),
    ];

    return result;
  }

  @override
  GAddProductData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GAddProductDataBuilder();

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
        case 'addProduct':
          result.addProduct.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GAddProductData_addProduct))!
              as GAddProductData_addProduct);
          break;
      }
    }

    return result.build();
  }
}

class _$GAddProductData_addProductSerializer
    implements StructuredSerializer<GAddProductData_addProduct> {
  @override
  final Iterable<Type> types = const [
    GAddProductData_addProduct,
    _$GAddProductData_addProduct
  ];
  @override
  final String wireName = 'GAddProductData_addProduct';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GAddProductData_addProduct object,
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
      'category',
      serializers.serialize(object.category,
          specifiedType: const FullType(GAddProductData_addProduct_category)),
    ];

    return result;
  }

  @override
  GAddProductData_addProduct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GAddProductData_addProductBuilder();

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
        case 'category':
          result.category.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GAddProductData_addProduct_category))!
              as GAddProductData_addProduct_category);
          break;
      }
    }

    return result.build();
  }
}

class _$GAddProductData_addProduct_categorySerializer
    implements StructuredSerializer<GAddProductData_addProduct_category> {
  @override
  final Iterable<Type> types = const [
    GAddProductData_addProduct_category,
    _$GAddProductData_addProduct_category
  ];
  @override
  final String wireName = 'GAddProductData_addProduct_category';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GAddProductData_addProduct_category object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GAddProductData_addProduct_category deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GAddProductData_addProduct_categoryBuilder();

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
      }
    }

    return result.build();
  }
}

class _$GAddProductData extends GAddProductData {
  @override
  final String G__typename;
  @override
  final GAddProductData_addProduct addProduct;

  factory _$GAddProductData([void Function(GAddProductDataBuilder)? updates]) =>
      (new GAddProductDataBuilder()..update(updates))._build();

  _$GAddProductData._({required this.G__typename, required this.addProduct})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GAddProductData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        addProduct, r'GAddProductData', 'addProduct');
  }

  @override
  GAddProductData rebuild(void Function(GAddProductDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAddProductDataBuilder toBuilder() =>
      new GAddProductDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAddProductData &&
        G__typename == other.G__typename &&
        addProduct == other.addProduct;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, addProduct.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GAddProductData')
          ..add('G__typename', G__typename)
          ..add('addProduct', addProduct))
        .toString();
  }
}

class GAddProductDataBuilder
    implements Builder<GAddProductData, GAddProductDataBuilder> {
  _$GAddProductData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GAddProductData_addProductBuilder? _addProduct;
  GAddProductData_addProductBuilder get addProduct =>
      _$this._addProduct ??= new GAddProductData_addProductBuilder();
  set addProduct(GAddProductData_addProductBuilder? addProduct) =>
      _$this._addProduct = addProduct;

  GAddProductDataBuilder() {
    GAddProductData._initializeBuilder(this);
  }

  GAddProductDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _addProduct = $v.addProduct.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GAddProductData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GAddProductData;
  }

  @override
  void update(void Function(GAddProductDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GAddProductData build() => _build();

  _$GAddProductData _build() {
    _$GAddProductData _$result;
    try {
      _$result = _$v ??
          new _$GAddProductData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GAddProductData', 'G__typename'),
              addProduct: addProduct.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'addProduct';
        addProduct.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GAddProductData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GAddProductData_addProduct extends GAddProductData_addProduct {
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
  @override
  final GAddProductData_addProduct_category category;

  factory _$GAddProductData_addProduct(
          [void Function(GAddProductData_addProductBuilder)? updates]) =>
      (new GAddProductData_addProductBuilder()..update(updates))._build();

  _$GAddProductData_addProduct._(
      {required this.G__typename,
      required this.id,
      required this.title,
      required this.price,
      required this.images,
      required this.category})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GAddProductData_addProduct', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GAddProductData_addProduct', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'GAddProductData_addProduct', 'title');
    BuiltValueNullFieldError.checkNotNull(
        price, r'GAddProductData_addProduct', 'price');
    BuiltValueNullFieldError.checkNotNull(
        images, r'GAddProductData_addProduct', 'images');
    BuiltValueNullFieldError.checkNotNull(
        category, r'GAddProductData_addProduct', 'category');
  }

  @override
  GAddProductData_addProduct rebuild(
          void Function(GAddProductData_addProductBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAddProductData_addProductBuilder toBuilder() =>
      new GAddProductData_addProductBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAddProductData_addProduct &&
        G__typename == other.G__typename &&
        id == other.id &&
        title == other.title &&
        price == other.price &&
        images == other.images &&
        category == other.category;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, price.hashCode);
    _$hash = $jc(_$hash, images.hashCode);
    _$hash = $jc(_$hash, category.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GAddProductData_addProduct')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('title', title)
          ..add('price', price)
          ..add('images', images)
          ..add('category', category))
        .toString();
  }
}

class GAddProductData_addProductBuilder
    implements
        Builder<GAddProductData_addProduct, GAddProductData_addProductBuilder> {
  _$GAddProductData_addProduct? _$v;

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

  GAddProductData_addProduct_categoryBuilder? _category;
  GAddProductData_addProduct_categoryBuilder get category =>
      _$this._category ??= new GAddProductData_addProduct_categoryBuilder();
  set category(GAddProductData_addProduct_categoryBuilder? category) =>
      _$this._category = category;

  GAddProductData_addProductBuilder() {
    GAddProductData_addProduct._initializeBuilder(this);
  }

  GAddProductData_addProductBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _title = $v.title;
      _price = $v.price;
      _images = $v.images.toBuilder();
      _category = $v.category.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GAddProductData_addProduct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GAddProductData_addProduct;
  }

  @override
  void update(void Function(GAddProductData_addProductBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GAddProductData_addProduct build() => _build();

  _$GAddProductData_addProduct _build() {
    _$GAddProductData_addProduct _$result;
    try {
      _$result = _$v ??
          new _$GAddProductData_addProduct._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GAddProductData_addProduct', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GAddProductData_addProduct', 'id'),
              title: BuiltValueNullFieldError.checkNotNull(
                  title, r'GAddProductData_addProduct', 'title'),
              price: BuiltValueNullFieldError.checkNotNull(
                  price, r'GAddProductData_addProduct', 'price'),
              images: images.build(),
              category: category.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'images';
        images.build();
        _$failedField = 'category';
        category.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GAddProductData_addProduct', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GAddProductData_addProduct_category
    extends GAddProductData_addProduct_category {
  @override
  final String G__typename;
  @override
  final String id;

  factory _$GAddProductData_addProduct_category(
          [void Function(GAddProductData_addProduct_categoryBuilder)?
              updates]) =>
      (new GAddProductData_addProduct_categoryBuilder()..update(updates))
          ._build();

  _$GAddProductData_addProduct_category._(
      {required this.G__typename, required this.id})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GAddProductData_addProduct_category', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GAddProductData_addProduct_category', 'id');
  }

  @override
  GAddProductData_addProduct_category rebuild(
          void Function(GAddProductData_addProduct_categoryBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAddProductData_addProduct_categoryBuilder toBuilder() =>
      new GAddProductData_addProduct_categoryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAddProductData_addProduct_category &&
        G__typename == other.G__typename &&
        id == other.id;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GAddProductData_addProduct_category')
          ..add('G__typename', G__typename)
          ..add('id', id))
        .toString();
  }
}

class GAddProductData_addProduct_categoryBuilder
    implements
        Builder<GAddProductData_addProduct_category,
            GAddProductData_addProduct_categoryBuilder> {
  _$GAddProductData_addProduct_category? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  GAddProductData_addProduct_categoryBuilder() {
    GAddProductData_addProduct_category._initializeBuilder(this);
  }

  GAddProductData_addProduct_categoryBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GAddProductData_addProduct_category other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GAddProductData_addProduct_category;
  }

  @override
  void update(
      void Function(GAddProductData_addProduct_categoryBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GAddProductData_addProduct_category build() => _build();

  _$GAddProductData_addProduct_category _build() {
    final _$result = _$v ??
        new _$GAddProductData_addProduct_category._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GAddProductData_addProduct_category', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GAddProductData_addProduct_category', 'id'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
