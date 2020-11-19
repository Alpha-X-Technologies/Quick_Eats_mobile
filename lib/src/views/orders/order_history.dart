import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:quick_eats/src/models/cart.dart';
import 'package:quick_eats/src/models/cart_item.dart';
import 'package:quick_eats/src/models/enums/order_options.dart';
import 'package:quick_eats/src/models/menu_item.dart';
import 'package:quick_eats/src/models/menu_item_extras_panel.dart';
import 'package:quick_eats/src/models/models.dart';
import 'package:quick_eats/src/models/order.dart';
import 'package:quick_eats/src/models/orders_panel_item.dart';
import 'package:quick_eats/src/models/rating.dart';
import 'package:quick_eats/src/models/scoped_models.dart';
import 'package:quick_eats/src/quick_eats_routes.dart';
import 'package:quick_eats/src/utils/custom_text_style.dart';
import 'package:scoped_model/scoped_model.dart';

class OrderHistoryPage extends StatefulWidget {
  OrderHistoryState createState() => OrderHistoryState();
}

class OrderHistoryState extends State<OrderHistoryPage> {
  List<Order> _orders;
  //List<OrdersPanelItem> _orderPanelItems;

  @override
  void initState() {
    _orders = new List();
    _orders = _generateItems();
//_orderPanelItems = _generateOrderItems();
    super.initState();
  }

  Cart _generateCart(int count) {
    Cart cart = new Cart();
    _generateCartItems(count).forEach((element) {
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
      order.cart = _generateCart(currentIndex);
      order.dateTime = new DateTime(2020, 9, currentIndex, 12, 30);
      order.option = _getOption(currentIndex);
      order.orderId = "QE000$currentIndex";
      double generatedRating = currentIndex == 2 ? 0 : currentIndex + 1.0;
      order.rating = new Rating(generatedRating);
      order.restaurant = Restaurant(
          (res) => res..restaurant_name = "Restaurant $currentIndex");
      return order;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildListView(),
    );
  }

  _buildListView() {
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemBuilder: (context, position) {
        //return Text("data$position");
        return _createOrdersListItem(_orders[position]);
      },
      itemCount: _orders.length,
    );
  }

  _createOrdersListItem(Order order) {
    return Card(
      margin: EdgeInsets.only(bottom: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Container(
          //     width: 100.0,
          //     height: 100.0,
          //     decoration: new BoxDecoration(
          //       shape: BoxShape.rectangle,
          //       image: new DecorationImage(
          //         image: AssetImage('assets/images/temp_logo.png'),
          //         fit: BoxFit.cover,
          //       ),
          //     )),
          //Text(order.restaurant.restaurant_name),
          //SizedBox(height: 20,),
          _orderDetailsItem(order),
          Divider(
            height: 5,
          ),
          _cartItem(order),
          //Divider(thickness: 2, indent: 2),
          _cartItemPrice(order)
        ],
      ),
    );
  }

  _textColumn(Order order) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "Order #${order.orderId}",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        // Chip(
        //   label: Text(
        //     order.option.toString(),
        //     style: TextStyle(fontWeight: FontWeight.bold),
        //   ),
        //   //avatar: Icon(Icons.check),
        //   backgroundColor: Colors.transparent,
        //   shape: StadiumBorder(side: BorderSide(color: Colors.green)),
        // ),
        // Row(
        //   children: [
        //     Icon(Icons.check),
        //     Text(
        //       order.option.toString(),
        //       style: TextStyle(fontWeight: FontWeight.bold),
        //     ),
        //   ],
        // ),
        Text("${order.dateTime.toString()}", style: CustomTextStyle.textFormFieldLight.copyWith(fontSize:12)),
      ],
    );
  }

  _ratingWidget(Order order) {
    return order.rating.rating > 0
        ? StarRating(
            starCount: 5,
            size: 18.0,
            rating: order.rating.rating,
            color: Theme.of(context).accentColor,
            borderColor: Theme.of(context).accentColor,
          )
        : RaisedButton(
            child: Text("Rate"),
            onPressed: () {
              Navigator.of(context).pushNamed(QuickEatsRoutes.rateOrder, arguments: order);
            },
          );
  }

  _orderDetailsItem(Order order) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _textColumn(order),
          _ratingWidget(order),
        ],
      ),
    );
  }

  _cartItemPrice(Order order) {
    return ScopedModelDescendant<ScopedQEModel>(
        builder: (BuildContext context, Widget child, ScopedQEModel model) {
          return Container(
        //height: 50,
        width: MediaQuery.of(context).size.width,
        child: Column(children: [
          ButtonBar(
            mainAxisSize: MainAxisSize.max,
            alignment: MainAxisAlignment.center,
            buttonMinWidth: MediaQuery.of(context).size.width - 5,
            buttonPadding: EdgeInsets.zero,
            children: [
              // RaisedButton(
              //   child: Text("View Receipt"),
              //   onPressed: () {},
              // ),
              RaisedButton(
                child: Text("Order Again"),
                //TODO populate cart and head to cart page
                onPressed: () {
                  model.populateCart(order.cart);
                  model.selectRestaurant(order.restaurant);
                  Navigator.pushNamed(context, QuickEatsRoutes.cart);
                },
              )
            ],
          )
        ]));});
  }

  String menuItemsText(List<CartItem> items) {
    StringBuffer sb = new StringBuffer();
    items.forEach((element) {
      sb.write("${element.quantity} x ${element.menuItem.item_name} \n");
    });

    return sb.toString();
  }

 List<Widget> _foodItemRows(List<CartItem> items, double price) {
    List<Widget> rows = [];
    items.forEach((element) {
      rows.add(Row(
        children: [
          Padding(padding: EdgeInsets.all(3),child: Badge(shape: BadgeShape.circle,
          toAnimate: false,
          badgeColor: Colors.white,
          badgeContent: Text(element.quantity.toString()),),),
          
          Text(element.menuItem.item_name)
        ],
      ));
    });
    rows.add(Divider(thickness: 0.5,
    color: Colors.black,));
    rows.add(Align(child: Text("Total: $price"),alignment: Alignment.centerRight,) );
    return rows;
  }

  _cartItem(Order order) {
    return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: 
            _foodItemRows(order.cart.cartItems,order.cart.totalPrice)
          
        );
  }
}
