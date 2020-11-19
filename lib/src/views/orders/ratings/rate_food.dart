import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quick_eats/src/models/cart_item.dart';
import 'package:quick_eats/src/models/menu_item.dart';

import '../../../quick_eats_routes.dart';

class RateFoodPage extends StatefulWidget {
  final List<CartItem> cartItems;
  final int index;
  RateFoodPage(this.cartItems, {this.index});
  RateFoodState createState() => RateFoodState();
}

class RateFoodState extends State<RateFoodPage> {
  int _index;
  MenuItem currentItem;
  TextEditingController feedbackController;

  bool _isMoreItems() {
    return _index < widget.cartItems.length - 1;
  }

  @override
  void initState() {
    _index = widget.index ?? 0;
    currentItem = widget.cartItems[_index].menuItem;
    feedbackController = new TextEditingController();
    super.initState();
  }

  _showSkipDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Confirmation"),
            content: Text(
                "Rating the food and service helps the vendor offer better service and food. Are you sure you want to skip rating the food? "),
            actions: [
              FlatButton(
                child: Text("Yes"),
                onPressed: () { Navigator.of(context).pop(); Navigator.of(context).pushNamed(QuickEatsRoutes.home);},
              ),
              FlatButton(
                child: Text("No"),
                onPressed: () => Navigator.of(context).pop(),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text("Rate Food Item ${_index + 1} of ${widget.cartItems.length}"),
        actions: [
          GestureDetector(
            child: Padding(
              padding: EdgeInsets.all(5),
              child: Center(
                  child: Text(
                "Skip",
                style: TextStyle(fontSize: 16),
              )),
            ),
            onTap: () {
              _showSkipDialog(context);
            },
          )
        ],
      ),
      body: _bodyWidget(),
      bottomNavigationBar: Container(
        alignment: AlignmentDirectional.center,
        color: Colors.yellow[800],
        height: 50,
        child: GestureDetector(
          child: Text(
            _isMoreItems() ? "Rate Next Item" : "Finish",
          ),
          onTap: () {
            if(_isMoreItems()){
            Navigator.of(context).push(new MaterialPageRoute(
                builder: (context) => new RateFoodPage(
                      widget.cartItems,
                      index: _index + 1,
                    )));
            }
            else{
              Navigator.of(context).pushNamed(QuickEatsRoutes.home);
            }
          },
        ),
      ),
    );
  }

  Widget _bodyWidget() {
    return Column(
      children: [
        Padding(
          child: Center(
            child: Text(currentItem.item_name),
          ),
          padding: EdgeInsets.only(top: 20),
        ),
        SizedBox(
          height: 20,
        ),
        Center(
          child: Text(
            "The vendor will be able to see this review along with your account information",
            textAlign: TextAlign.center,
          ),
        ),
        ButtonBar(
          children: [
            FlatButton(
              child: Icon(Icons.thumb_up),
              onPressed: () {},
            ),
            FlatButton(
              child: Icon(Icons.thumb_down),
              onPressed: () {},
            )
          ],
        ),
        SizedBox(
          height: 25,
        ),
        Padding(
          padding: EdgeInsets.all(2),
          child: Text("Additional Feedback"),
        ),
        Padding(
          padding: EdgeInsets.all(5),
          child: TextFormField(
            maxLines: 6,
            controller: feedbackController,
            textCapitalization: TextCapitalization.sentences,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
                //labelText: "Additional Feedback",
                hintText: "Optional additional feedback to send to vendor"),
          ),
        )
      ],
    );
  }
}
