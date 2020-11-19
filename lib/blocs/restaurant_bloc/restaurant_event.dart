import 'package:equatable/equatable.dart';
import 'package:quick_eats/blocs/restaurant_bloc/bloc.dart';
import 'package:quick_eats/src/models/menu_item_categories.dart';

abstract class RestaurantEvent extends Equatable {
  const RestaurantEvent();
}

class FetchRestaurants extends RestaurantEvent{

  const FetchRestaurants();

  @override
  List<Object> get props => [];

}

class FetchMenuItemCategories extends RestaurantEvent{
  final List<MenuItemCategory> categories;
  const FetchMenuItemCategories({this.categories});

  @override
  List<Object> get props => [categories];

}

class FetchMenuItems extends RestaurantEvent{
  final String menuId;
  const FetchMenuItems(this.menuId);

  @override
  List<Object> get props => [menuId];

}

class FetchMenuItemsByCategory extends RestaurantEvent{
  final String categoryId;
  const FetchMenuItemsByCategory(this.categoryId);

  @override
  List<Object> get props => [categoryId];
}



class GetRestaurantById extends RestaurantEvent{
   final int id;
   const GetRestaurantById(this.id);

  @override
  List<Object> get props => [id];
}
