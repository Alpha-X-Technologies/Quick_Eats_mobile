// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<RestaurantResponse> _$restaurantResponseSerializer =
    new _$RestaurantResponseSerializer();
Serializer<MenuItemCategoriesResponse> _$menuItemCategoriesResponseSerializer =
    new _$MenuItemCategoriesResponseSerializer();

class _$RestaurantResponseSerializer
    implements StructuredSerializer<RestaurantResponse> {
  @override
  final Iterable<Type> types = const [RestaurantResponse, _$RestaurantResponse];
  @override
  final String wireName = 'RestaurantResponse';

  @override
  Iterable<Object> serialize(Serializers serializers, RestaurantResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.restaurants != null) {
      result
        ..add('restaurants')
        ..add(serializers.serialize(object.restaurants,
            specifiedType:
                const FullType(BuiltList, const [const FullType(Restaurant)])));
    }
    return result;
  }

  @override
  RestaurantResponse deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RestaurantResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'restaurants':
          result.restaurants.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Restaurant)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$MenuItemCategoriesResponseSerializer
    implements StructuredSerializer<MenuItemCategoriesResponse> {
  @override
  final Iterable<Type> types = const [
    MenuItemCategoriesResponse,
    _$MenuItemCategoriesResponse
  ];
  @override
  final String wireName = 'MenuItemCategoriesResponse';

  @override
  Iterable<Object> serialize(
      Serializers serializers, MenuItemCategoriesResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.categories != null) {
      result
        ..add('menu_item_categories')
        ..add(serializers.serialize(object.categories,
            specifiedType: const FullType(
                BuiltList, const [const FullType(MenuItemCategory)])));
    }
    return result;
  }

  @override
  MenuItemCategoriesResponse deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MenuItemCategoriesResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'menu_item_categories':
          result.categories.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(MenuItemCategory)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$RestaurantResponse extends RestaurantResponse {
  @override
  final BuiltList<Restaurant> restaurants;

  factory _$RestaurantResponse(
          [void Function(RestaurantResponseBuilder) updates]) =>
      (new RestaurantResponseBuilder()..update(updates)).build();

  _$RestaurantResponse._({this.restaurants}) : super._();

  @override
  RestaurantResponse rebuild(
          void Function(RestaurantResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RestaurantResponseBuilder toBuilder() =>
      new RestaurantResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RestaurantResponse && restaurants == other.restaurants;
  }

  @override
  int get hashCode {
    return $jf($jc(0, restaurants.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('RestaurantResponse')
          ..add('restaurants', restaurants))
        .toString();
  }
}

class RestaurantResponseBuilder
    implements Builder<RestaurantResponse, RestaurantResponseBuilder> {
  _$RestaurantResponse _$v;

  ListBuilder<Restaurant> _restaurants;
  ListBuilder<Restaurant> get restaurants =>
      _$this._restaurants ??= new ListBuilder<Restaurant>();
  set restaurants(ListBuilder<Restaurant> restaurants) =>
      _$this._restaurants = restaurants;

  RestaurantResponseBuilder();

  RestaurantResponseBuilder get _$this {
    if (_$v != null) {
      _restaurants = _$v.restaurants?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RestaurantResponse other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$RestaurantResponse;
  }

  @override
  void update(void Function(RestaurantResponseBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$RestaurantResponse build() {
    _$RestaurantResponse _$result;
    try {
      _$result =
          _$v ?? new _$RestaurantResponse._(restaurants: _restaurants?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'restaurants';
        _restaurants?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'RestaurantResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$MenuItemCategoriesResponse extends MenuItemCategoriesResponse {
  @override
  final BuiltList<MenuItemCategory> categories;

  factory _$MenuItemCategoriesResponse(
          [void Function(MenuItemCategoriesResponseBuilder) updates]) =>
      (new MenuItemCategoriesResponseBuilder()..update(updates)).build();

  _$MenuItemCategoriesResponse._({this.categories}) : super._();

  @override
  MenuItemCategoriesResponse rebuild(
          void Function(MenuItemCategoriesResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MenuItemCategoriesResponseBuilder toBuilder() =>
      new MenuItemCategoriesResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MenuItemCategoriesResponse &&
        categories == other.categories;
  }

  @override
  int get hashCode {
    return $jf($jc(0, categories.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MenuItemCategoriesResponse')
          ..add('categories', categories))
        .toString();
  }
}

class MenuItemCategoriesResponseBuilder
    implements
        Builder<MenuItemCategoriesResponse, MenuItemCategoriesResponseBuilder> {
  _$MenuItemCategoriesResponse _$v;

  ListBuilder<MenuItemCategory> _categories;
  ListBuilder<MenuItemCategory> get categories =>
      _$this._categories ??= new ListBuilder<MenuItemCategory>();
  set categories(ListBuilder<MenuItemCategory> categories) =>
      _$this._categories = categories;

  MenuItemCategoriesResponseBuilder();

  MenuItemCategoriesResponseBuilder get _$this {
    if (_$v != null) {
      _categories = _$v.categories?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MenuItemCategoriesResponse other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$MenuItemCategoriesResponse;
  }

  @override
  void update(void Function(MenuItemCategoriesResponseBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MenuItemCategoriesResponse build() {
    _$MenuItemCategoriesResponse _$result;
    try {
      _$result = _$v ??
          new _$MenuItemCategoriesResponse._(categories: _categories?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'categories';
        _categories?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'MenuItemCategoriesResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
