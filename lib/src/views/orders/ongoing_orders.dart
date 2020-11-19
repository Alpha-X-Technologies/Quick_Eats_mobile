import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quick_eats/src/models/cart.dart';
import 'package:quick_eats/src/models/cart_item.dart';
import 'package:quick_eats/src/models/enums/order_options.dart';
import 'package:quick_eats/src/models/menu_item.dart';
import 'package:quick_eats/src/models/menu_item_extras_panel.dart';
import 'package:quick_eats/src/models/models.dart';
import 'package:quick_eats/src/models/order.dart';
import 'package:quick_eats/src/models/rating.dart';
import 'package:quick_eats/src/quick_eats_routes.dart';
import 'package:quick_eats/src/utils/custom_text_style.dart';
import 'package:quick_eats/src/views/orders/order_details.dart';

class OngoingOrdersPage extends StatefulWidget {
  OngoingOrdersState createState() => OngoingOrdersState();
}

class OngoingOrdersState extends State<OngoingOrdersPage> {
  List<Order> _orderList;

  @override
  void initState() {
    _orderList = _generateItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _createOrdersList(),
    );
  }

  Cart _generateCart() {
    Cart cart = new Cart();
    _generateCartItems(5).forEach((element) {
      cart.addToCart(element);
    });
    return cart;
  }

  List<CartItem> _generateCartItems(int count) {
    return List<CartItem>.generate(count, (index) {
      int currentIndex = index + 1;
      MenuItem item = MenuItem((men) => men
        ..item_name = "Food Name $currentIndex"
        ..item_price = currentIndex * 25.0
        ..item_description = "Description $currentIndex");
        List<MenuExtraItem> extras = [new MenuExtraItem(name: 'Sauce $currentIndex',price: 0), new MenuExtraItem(name: 'Chips', price: (currentIndex*2.0))];

      return new CartItem(item, currentIndex, items: extras);
    });
  }

  OrderOption _getOption(int index) {
    switch (index) {
      case 1:
        return OrderOption.notStarted;
      case 2:
        return OrderOption.accepted;
      case 3:
        return OrderOption.done;
      default:
        return OrderOption.fetched;
    }
  }

  List<Order> _generateItems() {
    return List<Order>.generate(4, (index) {
      Order order = new Order();
      int currentIndex = index + 1;
      order.cart = _generateCart();
      order.dateTime = new DateTime(2020, 9, currentIndex, 12, 30);
      order.option = _getOption(currentIndex);
      order.orderId = "QE000$currentIndex";
      order.rating = new Rating(currentIndex == 2 ? null : currentIndex + 1.0);
      order.restaurant = Restaurant(
          (res) => res..restaurant_name = "Restaurant $currentIndex");
      return order;
    });
  }

  _createOrdersList() {
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemBuilder: (context, position) {
        return createOrderListItem(_orderList[position]);
      },
      itemCount: _orderList.length,
    );
  }

  createOrderListItem(Order item) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(left: 16, right: 16, top: 16),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(16))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 5),
                      child: Text(
                        "Order no: ${item.orderId}",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Chip(label: Text(item.option.toString()),),
                    //Padding(child: Chip(label: Text(item.option.toString()),),padding: EdgeInsets.only(bottom: 5),),
                    Padding(child: Text(
                      item.restaurant.restaurant_name,
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                    padding: EdgeInsets.only(bottom: 5),)
                    ,
                    Text(
                      item.dateTime.toString(),
                      style: CustomTextStyle.textFormFieldRegular
                          .copyWith(color: Colors.grey, fontSize: 14),
                    ),
                  ],
                ),
              ),
              //flex: 100,
            ),
            RaisedButton(
              child: Text("Details"),
              onPressed: () {
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (context) => OrderDetailsPage(item)));
              },
            )
          ],
        ),
      ),
    );
  }
}
