// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schema.schema.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const GRole _$gRoleadmin = const GRole._('admin');
const GRole _$gRolecustomer = const GRole._('customer');

GRole _$gRoleValueOf(String name) {
  switch (name) {
    case 'admin':
      return _$gRoleadmin;
    case 'customer':
      return _$gRolecustomer;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<GRole> _$gRoleValues = new BuiltSet<GRole>(const <GRole>[
  _$gRoleadmin,
  _$gRolecustomer,
]);

Serializer<GCreateCategoryDto> _$gCreateCategoryDtoSerializer =
    new _$GCreateCategoryDtoSerializer();
Serializer<GCreateProductDto> _$gCreateProductDtoSerializer =
    new _$GCreateProductDtoSerializer();
Serializer<GCreateUserDto> _$gCreateUserDtoSerializer =
    new _$GCreateUserDtoSerializer();
Serializer<GRole> _$gRoleSerializer = new _$GRoleSerializer();
Serializer<GUpdateCategoryDto> _$gUpdateCategoryDtoSerializer =
    new _$GUpdateCategoryDtoSerializer();
Serializer<GUpdateProductDto> _$gUpdateProductDtoSerializer =
    new _$GUpdateProductDtoSerializer();
Serializer<GUpdateUserDto> _$gUpdateUserDtoSerializer =
    new _$GUpdateUserDtoSerializer();

class _$GCreateCategoryDtoSerializer
    implements StructuredSerializer<GCreateCategoryDto> {
  @override
  final Iterable<Type> types = const [GCreateCategoryDto, _$GCreateCategoryDto];
  @override
  final String wireName = 'GCreateCategoryDto';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GCreateCategoryDto object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'image',
      serializers.serialize(object.image,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GCreateCategoryDto deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateCategoryDtoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
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

class _$GCreateProductDtoSerializer
    implements StructuredSerializer<GCreateProductDto> {
  @override
  final Iterable<Type> types = const [GCreateProductDto, _$GCreateProductDto];
  @override
  final String wireName = 'GCreateProductDto';

  @override
  Iterable<Object?> serialize(Serializers serializers, GCreateProductDto object,
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
  GCreateProductDto deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateProductDtoBuilder();

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

class _$GCreateUserDtoSerializer
    implements StructuredSerializer<GCreateUserDto> {
  @override
  final Iterable<Type> types = const [GCreateUserDto, _$GCreateUserDto];
  @override
  final String wireName = 'GCreateUserDto';

  @override
  Iterable<Object?> serialize(Serializers serializers, GCreateUserDto object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'email',
      serializers.serialize(object.email,
          specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'password',
      serializers.serialize(object.password,
          specifiedType: const FullType(String)),
      'avatar',
      serializers.serialize(object.avatar,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.role;
    if (value != null) {
      result
        ..add('role')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(GRole)));
    }
    return result;
  }

  @override
  GCreateUserDto deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GCreateUserDtoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'password':
          result.password = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'role':
          result.role = serializers.deserialize(value,
              specifiedType: const FullType(GRole)) as GRole?;
          break;
        case 'avatar':
          result.avatar = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GRoleSerializer implements PrimitiveSerializer<GRole> {
  @override
  final Iterable<Type> types = const <Type>[GRole];
  @override
  final String wireName = 'GRole';

  @override
  Object serialize(Serializers serializers, GRole object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  GRole deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      GRole.valueOf(serialized as String);
}

class _$GUpdateCategoryDtoSerializer
    implements StructuredSerializer<GUpdateCategoryDto> {
  @override
  final Iterable<Type> types = const [GUpdateCategoryDto, _$GUpdateCategoryDto];
  @override
  final String wireName = 'GUpdateCategoryDto';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GUpdateCategoryDto object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.image;
    if (value != null) {
      result
        ..add('image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GUpdateCategoryDto deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUpdateCategoryDtoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GUpdateProductDtoSerializer
    implements StructuredSerializer<GUpdateProductDto> {
  @override
  final Iterable<Type> types = const [GUpdateProductDto, _$GUpdateProductDto];
  @override
  final String wireName = 'GUpdateProductDto';

  @override
  Iterable<Object?> serialize(Serializers serializers, GUpdateProductDto object,
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
    value = object.price;
    if (value != null) {
      result
        ..add('price')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.categoryId;
    if (value != null) {
      result
        ..add('categoryId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.images;
    if (value != null) {
      result
        ..add('images')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    return result;
  }

  @override
  GUpdateProductDto deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUpdateProductDtoBuilder();

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
        case 'price':
          result.price = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'categoryId':
          result.categoryId = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
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

class _$GUpdateUserDtoSerializer
    implements StructuredSerializer<GUpdateUserDto> {
  @override
  final Iterable<Type> types = const [GUpdateUserDto, _$GUpdateUserDto];
  @override
  final String wireName = 'GUpdateUserDto';

  @override
  Iterable<Object?> serialize(Serializers serializers, GUpdateUserDto object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.password;
    if (value != null) {
      result
        ..add('password')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.role;
    if (value != null) {
      result
        ..add('role')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(GRole)));
    }
    value = object.avatar;
    if (value != null) {
      result
        ..add('avatar')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GUpdateUserDto deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUpdateUserDtoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'password':
          result.password = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'role':
          result.role = serializers.deserialize(value,
              specifiedType: const FullType(GRole)) as GRole?;
          break;
        case 'avatar':
          result.avatar = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GCreateCategoryDto extends GCreateCategoryDto {
  @override
  final String name;
  @override
  final String image;

  factory _$GCreateCategoryDto(
          [void Function(GCreateCategoryDtoBuilder)? updates]) =>
      (new GCreateCategoryDtoBuilder()..update(updates))._build();

  _$GCreateCategoryDto._({required this.name, required this.image})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'GCreateCategoryDto', 'name');
    BuiltValueNullFieldError.checkNotNull(
        image, r'GCreateCategoryDto', 'image');
  }

  @override
  GCreateCategoryDto rebuild(
          void Function(GCreateCategoryDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateCategoryDtoBuilder toBuilder() =>
      new GCreateCategoryDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateCategoryDto &&
        name == other.name &&
        image == other.image;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, image.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GCreateCategoryDto')
          ..add('name', name)
          ..add('image', image))
        .toString();
  }
}

class GCreateCategoryDtoBuilder
    implements Builder<GCreateCategoryDto, GCreateCategoryDtoBuilder> {
  _$GCreateCategoryDto? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  GCreateCategoryDtoBuilder();

  GCreateCategoryDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _image = $v.image;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateCategoryDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateCategoryDto;
  }

  @override
  void update(void Function(GCreateCategoryDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCreateCategoryDto build() => _build();

  _$GCreateCategoryDto _build() {
    final _$result = _$v ??
        new _$GCreateCategoryDto._(
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'GCreateCategoryDto', 'name'),
            image: BuiltValueNullFieldError.checkNotNull(
                image, r'GCreateCategoryDto', 'image'));
    replace(_$result);
    return _$result;
  }
}

class _$GCreateProductDto extends GCreateProductDto {
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

  factory _$GCreateProductDto(
          [void Function(GCreateProductDtoBuilder)? updates]) =>
      (new GCreateProductDtoBuilder()..update(updates))._build();

  _$GCreateProductDto._(
      {required this.title,
      required this.price,
      required this.description,
      required this.categoryId,
      required this.images})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(title, r'GCreateProductDto', 'title');
    BuiltValueNullFieldError.checkNotNull(price, r'GCreateProductDto', 'price');
    BuiltValueNullFieldError.checkNotNull(
        description, r'GCreateProductDto', 'description');
    BuiltValueNullFieldError.checkNotNull(
        categoryId, r'GCreateProductDto', 'categoryId');
    BuiltValueNullFieldError.checkNotNull(
        images, r'GCreateProductDto', 'images');
  }

  @override
  GCreateProductDto rebuild(void Function(GCreateProductDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateProductDtoBuilder toBuilder() =>
      new GCreateProductDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateProductDto &&
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
    return (newBuiltValueToStringHelper(r'GCreateProductDto')
          ..add('title', title)
          ..add('price', price)
          ..add('description', description)
          ..add('categoryId', categoryId)
          ..add('images', images))
        .toString();
  }
}

class GCreateProductDtoBuilder
    implements Builder<GCreateProductDto, GCreateProductDtoBuilder> {
  _$GCreateProductDto? _$v;

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

  GCreateProductDtoBuilder();

  GCreateProductDtoBuilder get _$this {
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
  void replace(GCreateProductDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateProductDto;
  }

  @override
  void update(void Function(GCreateProductDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCreateProductDto build() => _build();

  _$GCreateProductDto _build() {
    _$GCreateProductDto _$result;
    try {
      _$result = _$v ??
          new _$GCreateProductDto._(
              title: BuiltValueNullFieldError.checkNotNull(
                  title, r'GCreateProductDto', 'title'),
              price: BuiltValueNullFieldError.checkNotNull(
                  price, r'GCreateProductDto', 'price'),
              description: BuiltValueNullFieldError.checkNotNull(
                  description, r'GCreateProductDto', 'description'),
              categoryId: BuiltValueNullFieldError.checkNotNull(
                  categoryId, r'GCreateProductDto', 'categoryId'),
              images: images.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'images';
        images.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GCreateProductDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GCreateUserDto extends GCreateUserDto {
  @override
  final String email;
  @override
  final String name;
  @override
  final String password;
  @override
  final GRole? role;
  @override
  final String avatar;

  factory _$GCreateUserDto([void Function(GCreateUserDtoBuilder)? updates]) =>
      (new GCreateUserDtoBuilder()..update(updates))._build();

  _$GCreateUserDto._(
      {required this.email,
      required this.name,
      required this.password,
      this.role,
      required this.avatar})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(email, r'GCreateUserDto', 'email');
    BuiltValueNullFieldError.checkNotNull(name, r'GCreateUserDto', 'name');
    BuiltValueNullFieldError.checkNotNull(
        password, r'GCreateUserDto', 'password');
    BuiltValueNullFieldError.checkNotNull(avatar, r'GCreateUserDto', 'avatar');
  }

  @override
  GCreateUserDto rebuild(void Function(GCreateUserDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateUserDtoBuilder toBuilder() =>
      new GCreateUserDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateUserDto &&
        email == other.email &&
        name == other.name &&
        password == other.password &&
        role == other.role &&
        avatar == other.avatar;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, password.hashCode);
    _$hash = $jc(_$hash, role.hashCode);
    _$hash = $jc(_$hash, avatar.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GCreateUserDto')
          ..add('email', email)
          ..add('name', name)
          ..add('password', password)
          ..add('role', role)
          ..add('avatar', avatar))
        .toString();
  }
}

class GCreateUserDtoBuilder
    implements Builder<GCreateUserDto, GCreateUserDtoBuilder> {
  _$GCreateUserDto? _$v;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _password;
  String? get password => _$this._password;
  set password(String? password) => _$this._password = password;

  GRole? _role;
  GRole? get role => _$this._role;
  set role(GRole? role) => _$this._role = role;

  String? _avatar;
  String? get avatar => _$this._avatar;
  set avatar(String? avatar) => _$this._avatar = avatar;

  GCreateUserDtoBuilder();

  GCreateUserDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _name = $v.name;
      _password = $v.password;
      _role = $v.role;
      _avatar = $v.avatar;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateUserDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GCreateUserDto;
  }

  @override
  void update(void Function(GCreateUserDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCreateUserDto build() => _build();

  _$GCreateUserDto _build() {
    final _$result = _$v ??
        new _$GCreateUserDto._(
            email: BuiltValueNullFieldError.checkNotNull(
                email, r'GCreateUserDto', 'email'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'GCreateUserDto', 'name'),
            password: BuiltValueNullFieldError.checkNotNull(
                password, r'GCreateUserDto', 'password'),
            role: role,
            avatar: BuiltValueNullFieldError.checkNotNull(
                avatar, r'GCreateUserDto', 'avatar'));
    replace(_$result);
    return _$result;
  }
}

class _$GDateTime extends GDateTime {
  @override
  final String value;

  factory _$GDateTime([void Function(GDateTimeBuilder)? updates]) =>
      (new GDateTimeBuilder()..update(updates))._build();

  _$GDateTime._({required this.value}) : super._() {
    BuiltValueNullFieldError.checkNotNull(value, r'GDateTime', 'value');
  }

  @override
  GDateTime rebuild(void Function(GDateTimeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GDateTimeBuilder toBuilder() => new GDateTimeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GDateTime && value == other.value;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, value.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GDateTime')..add('value', value))
        .toString();
  }
}

class GDateTimeBuilder implements Builder<GDateTime, GDateTimeBuilder> {
  _$GDateTime? _$v;

  String? _value;
  String? get value => _$this._value;
  set value(String? value) => _$this._value = value;

  GDateTimeBuilder();

  GDateTimeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _value = $v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GDateTime other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GDateTime;
  }

  @override
  void update(void Function(GDateTimeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GDateTime build() => _build();

  _$GDateTime _build() {
    final _$result = _$v ??
        new _$GDateTime._(
            value: BuiltValueNullFieldError.checkNotNull(
                value, r'GDateTime', 'value'));
    replace(_$result);
    return _$result;
  }
}

class _$GUpdateCategoryDto extends GUpdateCategoryDto {
  @override
  final String? name;
  @override
  final String? image;

  factory _$GUpdateCategoryDto(
          [void Function(GUpdateCategoryDtoBuilder)? updates]) =>
      (new GUpdateCategoryDtoBuilder()..update(updates))._build();

  _$GUpdateCategoryDto._({this.name, this.image}) : super._();

  @override
  GUpdateCategoryDto rebuild(
          void Function(GUpdateCategoryDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUpdateCategoryDtoBuilder toBuilder() =>
      new GUpdateCategoryDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUpdateCategoryDto &&
        name == other.name &&
        image == other.image;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, image.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GUpdateCategoryDto')
          ..add('name', name)
          ..add('image', image))
        .toString();
  }
}

class GUpdateCategoryDtoBuilder
    implements Builder<GUpdateCategoryDto, GUpdateCategoryDtoBuilder> {
  _$GUpdateCategoryDto? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  GUpdateCategoryDtoBuilder();

  GUpdateCategoryDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _image = $v.image;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUpdateCategoryDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUpdateCategoryDto;
  }

  @override
  void update(void Function(GUpdateCategoryDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUpdateCategoryDto build() => _build();

  _$GUpdateCategoryDto _build() {
    final _$result =
        _$v ?? new _$GUpdateCategoryDto._(name: name, image: image);
    replace(_$result);
    return _$result;
  }
}

class _$GUpdateProductDto extends GUpdateProductDto {
  @override
  final String? title;
  @override
  final double? price;
  @override
  final String? description;
  @override
  final double? categoryId;
  @override
  final BuiltList<String>? images;

  factory _$GUpdateProductDto(
          [void Function(GUpdateProductDtoBuilder)? updates]) =>
      (new GUpdateProductDtoBuilder()..update(updates))._build();

  _$GUpdateProductDto._(
      {this.title, this.price, this.description, this.categoryId, this.images})
      : super._();

  @override
  GUpdateProductDto rebuild(void Function(GUpdateProductDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUpdateProductDtoBuilder toBuilder() =>
      new GUpdateProductDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUpdateProductDto &&
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
    return (newBuiltValueToStringHelper(r'GUpdateProductDto')
          ..add('title', title)
          ..add('price', price)
          ..add('description', description)
          ..add('categoryId', categoryId)
          ..add('images', images))
        .toString();
  }
}

class GUpdateProductDtoBuilder
    implements Builder<GUpdateProductDto, GUpdateProductDtoBuilder> {
  _$GUpdateProductDto? _$v;

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

  GUpdateProductDtoBuilder();

  GUpdateProductDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _price = $v.price;
      _description = $v.description;
      _categoryId = $v.categoryId;
      _images = $v.images?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUpdateProductDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUpdateProductDto;
  }

  @override
  void update(void Function(GUpdateProductDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUpdateProductDto build() => _build();

  _$GUpdateProductDto _build() {
    _$GUpdateProductDto _$result;
    try {
      _$result = _$v ??
          new _$GUpdateProductDto._(
              title: title,
              price: price,
              description: description,
              categoryId: categoryId,
              images: _images?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'images';
        _images?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GUpdateProductDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GUpdateUserDto extends GUpdateUserDto {
  @override
  final String? email;
  @override
  final String? name;
  @override
  final String? password;
  @override
  final GRole? role;
  @override
  final String? avatar;

  factory _$GUpdateUserDto([void Function(GUpdateUserDtoBuilder)? updates]) =>
      (new GUpdateUserDtoBuilder()..update(updates))._build();

  _$GUpdateUserDto._(
      {this.email, this.name, this.password, this.role, this.avatar})
      : super._();

  @override
  GUpdateUserDto rebuild(void Function(GUpdateUserDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUpdateUserDtoBuilder toBuilder() =>
      new GUpdateUserDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUpdateUserDto &&
        email == other.email &&
        name == other.name &&
        password == other.password &&
        role == other.role &&
        avatar == other.avatar;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, password.hashCode);
    _$hash = $jc(_$hash, role.hashCode);
    _$hash = $jc(_$hash, avatar.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GUpdateUserDto')
          ..add('email', email)
          ..add('name', name)
          ..add('password', password)
          ..add('role', role)
          ..add('avatar', avatar))
        .toString();
  }
}

class GUpdateUserDtoBuilder
    implements Builder<GUpdateUserDto, GUpdateUserDtoBuilder> {
  _$GUpdateUserDto? _$v;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _password;
  String? get password => _$this._password;
  set password(String? password) => _$this._password = password;

  GRole? _role;
  GRole? get role => _$this._role;
  set role(GRole? role) => _$this._role = role;

  String? _avatar;
  String? get avatar => _$this._avatar;
  set avatar(String? avatar) => _$this._avatar = avatar;

  GUpdateUserDtoBuilder();

  GUpdateUserDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _name = $v.name;
      _password = $v.password;
      _role = $v.role;
      _avatar = $v.avatar;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUpdateUserDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GUpdateUserDto;
  }

  @override
  void update(void Function(GUpdateUserDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GUpdateUserDto build() => _build();

  _$GUpdateUserDto _build() {
    final _$result = _$v ??
        new _$GUpdateUserDto._(
            email: email,
            name: name,
            password: password,
            role: role,
            avatar: avatar);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
