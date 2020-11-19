import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:quick_eats/src/models/menu_model.dart';

import '../menu_item.dart';

part 'menu_response.g.dart';

abstract class MenuItemsResponse implements Built<MenuItemsResponse, MenuItemsResponseBuilder>{

  @BuiltValueField(wireName:"menu_with_items")
  Menu get menu;

  MenuItemsResponse._();

  factory MenuItemsResponse([updates(MenuItemsResponseBuilder b)]) = _$MenuItemsResponse;

  static Serializer<MenuItemsResponse> get serializer => _$menuItemsResponseSerializer;
}

abstract class MenuItemsByCategoryResponse implements Built<MenuItemsByCategoryResponse, MenuItemsByCategoryResponseBuilder>{

  @BuiltValueField(wireName:"menu_items")
  BuiltList<MenuItem> get menuItems;

  MenuItemsByCategoryResponse._();

  factory MenuItemsByCategoryResponse([updates(MenuItemsByCategoryResponseBuilder b)]) = _$MenuItemsByCategoryResponse;

  static Serializer<MenuItemsByCategoryResponse> get serializer => _$menuItemsByCategoryResponseSerializer;
}

