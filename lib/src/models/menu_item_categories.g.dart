// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_item_categories.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MenuItemCategory> _$menuItemCategorySerializer =
    new _$MenuItemCategorySerializer();

class _$MenuItemCategorySerializer
    implements StructuredSerializer<MenuItemCategory> {
  @override
  final Iterable<Type> types = const [MenuItemCategory, _$MenuItemCategory];
  @override
  final String wireName = 'MenuItemCategory';

  @override
  Iterable<Object> serialize(Serializers serializers, MenuItemCategory object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'item_category_name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'item_category_picture_url',
      serializers.serialize(object.pictureUrl,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  MenuItemCategory deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MenuItemCategoryBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'item_category_name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'item_category_picture_url':
          result.pictureUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$MenuItemCategory extends MenuItemCategory {
  @override
  final String name;
  @override
  final String pictureUrl;
  @override
  final String id;

  factory _$MenuItemCategory(
          [void Function(MenuItemCategoryBuilder) updates]) =>
      (new MenuItemCategoryBuilder()..update(updates)).build();

  _$MenuItemCategory._({this.name, this.pictureUrl, this.id}) : super._() {
    if (name == null) {
      throw new BuiltValueNullFieldError('MenuItemCategory', 'name');
    }
    if (pictureUrl == null) {
      throw new BuiltValueNullFieldError('MenuItemCategory', 'pictureUrl');
    }
    if (id == null) {
      throw new BuiltValueNullFieldError('MenuItemCategory', 'id');
    }
  }

  @override
  MenuItemCategory rebuild(void Function(MenuItemCategoryBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MenuItemCategoryBuilder toBuilder() =>
      new MenuItemCategoryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MenuItemCategory &&
        name == other.name &&
        pictureUrl == other.pictureUrl &&
        id == other.id;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, name.hashCode), pictureUrl.hashCode), id.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MenuItemCategory')
          ..add('name', name)
          ..add('pictureUrl', pictureUrl)
          ..add('id', id))
        .toString();
  }
}

class MenuItemCategoryBuilder
    implements Builder<MenuItemCategory, MenuItemCategoryBuilder> {
  _$MenuItemCategory _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _pictureUrl;
  String get pictureUrl => _$this._pictureUrl;
  set pictureUrl(String pictureUrl) => _$this._pictureUrl = pictureUrl;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  MenuItemCategoryBuilder();

  MenuItemCategoryBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _pictureUrl = _$v.pictureUrl;
      _id = _$v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MenuItemCategory other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$MenuItemCategory;
  }

  @override
  void update(void Function(MenuItemCategoryBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MenuItemCategory build() {
    final _$result = _$v ??
        new _$MenuItemCategory._(name: name, pictureUrl: pictureUrl, id: id);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
