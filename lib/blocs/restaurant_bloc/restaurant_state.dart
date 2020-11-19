import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:quick_eats/src/models/menu_item.dart';
import 'package:quick_eats/src/models/menu_item_categories.dart';
import 'package:quick_eats/src/models/models.dart';
import 'package:built_collection/built_collection.dart';
abstract class RestaurantState extends Equatable {
  const RestaurantState();
  @override
  List<Object> get props => [];
}


class RestaurantEmpty extends RestaurantState {
 //empty state
}

class RestaurantLoading extends RestaurantState{}
class RestaurantLoaded extends RestaurantState{
  final BuiltList<Restaurant> restaurants;

  RestaurantLoaded( {@required this.restaurants}):assert(restaurants!=null);

  @override
  List<Object> get props => [restaurants];
}

class RestaurantError extends RestaurantState{}

class MenuItemsLoaded extends RestaurantState{
  final BuiltList<MenuItem> items;

  MenuItemsLoaded( {@required this.items}):assert(items!=null);

  @override
  List<Object> get props => [items];
}

class MenuItemsEmpty extends RestaurantState {
 //empty state
}

class MenuItemsLoading extends RestaurantState{}

class MenuItemsError extends RestaurantState{
  final String error;
  MenuItemsError({this.error});
}

class MenuItemsCategoriesEmpty extends RestaurantState {
 //empty state
}
class MenuItemsCategoriesLoading extends RestaurantState{}
class MenuItemsCategoriesLoaded extends RestaurantState{
  final BuiltList<MenuItemCategory> categories;

  MenuItemsCategoriesLoaded( {@required this.categories}):assert(categories!=null);

  @override
  List<Object> get props => [categories];
}

class MenuItemsCategoriesError extends RestaurantState{}