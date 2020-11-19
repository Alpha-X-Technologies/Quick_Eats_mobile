import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'menu_item_categories.g.dart';

abstract class MenuItemCategory implements Built<MenuItemCategory, MenuItemCategoryBuilder> {
  @BuiltValueField(wireName: "item_category_name")
  String get name;
  @BuiltValueField(wireName: "item_category_picture_url")
  String get pictureUrl;

  @BuiltValueField(wireName: "id")
  String get id;

   MenuItemCategory._();

  factory MenuItemCategory([updates(MenuItemCategoryBuilder b)]) = _$MenuItemCategory;

  static Serializer<MenuItemCategory> get serializer => _$menuItemCategorySerializer;
}