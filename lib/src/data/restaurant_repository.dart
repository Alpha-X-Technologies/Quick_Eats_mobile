import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:quick_eats/src/data/repositories.dart';
import 'package:quick_eats/src/models/responses/menu_response.dart';
import 'package:quick_eats/src/models/responses/restaurant_response.dart';

class RestaurantRepository {
  Future<RestaurantResponse> getAllRestaurants(BuildContext context) async {
    final response =
        await Provider.of<RestaurantApiService>(context, listen: false)
            .getAllRestaurants();
    if (response.statusCode == 200) {
      return response.body;
    }

    return null;
  }

  Future<MenuItemsResponse> getMenuItems(
      BuildContext context, String menuId) async {
    final response =
        await Provider.of<RestaurantApiService>(context, listen: false)
            .getMenuItems(menuId);
    if (response.statusCode == 200) {
      return response.body;
    }

    return null;
  }

  Future<MenuItemCategoriesResponse> getMenuItemCategories(
      BuildContext context) async {
    final response =
        await Provider.of<RestaurantApiService>(context, listen: false)
            .getMenuItemCategories();
    if (response.statusCode == 200) {
      return response.body;
    }

    return null;
  }

  Future<MenuItemsByCategoryResponse> getMenuItemsByCategory(
      BuildContext context, String categoryId) async {
    final response =
        await Provider.of<RestaurantApiService>(context, listen: false)
            .getMenuItemsByCategory(categoryId);
    if (response.statusCode == 200) {
      return response.body;
    }

    return null;
  }
}
