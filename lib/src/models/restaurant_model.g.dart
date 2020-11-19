// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Restaurant> _$restaurantSerializer = new _$RestaurantSerializer();

class _$RestaurantSerializer implements StructuredSerializer<Restaurant> {
  @override
  final Iterable<Type> types = const [Restaurant, _$Restaurant];
  @override
  final String wireName = 'Restaurant';

  @override
  Iterable<Object> serialize(Serializers serializers, Restaurant object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(String)));
    }
    if (object.restaurant_name != null) {
      result
        ..add('restaurant_name')
        ..add(serializers.serialize(object.restaurant_name,
            specifiedType: const FullType(String)));
    }
    if (object.description != null) {
      result
        ..add('description')
        ..add(serializers.serialize(object.description,
            specifiedType: const FullType(String)));
    }
    if (object.address != null) {
      result
        ..add('address')
        ..add(serializers.serialize(object.address,
            specifiedType: const FullType(String)));
    }
    if (object.business_hours != null) {
      result
        ..add('business_hours')
        ..add(serializers.serialize(object.business_hours,
            specifiedType: const FullType(String)));
    }
    if (object.vendor_id != null) {
      result
        ..add('vendor_id')
        ..add(serializers.serialize(object.vendor_id,
            specifiedType: const FullType(String)));
    }
    if (object.picture_url != null) {
      result
        ..add('picture_url')
        ..add(serializers.serialize(object.picture_url,
            specifiedType: const FullType(String)));
    }
    if (object.contact_number != null) {
      result
        ..add('contact_number')
        ..add(serializers.serialize(object.contact_number,
            specifiedType: const FullType(String)));
    }
    if (object.rating != null) {
      result
        ..add('rating')
        ..add(serializers.serialize(object.rating,
            specifiedType: const FullType(double)));
    }
    if (object.menus != null) {
      result
        ..add('menus')
        ..add(serializers.serialize(object.menus,
            specifiedType:
                const FullType(BuiltList, const [const FullType(Menu)])));
    }
    return result;
  }

  @override
  Restaurant deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RestaurantBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'restaurant_name':
          result.restaurant_name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'business_hours':
          result.business_hours = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'vendor_id':
          result.vendor_id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'picture_url':
          result.picture_url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'contact_number':
          result.contact_number = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'rating':
          result.rating = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'menus':
          result.menus.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Menu)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$Restaurant extends Restaurant {
  @override
  final String id;
  @override
  final String restaurant_name;
  @override
  final String description;
  @override
  final String address;
  @override
  final String business_hours;
  @override
  final String vendor_id;
  @override
  final String picture_url;
  @override
  final String contact_number;
  @override
  final double rating;
  @override
  final BuiltList<Menu> menus;

  factory _$Restaurant([void Function(RestaurantBuilder) updates]) =>
      (new RestaurantBuilder()..update(updates)).build();

  _$Restaurant._(
      {this.id,
      this.restaurant_name,
      this.description,
      this.address,
      this.business_hours,
      this.vendor_id,
      this.picture_url,
      this.contact_number,
      this.rating,
      this.menus})
      : super._();

  @override
  Restaurant rebuild(void Function(RestaurantBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RestaurantBuilder toBuilder() => new RestaurantBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Restaurant &&
        id == other.id &&
        restaurant_name == other.restaurant_name &&
        description == other.description &&
        address == other.address &&
        business_hours == other.business_hours &&
        vendor_id == other.vendor_id &&
        picture_url == other.picture_url &&
        contact_number == other.contact_number &&
        rating == other.rating &&
        menus == other.menus;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc($jc(0, id.hashCode),
                                        restaurant_name.hashCode),
                                    description.hashCode),
                                address.hashCode),
                            business_hours.hashCode),
                        vendor_id.hashCode),
                    picture_url.hashCode),
                contact_number.hashCode),
            rating.hashCode),
        menus.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Restaurant')
          ..add('id', id)
          ..add('restaurant_name', restaurant_name)
          ..add('description', description)
          ..add('address', address)
          ..add('business_hours', business_hours)
          ..add('vendor_id', vendor_id)
          ..add('picture_url', picture_url)
          ..add('contact_number', contact_number)
          ..add('rating', rating)
          ..add('menus', menus))
        .toString();
  }
}

class RestaurantBuilder implements Builder<Restaurant, RestaurantBuilder> {
  _$Restaurant _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _restaurant_name;
  String get restaurant_name => _$this._restaurant_name;
  set restaurant_name(String restaurant_name) =>
      _$this._restaurant_name = restaurant_name;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  String _address;
  String get address => _$this._address;
  set address(String address) => _$this._address = address;

  String _business_hours;
  String get business_hours => _$this._business_hours;
  set business_hours(String business_hours) =>
      _$this._business_hours = business_hours;

  String _vendor_id;
  String get vendor_id => _$this._vendor_id;
  set vendor_id(String vendor_id) => _$this._vendor_id = vendor_id;

  String _picture_url;
  String get picture_url => _$this._picture_url;
  set picture_url(String picture_url) => _$this._picture_url = picture_url;

  String _contact_number;
  String get contact_number => _$this._contact_number;
  set contact_number(String contact_number) =>
      _$this._contact_number = contact_number;

  double _rating;
  double get rating => _$this._rating;
  set rating(double rating) => _$this._rating = rating;

  ListBuilder<Menu> _menus;
  ListBuilder<Menu> get menus => _$this._menus ??= new ListBuilder<Menu>();
  set menus(ListBuilder<Menu> menus) => _$this._menus = menus;

  RestaurantBuilder();

  RestaurantBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _restaurant_name = _$v.restaurant_name;
      _description = _$v.description;
      _address = _$v.address;
      _business_hours = _$v.business_hours;
      _vendor_id = _$v.vendor_id;
      _picture_url = _$v.picture_url;
      _contact_number = _$v.contact_number;
      _rating = _$v.rating;
      _menus = _$v.menus?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Restaurant other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Restaurant;
  }

  @override
  void update(void Function(RestaurantBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Restaurant build() {
    _$Restaurant _$result;
    try {
      _$result = _$v ??
          new _$Restaurant._(
              id: id,
              restaurant_name: restaurant_name,
              description: description,
              address: address,
              business_hours: business_hours,
              vendor_id: vendor_id,
              picture_url: picture_url,
              contact_number: contact_number,
              rating: rating,
              menus: _menus?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'menus';
        _menus?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Restaurant', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
