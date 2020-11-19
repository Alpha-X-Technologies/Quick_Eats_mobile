import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:quick_eats/src/models/menu_item.dart';
import 'package:quick_eats/src/models/models.dart';

part 'menu_model.g.dart';

abstract class Menu implements Built<Menu, MenuBuilder> {
  @nullable
  String get id;

  @nullable
  String get menu_name;

  @nullable
  String get restaurant_id;

  @nullable
  String get description;

  @nullable
  BuiltList<MenuItem> get menu_items;

  Menu._();

  factory Menu([updates(MenuBuilder b)]) = _$Menu;

  static Serializer<Menu> get serializer => _$menuSerializer;
}
