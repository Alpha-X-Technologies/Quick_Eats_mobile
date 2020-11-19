// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MenuItemsResponse> _$menuItemsResponseSerializer =
    new _$MenuItemsResponseSerializer();
Serializer<MenuItemsByCategoryResponse>
    _$menuItemsByCategoryResponseSerializer =
    new _$MenuItemsByCategoryResponseSerializer();

class _$MenuItemsResponseSerializer
    implements StructuredSerializer<MenuItemsResponse> {
  @override
  final Iterable<Type> types = const [MenuItemsResponse, _$MenuItemsResponse];
  @override
  final String wireName = 'MenuItemsResponse';

  @override
  Iterable<Object> serialize(Serializers serializers, MenuItemsResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'menu_with_items',
      serializers.serialize(object.menu, specifiedType: const FullType(Menu)),
    ];

    return result;
  }

  @override
  MenuItemsResponse deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MenuItemsResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'menu_with_items':
          result.menu.replace(serializers.deserialize(value,
              specifiedType: const FullType(Menu)) as Menu);
          break;
      }
    }

    return result.build();
  }
}

class _$MenuItemsByCategoryResponseSerializer
    implements StructuredSerializer<MenuItemsByCategoryResponse> {
  @override
  final Iterable<Type> types = const [
    MenuItemsByCategoryResponse,
    _$MenuItemsByCategoryResponse
  ];
  @override
  final String wireName = 'MenuItemsByCategoryResponse';

  @override
  Iterable<Object> serialize(
      Serializers serializers, MenuItemsByCategoryResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'menu_items',
      serializers.serialize(object.menuItems,
          specifiedType:
              const FullType(BuiltList, const [const FullType(MenuItem)])),
    ];

    return result;
  }

  @override
  MenuItemsByCategoryResponse deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MenuItemsByCategoryResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'menu_items':
          result.menuItems.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(MenuItem)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$MenuItemsResponse extends MenuItemsResponse {
  @override
  final Menu menu;

  factory _$MenuItemsResponse(
          [void Function(MenuItemsResponseBuilder) updates]) =>
      (new MenuItemsResponseBuilder()..update(updates)).build();

  _$MenuItemsResponse._({this.menu}) : super._() {
    if (menu == null) {
      throw new BuiltValueNullFieldError('MenuItemsResponse', 'menu');
    }
  }

  @override
  MenuItemsResponse rebuild(void Function(MenuItemsResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MenuItemsResponseBuilder toBuilder() =>
      new MenuItemsResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MenuItemsResponse && menu == other.menu;
  }

  @override
  int get hashCode {
    return $jf($jc(0, menu.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MenuItemsResponse')..add('menu', menu))
        .toString();
  }
}

class MenuItemsResponseBuilder
    implements Builder<MenuItemsResponse, MenuItemsResponseBuilder> {
  _$MenuItemsResponse _$v;

  MenuBuilder _menu;
  MenuBuilder get menu => _$this._menu ??= new MenuBuilder();
  set menu(MenuBuilder menu) => _$this._menu = menu;

  MenuItemsResponseBuilder();

  MenuItemsResponseBuilder get _$this {
    if (_$v != null) {
      _menu = _$v.menu?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MenuItemsResponse other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$MenuItemsResponse;
  }

  @override
  void update(void Function(MenuItemsResponseBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MenuItemsResponse build() {
    _$MenuItemsResponse _$result;
    try {
      _$result = _$v ?? new _$MenuItemsResponse._(menu: menu.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'menu';
        menu.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'MenuItemsResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$MenuItemsByCategoryResponse extends MenuItemsByCategoryResponse {
  @override
  final BuiltList<MenuItem> menuItems;

  factory _$MenuItemsByCategoryResponse(
          [void Function(MenuItemsByCategoryResponseBuilder) updates]) =>
      (new MenuItemsByCategoryResponseBuilder()..update(updates)).build();

  _$MenuItemsByCategoryResponse._({this.menuItems}) : super._() {
    if (menuItems == null) {
      throw new BuiltValueNullFieldError(
          'MenuItemsByCategoryResponse', 'menuItems');
    }
  }

  @override
  MenuItemsByCategoryResponse rebuild(
          void Function(MenuItemsByCategoryResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MenuItemsByCategoryResponseBuilder toBuilder() =>
      new MenuItemsByCategoryResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MenuItemsByCategoryResponse && menuItems == other.menuItems;
  }

  @override
  int get hashCode {
    return $jf($jc(0, menuItems.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MenuItemsByCategoryResponse')
          ..add('menuItems', menuItems))
        .toString();
  }
}

class MenuItemsByCategoryResponseBuilder
    implements
        Builder<MenuItemsByCategoryResponse,
            MenuItemsByCategoryResponseBuilder> {
  _$MenuItemsByCategoryResponse _$v;

  ListBuilder<MenuItem> _menuItems;
  ListBuilder<MenuItem> get menuItems =>
      _$this._menuItems ??= new ListBuilder<MenuItem>();
  set menuItems(ListBuilder<MenuItem> menuItems) =>
      _$this._menuItems = menuItems;

  MenuItemsByCategoryResponseBuilder();

  MenuItemsByCategoryResponseBuilder get _$this {
    if (_$v != null) {
      _menuItems = _$v.menuItems?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MenuItemsByCategoryResponse other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$MenuItemsByCategoryResponse;
  }

  @override
  void update(void Function(MenuItemsByCategoryResponseBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MenuItemsByCategoryResponse build() {
    _$MenuItemsByCategoryResponse _$result;
    try {
      _$result = _$v ??
          new _$MenuItemsByCategoryResponse._(menuItems: menuItems.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'menuItems';
        menuItems.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'MenuItemsByCategoryResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
