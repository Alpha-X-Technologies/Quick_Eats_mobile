import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_eats/blocs/restaurant_bloc/bloc.dart';
import 'package:quick_eats/blocs/restaurant_bloc/menu_categories_bloc.dart';
import 'package:quick_eats/blocs/restaurant_bloc/restaurant_bloc.dart';
import 'package:quick_eats/src/models/menu_item_categories.dart';
import 'package:quick_eats/src/models/scoped_models.dart';
import 'package:scoped_model/scoped_model.dart';
import 'food_card.dart';

import 'package:quick_eats/src/models/category_model.dart';
//import the data from fake(for now) repo
import 'package:quick_eats/src/datarepo/category_data.dart';

class FoodCategory extends StatelessWidget {
  //final List<Category> _categories = categories;
  Widget _listView(List<MenuItemCategory> categories) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          return FoodCard(
            categories[index].name,
            categories[index].pictureUrl,
            categories[index].id,
            numberOfItems: index,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ScopedQEModel>(
        builder: (BuildContext context, Widget child, ScopedQEModel model) {
      if (model.categories == null) {
        BlocProvider.of<MenuCategoriesBloc>(context)
            .add(FetchMenuItemCategories());
      }
      return Container(
          height: 80.0,
          child: model.categories != null
              ? _listView(model.categories)
              : BlocBuilder<MenuCategoriesBloc, RestaurantState>(
                  builder: (context, state) {
                  if (state is MenuItemsCategoriesLoaded) {
                    model.populateCategories = state.categories.asList();
                    return _listView(state.categories.asList());
                  }
                  if (state is MenuItemsCategoriesEmpty) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is MenuItemsCategoriesLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Text("Something went wrong!");
                  }
                }));
    });
  }
}
