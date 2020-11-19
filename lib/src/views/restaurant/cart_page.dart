import 'package:flutter/material.dart';
import 'package:quick_eats/src/models/Enums/cart_enum.dart';
import 'package:quick_eats/src/models/cart_item.dart';
import 'package:quick_eats/src/models/cart.dart';
import 'package:quick_eats/src/models/scoped_models.dart';
import 'package:quick_eats/src/ui_reusable/bottom_cart_widget.dart';
import 'package:quick_eats/src/utils/custom_text_style.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../quick_eats_routes.dart';

class CartPage extends StatefulWidget {
  @override
  CartPageState createState() => CartPageState();
}

class CartPageState extends State<CartPage> {
  List<CartItem> _cartItems;
  double discountPercantage = 0.1;
  double totalPrice;
  TextEditingController instructionController;

  @override
  void initState() {
    _cartItems = [];
    instructionController = new TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ScopedQEModel>(
          builder: (BuildContext context, Widget child, ScopedQEModel model){
    return Scaffold(
      appBar: AppBar(
          title: Row(
        children: <Widget>[Text("Cart")],
      )),
      body: _buildTotalContainer(model)
    );
          });
  }

  createCartList(List<CartItem> cartItems) {
    _cartItems = cartItems;
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemBuilder: (context, position) {
        return createCartListItem(_cartItems[position]);
      },
      itemCount: _cartItems.length,
    );
  }

  _createSpecialInstructionWidget(){
    return Padding(
          padding: EdgeInsets.all(8),
          child: TextFormField(
            maxLines: 4,
            controller: instructionController,
            textCapitalization: TextCapitalization.sentences,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
                //labelText: "Additional Feedback",
                hintText: "Special instructions to the vendor such as removing any garnishes or any allergy notes or special requests"),
          ),
        );
  }

  String extrasText(CartItem item) {
    var extraItems = item.items;
    StringBuffer sb = new StringBuffer();
    if (extraItems != null) {
      extraItems.forEach((element) {
        sb.write(element.name + "\n");
      });
    }

    return sb.toString();
  }

  double discountAmount(Cart cart){
    double discountAmount = (cart.totalPrice * discountPercantage).floorToDouble();
    cart.setDiscount = discountAmount;
    return discountAmount;
  }

  Widget _buildTotalContainer(ScopedQEModel model) {
    return ListView(
      //height: 350.0,
      padding: EdgeInsets.only(
        left: 10.0,
        right: 10.0,
      ),
        children: <Widget>[
          createCartList(model.currentCart.cartItems),
          _createSpecialInstructionWidget(),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Subtotal",
                style: TextStyle(
                    color: Color(0xFF9BA7C6),
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                model.currentCart.totalPrice.toString(),
                style: TextStyle(
                    color: Color(0xFF6C6D6D),
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Discount",
                style: TextStyle(
                    color: Color(0xFF9BA7C6),
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                discountAmount(model.currentCart).toString(),
                style: TextStyle(
                    color: Color(0xFF6C6D6D),
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          SizedBox(
            height: 10.0,
          ),
          Divider(
            height: 2.0,
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Cart Total",
                style: TextStyle(
                    color: Color(0xFF9BA7C6),
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                model.currentCart.discountedPrice.toString(),
                style: TextStyle(
                    color: Color(0xFF6C6D6D),
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, QuickEatsRoutes.checkOutPage);
            },
            child: Container(
              height: 50.0,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(35.0),
              ),
              child: Center(
                child: Text(
                  "Proceed To Checkout",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
        ],
      
    );
  }

  createCartListItem(CartItem item) {
    return Stack(
      
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 16, right: 16, top: 16),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(16))),
          child: Row(
            children: <Widget>[
              // Container(
              //   margin: EdgeInsets.only(right: 8, left: 8, top: 8, bottom: 8),
              //   width: 80,
              //   height: 80,
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.all(Radius.circular(14)),
              //       color: Colors.blue.shade200,
              //       image: DecorationImage(
              //           image: AssetImage("assets/images/multifood.jpg"))),
              // ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(right: 8, top: 4),
                        child: Text(
                          item.quantity.toString() + " x " + item.menuItem.item_name,
                          maxLines: 2,
                          softWrap: true,
                          style: CustomTextStyle.textFormFieldSemiBold
                              .copyWith(fontSize: 14),
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        extrasText(item),
                        style: CustomTextStyle.textFormFieldRegular
                            .copyWith(color: Colors.grey, fontSize: 14),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              item.total.toStringAsFixed(2),
                              style: CustomTextStyle.textFormFieldBlack
                                  .copyWith(color: Colors.green),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                flex: 100,
              )
            ],
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            width: 24,
            height: 24,
            alignment: Alignment.center,
            margin: EdgeInsets.only(right: 10, top: 8),
            child: GestureDetector(
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 20,
                ),
                onTap: () {
                  setState(() {
                    _cartItems.remove(item);
                  });
                }),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                color: Colors.green),
          ),
        )
      ],
    );
  }
}
