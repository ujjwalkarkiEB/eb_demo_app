// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_categories.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GgetAllCategoriesData> _$ggetAllCategoriesDataSerializer =
    new _$GgetAllCategoriesDataSerializer();
Serializer<GgetAllCategoriesData_categories>
    _$ggetAllCategoriesDataCategoriesSerializer =
    new _$GgetAllCategoriesData_categoriesSerializer();

class _$GgetAllCategoriesDataSerializer
    implements StructuredSerializer<GgetAllCategoriesData> {
  @override
  final Iterable<Type> types = const [
    GgetAllCategoriesData,
    _$GgetAllCategoriesData
  ];
  @override
  final String wireName = 'GgetAllCategoriesData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GgetAllCategoriesData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'categories',
      serializers.serialize(object.categories,
          specifiedType: const FullType(BuiltList,
              const [const FullType(GgetAllCategoriesData_categories)])),
    ];

    return result;
  }

  @override
  GgetAllCategoriesData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GgetAllCategoriesDataBuilder();

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
        case 'categories':
          result.categories.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GgetAllCategoriesData_categories)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GgetAllCategoriesData_categoriesSerializer
    implements StructuredSerializer<GgetAllCategoriesData_categories> {
  @override
  final Iterable<Type> types = const [
    GgetAllCategoriesData_categories,
    _$GgetAllCategoriesData_categories
  ];
  @override
  final String wireName = 'GgetAllCategoriesData_categories';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GgetAllCategoriesData_categories object,
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
    ];

    return result;
  }

  @override
  GgetAllCategoriesData_categories deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GgetAllCategoriesData_categoriesBuilder();

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
      }
    }

    return result.build();
  }
}

class _$GgetAllCategoriesData extends GgetAllCategoriesData {
  @override
  final String G__typename;
  @override
  final BuiltList<GgetAllCategoriesData_categories> categories;

  factory _$GgetAllCategoriesData(
          [void Function(GgetAllCategoriesDataBuilder)? updates]) =>
      (new GgetAllCategoriesDataBuilder()..update(updates))._build();

  _$GgetAllCategoriesData._(
      {required this.G__typename, required this.categories})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GgetAllCategoriesData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        categories, r'GgetAllCategoriesData', 'categories');
  }

  @override
  GgetAllCategoriesData rebuild(
          void Function(GgetAllCategoriesDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GgetAllCategoriesDataBuilder toBuilder() =>
      new GgetAllCategoriesDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GgetAllCategoriesData &&
        G__typename == other.G__typename &&
        categories == other.categories;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, categories.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GgetAllCategoriesData')
          ..add('G__typename', G__typename)
          ..add('categories', categories))
        .toString();
  }
}

class GgetAllCategoriesDataBuilder
    implements Builder<GgetAllCategoriesData, GgetAllCategoriesDataBuilder> {
  _$GgetAllCategoriesData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GgetAllCategoriesData_categories>? _categories;
  ListBuilder<GgetAllCategoriesData_categories> get categories =>
      _$this._categories ??=
          new ListBuilder<GgetAllCategoriesData_categories>();
  set categories(ListBuilder<GgetAllCategoriesData_categories>? categories) =>
      _$this._categories = categories;

  GgetAllCategoriesDataBuilder() {
    GgetAllCategoriesData._initializeBuilder(this);
  }

  GgetAllCategoriesDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _categories = $v.categories.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GgetAllCategoriesData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GgetAllCategoriesData;
  }

  @override
  void update(void Function(GgetAllCategoriesDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GgetAllCategoriesData build() => _build();

  _$GgetAllCategoriesData _build() {
    _$GgetAllCategoriesData _$result;
    try {
      _$result = _$v ??
          new _$GgetAllCategoriesData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GgetAllCategoriesData', 'G__typename'),
              categories: categories.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'categories';
        categories.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GgetAllCategoriesData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GgetAllCategoriesData_categories
    extends GgetAllCategoriesData_categories {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;
  @override
  final String image;

  factory _$GgetAllCategoriesData_categories(
          [void Function(GgetAllCategoriesData_categoriesBuilder)? updates]) =>
      (new GgetAllCategoriesData_categoriesBuilder()..update(updates))._build();

  _$GgetAllCategoriesData_categories._(
      {required this.G__typename,
      required this.id,
      required this.name,
      required this.image})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GgetAllCategoriesData_categories', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GgetAllCategoriesData_categories', 'id');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GgetAllCategoriesData_categories', 'name');
    BuiltValueNullFieldError.checkNotNull(
        image, r'GgetAllCategoriesData_categories', 'image');
  }

  @override
  GgetAllCategoriesData_categories rebuild(
          void Function(GgetAllCategoriesData_categoriesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GgetAllCategoriesData_categoriesBuilder toBuilder() =>
      new GgetAllCategoriesData_categoriesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GgetAllCategoriesData_categories &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name &&
        image == other.image;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, image.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GgetAllCategoriesData_categories')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name)
          ..add('image', image))
        .toString();
  }
}

class GgetAllCategoriesData_categoriesBuilder
    implements
        Builder<GgetAllCategoriesData_categories,
            GgetAllCategoriesData_categoriesBuilder> {
  _$GgetAllCategoriesData_categories? _$v;

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

  GgetAllCategoriesData_categoriesBuilder() {
    GgetAllCategoriesData_categories._initializeBuilder(this);
  }

  GgetAllCategoriesData_categoriesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _name = $v.name;
      _image = $v.image;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GgetAllCategoriesData_categories other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GgetAllCategoriesData_categories;
  }

  @override
  void update(void Function(GgetAllCategoriesData_categoriesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GgetAllCategoriesData_categories build() => _build();

  _$GgetAllCategoriesData_categories _build() {
    final _$result = _$v ??
        new _$GgetAllCategoriesData_categories._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GgetAllCategoriesData_categories', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GgetAllCategoriesData_categories', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'GgetAllCategoriesData_categories', 'name'),
            image: BuiltValueNullFieldError.checkNotNull(
                image, r'GgetAllCategoriesData_categories', 'image'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
