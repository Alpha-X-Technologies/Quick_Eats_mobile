import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:quick_eats/src/models/menu_item.dart';
import 'package:quick_eats/src/models/menu_item_categories.dart';
import 'package:quick_eats/src/models/restaurant_model.dart';

part 'restaurant_response.g.dart';

abstract class RestaurantResponse implements Built<RestaurantResponse, RestaurantResponseBuilder>{

  @BuiltValueField(wireName:"restaurants" )
  @nullable
  BuiltList<Restaurant> get restaurants;


  RestaurantResponse._();

  factory RestaurantResponse([updates(RestaurantResponseBuilder b)]) = _$RestaurantResponse;

  static Serializer<RestaurantResponse> get serializer => _$restaurantResponseSerializer;
}

abstract class MenuItemCategoriesResponse implements Built<MenuItemCategoriesResponse, MenuItemCategoriesResponseBuilder>{

  @BuiltValueField(wireName:"menu_item_categories" )
  @nullable
  BuiltList<MenuItemCategory> get categories;

  MenuItemCategoriesResponse._();

  factory MenuItemCategoriesResponse([updates(MenuItemCategoriesResponseBuilder b)]) = _$MenuItemCategoriesResponse;

  static Serializer<MenuItemCategoriesResponse> get serializer => _$menuItemCategoriesResponseSerializer;
}