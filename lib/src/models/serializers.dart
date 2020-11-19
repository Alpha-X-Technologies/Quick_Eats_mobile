import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

import 'package:built_collection/built_collection.dart';
import 'package:quick_eats/src/models/menu_item.dart';
import 'package:quick_eats/src/models/menu_item_categories.dart';
import 'package:quick_eats/src/models/responses/menu_response.dart';
import 'decimal_serializer.dart';
import 'models.dart';
part 'serializers.g.dart';

@SerializersFor(const [
  RestaurantResponse,
  Restaurant,
  MenuItemCategory,
  MenuItem,
  MenuItemsResponse,
  MenuItemCategoriesResponse,
  MenuItemsByCategoryResponse,
  Menu,
  Vendor
])

final Serializers serializers =
(_$serializers.toBuilder()..add(DoubleSerializer())..addPlugin(StandardJsonPlugin())).build();
