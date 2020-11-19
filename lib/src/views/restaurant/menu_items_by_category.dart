import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_eats/blocs/restaurant_bloc/bloc.dart';
import 'package:quick_eats/blocs/restaurant_bloc/restaurant_bloc.dart';
import 'package:quick_eats/blocs/restaurant_bloc/restaurant_state.dart';
import 'package:quick_eats/src/models/menu_item.dart';
import 'package:quick_eats/src/views/vendor/menu_item_card.dart';


class MenuItemsByCategoryPage extends StatelessWidget{
  final String categoryId;
  final String categoryName;
  MenuItemsByCategoryPage(this.categoryId, this.categoryName);
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<RestaurantBloc>(context)
        .add(FetchMenuItemsByCategory(categoryId));
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Filtering on: $categoryName",
        ),
      ),
      body: BlocBuilder<RestaurantBloc, RestaurantState>(
        builder: (context, state) {
          if (state is MenuItemsLoaded) {
            return createMenuItems(state.items.asList());
          }
          if (state is MenuItemsError) {
            return Center(
              child: Text(state.error),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
       ),
    );
  }

  createMenuItems(List<MenuItem> menuItemsList) {
    
    return menuItemsList.length>0 ? ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemBuilder: (context, index) {
        return MenuItemCard(menuItemsList[index]);
      },
      itemCount: menuItemsList.length,
    ) : Center(child: Text("No foods match filter"),);
  }
}
