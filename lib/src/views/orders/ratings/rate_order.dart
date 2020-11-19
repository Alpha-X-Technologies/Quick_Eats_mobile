import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:quick_eats/src/models/order.dart';
import 'package:quick_eats/src/views/orders/ratings/rate_food.dart';

import '../../../quick_eats_routes.dart';

class RateOrderPage extends StatefulWidget {
  RateOrderState createState() => RateOrderState();
}

class RateOrderState extends State<RateOrderPage> {
  double rating = 0;
  TextEditingController feedbackController;

  @override
  void initState() {
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
    final Order order = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("Rate Order"),
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 120,
            //margin: EdgeInsets.only(top: ),
            height: 150,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/chubbys.png")),
                borderRadius: BorderRadius.all(Radius.circular(24))),
          ),
          Center(
            child: Text(
              "The vendor will be able to see this review along with your account information",
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Center(
            child: StarRating(
              starCount: 5,
              size: 40.0,
              color: Theme.of(context).accentColor,
              borderColor: Theme.of(context).accentColor,
              onRatingChanged: (currentRating) {
                setState(() {
                  rating = currentRating;
                });
              },
              rating: rating,
            ),
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
      ),
      bottomNavigationBar: Container(
        alignment: AlignmentDirectional.center,
        color: Colors.yellow[800],
        height: 50,
        child: GestureDetector(
          child: Text(
            "Continue",
          ),
          onTap: () {
            // _showDialog(context);
            order.rating.rating = rating;
            order.rating.feedback = feedbackController.text;
            Navigator.of(context).push(new MaterialPageRoute(
                builder: (context) => new RateFoodPage(order.cart.cartItems)));
          },
        ),
      ),
    );
  }
}
