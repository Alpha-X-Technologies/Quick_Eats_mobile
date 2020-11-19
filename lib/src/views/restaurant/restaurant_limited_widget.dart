import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_eats/blocs/restaurant_bloc/bloc.dart';
import 'package:quick_eats/src/models/models.dart';
import 'package:built_collection/built_collection.dart';
import 'package:quick_eats/src/models/scoped_models.dart';
import 'package:quick_eats/src/views/restaurant/restaurant_list_widget.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../quick_eats_routes.dart';

class RestaurantLimited extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<RestaurantBloc>(context).add(FetchRestaurants());
    return ScopedModelDescendant<ScopedQEModel>(
        builder: (BuildContext context, Widget child, ScopedQEModel model) {
          return Center(
      child: model.restaurants!=null ? buildRestaurantList(context, model.restaurants) : BlocBuilder<RestaurantBloc, RestaurantState>(
        builder: (context, state){
          if(state is RestaurantEmpty){
            return Center(child: CircularProgressIndicator(),);
          }
          if(state is RestaurantLoading){
            return Center(child: CircularProgressIndicator(),);
          }
          if(state is RestaurantLoaded){
            final BuiltList<Restaurant> restaurants = state.restaurants;
            model.populateRestaurants = restaurants;
            return buildRestaurantList(context, restaurants);
          }
          if(state is RestaurantError){
            return Text("Something went wrong!");
          }
          else{
            return Text("Something went wrong!");
          }
        },
      ),
    );});
  }
}
