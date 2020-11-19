
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:quick_eats/src/models/menu_item_extras_panel.dart';
import 'package:quick_eats/src/models/menu_model.dart';

part 'menu_item.g.dart';

abstract class MenuItem implements Built<MenuItem, MenuItemBuilder> {
  @nullable
  String get id;

  @nullable
  String get item_name;

  @nullable
  String get menu_id;

  @nullable
  String get item_description;

@nullable
  String get item_picture_url;

@nullable
  double get item_price;

  @nullable 
  bool get is_favourite;

  
  
  MenuItem._();

  factory MenuItem([updates(MenuItemBuilder b)]) = _$MenuItem;

  static Serializer<MenuItem> get serializer => _$menuItemSerializer;
}