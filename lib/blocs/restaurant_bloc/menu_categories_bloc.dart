import 'package:bloc/bloc.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:quick_eats/blocs/restaurant_bloc/bloc.dart';
import 'package:quick_eats/src/data/cache_manager.dart';
import 'package:quick_eats/src/data/repositories.dart';
import 'package:quick_eats/src/data/server_settings.dart';
import 'package:quick_eats/src/models/menu_item_categories.dart';
import 'package:quick_eats/src/models/models.dart';

class MenuCategoriesBloc extends Bloc<RestaurantEvent, RestaurantState> {
  BuildContext context;
  CustomCacheManager _cacheManager = CustomCacheManager();
   MenuCategoriesBloc({@required this.context});
  @override
  RestaurantState get initialState {
    return  RestaurantEmpty();
  }
   @override
  Stream<RestaurantState> mapEventToState(
    RestaurantEvent event,
  ) async* {
      yield MenuItemsCategoriesLoading();

    if(event is FetchMenuItemCategories){
      try {
        //var file = _cacheManager.getSingleFile(serverUrl + menuItemsPath);
        //file.then((value) => value.)
        
        RestaurantRepository restaurantRepository = new RestaurantRepository();
        final MenuItemCategoriesResponse response = await restaurantRepository.getMenuItemCategories(context);
        final BuiltList<MenuItemCategory> categories = response.categories;//   null;//await restaurantRepository.getAllRestaurants(context);
        yield MenuItemsCategoriesLoaded(categories: categories);
      } catch (e) {
        debugPrint(e);
        yield MenuItemsCategoriesError();
      }
    }
  }
}