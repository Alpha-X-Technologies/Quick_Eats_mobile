import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_eats/blocs/restaurant_bloc/bloc.dart';
import 'package:quick_eats/src/data/server_settings.dart';
import 'package:quick_eats/src/datarepo/menu_items.dart';
import 'package:quick_eats/src/models/Enums/cart_enum.dart';
import 'package:quick_eats/src/models/cart.dart';
import 'package:quick_eats/src/models/menu_item.dart';
import 'package:quick_eats/src/models/models.dart';
import 'package:quick_eats/src/models/scoped_models.dart';
import 'package:quick_eats/src/ui_reusable/bottom_cart_widget.dart';
import 'package:quick_eats/src/views/vendor/menu_item_card.dart';
import 'package:scoped_model/scoped_model.dart';

class RestaurantLanding extends StatelessWidget {
  final Restaurant restaurant;

  RestaurantLanding({this.restaurant});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<RestaurantBloc>(context)
        .add(FetchMenuItems(restaurant.menus.elementAt(0).id));
    return ScopedModelDescendant<ScopedQEModel>(
        builder: (BuildContext context, Widget child, ScopedQEModel model) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30.0),
                      bottomRight: Radius.circular(30.0),
                    )),
                    child: restaurant.picture_url == null
                        ? Image.asset(
                            "assets/images/burrito.jpg",
                            fit: BoxFit.fitWidth,
                          )
                        : Image.network(
                            serverUrl + restaurant.picture_url,
                            fit: BoxFit.fitWidth,
                          ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 40.0),
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 15.0,
                        child: Icon(
                          Icons.keyboard_arrow_left,
                          color: Colors.black,
                          size: 20.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              Padding(
                padding: EdgeInsets.all(10.0),
                //TODO replace the style with the uniform theme style
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "${restaurant != null ? restaurant.restaurant_name : model.currentRestraurant.restaurant_name}",
                      style: TextStyle(fontSize: 20.0, color: Colors.black),
                    ),
                    Spacer(),
                    //TODO: vendor profile
                    // CircleAvatar(
                    //   backgroundColor: Colors.grey.withOpacity(0.7),
                    //   radius: 18.0,
                    //   child: Icon(
                    //     Icons.info,
                    //     color: Colors.white,
                    //     size: 26.0,
                    //   ),
                    // ),
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(5.0),
                  //TODO replace the style with the uniform theme style
                  child: Container(
                    child: Text(
                      restaurant.description,
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.grey,
                      ),
                    ),
                    width: MediaQuery.of(context).size.width ,
                  )),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.location_on,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        //TODO replace the style with the uniform theme style
                        Text(
                          "${restaurant != null ? restaurant.address : model.currentRestraurant.address} ",
                          style: TextStyle(fontSize: 14.0, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.orange.withOpacity(0.2),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 7.0, right: 7.0, top: 3.0, bottom: 3.0),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.access_time,
                              color: Colors.orange,
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              "Closes in 2hrs",
                              style: TextStyle(
                                  color: Colors.orange,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),

              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 5.0, bottom: 0.0),
                child: Divider(
                  color: Colors.grey.withOpacity(0.8),
                ),
              ),

              // Padding(
              //   padding: const EdgeInsets.only(left:15.0, right: 15.0, top: 15.0),
              //   child: Container(
              //     height: 40.0,
              //     child: Center(
              //       child: Text("<<Add the choice chip here>>"),
              //     ),
              //   ),
              // ),
              BlocBuilder<RestaurantBloc, RestaurantState>(
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
              )
            ],
          ),
        ),
        bottomNavigationBar: model.currentCart == null
            ? null
            : BottomCartToolbar(CartOptions.cart),
      );
    });
  }

  createMenuItems(List<MenuItem> menuItemsList) {
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemBuilder: (context, index) {
        return MenuItemCard(menuItemsList[index]);
      },
      itemCount: menuItemsList.length,
    );
  }
}
