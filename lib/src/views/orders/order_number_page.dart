import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quick_eats/src/models/order.dart';

import '../../quick_eats_routes.dart';

class OrderNumberPage extends StatelessWidget {
  final Order order;
  OrderNumberPage(this.order);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          order.orderId,
          style: TextStyle(fontSize: 25),
        ),
      ),
      bottomNavigationBar: Container(
        alignment: AlignmentDirectional.center,
        color: Colors.yellow[800],
        height: 50,
        child: GestureDetector(
          child: Text(
            "Confirm Order Received",
          ),
          onTap: () {
            _showDialog(context);
            //Navigator.of(context).push(new MaterialPageRoute(builder: (context) => new OrderNumberPage(widget.order)));
          },
        ),
      ),
    );
  }

  _showDialog(BuildContext context){
    showDialog(context: context,
    builder: (BuildContext context){
      return AlertDialog(title: Text("Confirmation"),
      content: Text("Did you receive the order?"),
      
      actions: [
        FlatButton(child: Text("Yes"),
        onPressed: (){
          Navigator.of(context).pop();
          //Navigator.of(context).pushNamed(QuickEatsRoutes.home);
          Navigator.of(context).pushNamed(QuickEatsRoutes.rateOrder, arguments: order);
         // Navigator.of(context).push(new MaterialPageRoute(builder: (context) => new RateOrderPage()));
        },),
        FlatButton(child: Text("No"),
        onPressed: (){
          Navigator.of(context).pop();
        },)
      ],);
    });
  }
}
