import 'package:flutter/material.dart';
import 'package:quick_eats/src/views/orders/ongoing_orders.dart';
import 'package:quick_eats/src/views/orders/order_history.dart';

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => new _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  Widget _tabWidget(String text) {
    return Tab(
        child: Container(
      child: Align(
        child: Text(text),
        alignment: Alignment.center,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: Colors.yellow[700]),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
                //backgroundColor: Colors.white,
                title: TabBar(tabs: [
                  //_tabWidget("Ongoing"),
                 // _tabWidget("History")
                  Tab(
                    text: "Ongoing",
                  ),
                  Tab(
                    text: "History",
                  )
                ])),
            body: TabBarView(
              children: [OngoingOrdersPage(), OrderHistoryPage()],
            )));
  }
}
