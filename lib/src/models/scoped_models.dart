import 'package:built_collection/built_collection.dart';
import 'package:quick_eats/src/models/menu_item_categories.dart';
import 'package:scoped_model/scoped_model.dart';

import 'cart.dart';
import 'models.dart';

class ScopedQEModel extends Model {
  Restaurant _currentRestraurant;
  Cart _currentCart;
  List<MenuItemCategory> _categories;
  BuiltList<Restaurant> _restaurants;

  bool showMenuItemWidget;
  String currentCategoryId;

  void selectRestaurant(Restaurant res) {
    _currentRestraurant = res;
    notifyListeners();
  }

  List<MenuItemCategory> get categories {
    return _categories;
  }

  set populateCategories(List<MenuItemCategory> cats) {
    _categories = cats;
  }

  BuiltList<Restaurant> get restaurants {
    return _restaurants;
  }

  set populateRestaurants(BuiltList<Restaurant> res) {
    _restaurants = res;
  }

  Restaurant get currentRestraurant {
    return _currentRestraurant;
  }

  void populateCart(Cart cart) {
    _currentCart = cart;
    notifyListeners();
  }

  void clearCart() {
    _currentCart = null;
  }

  void updateNumberItems(int count) {}

  Cart get currentCart {
    return _currentCart;
  }
}
