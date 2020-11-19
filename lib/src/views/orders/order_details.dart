import 'package:flutter/material.dart';
import 'package:quick_eats/src/models/cart.dart';
import 'package:quick_eats/src/models/cart_item.dart';
import 'package:quick_eats/src/models/enums/order_options.dart';
import 'package:quick_eats/src/models/order.dart';
import 'package:quick_eats/src/utils/custom_text_style.dart';
import 'package:quick_eats/src/views/orders/order_number_page.dart';
import 'package:timeline_tile/timeline_tile.dart';

class OrderDetailsPage extends StatefulWidget {
  final Order order;
  OrderDetailsPage(this.order);
  OrderDetailsState createState() => OrderDetailsState();
}

class OrderDetailsState extends State<OrderDetailsPage> {
  List<bool> expandedBools;
  bool _isDisabled;

  @override
  void initState() {
    expandedBools = [true, false, true];
    _isDisabled = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[Text("Order Details")],
        ),
      ),
      body: SingleChildScrollView(
        child: _buildExpansionList(),
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
    //return Center(child: Text("Details"),);
  }

  Widget _buildBottomBar() {
    setState(() {
      _isDisabled = widget.order.option != OrderOption.done;
    });
    return Container(
      alignment: AlignmentDirectional.center,
      color: _isDisabled ? Colors.grey[400] : Colors.yellow[800],
      height: 50,
      child: GestureDetector(
        child: Text(
          "Confirm Order Received",
          style: TextStyle(
              color: _isDisabled ? Colors.white.withOpacity(0.5) : Colors.white),
        ),
        onTap: () {
          if(!_isDisabled)
          {
            Navigator.of(context).push(new MaterialPageRoute(builder: (context) => new OrderNumberPage(widget.order)));
          }
        },
      ),
    );
  }

  Widget _buildExpansionList() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          expandedBools[index] = !isExpanded;
        });
      },
      children: [
        ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              leading: Icon(Icons.check_circle),
              title: Text(
                "Order No: ${widget.order.orderId}",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Text(!isExpanded ? widget.order.option.toString() : "",
                  style: TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.grey)),
            );
          },
          body: _orderTimeline(widget.order.option),
          isExpanded: expandedBools[0],
        ),
        ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              leading: Icon(Icons.cake),
              title: Text('Food Ordered'),
            );
          },
          body: _buildFoodList(widget.order),
          isExpanded: expandedBools[1],
        ),
        ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              leading: Icon(Icons.list),
              title: Text('Order Summary'),
            );
          },
          body: _buildTotalContainer(widget.order.cart),
          isExpanded: expandedBools[2],
        ),
      ],

      // children: items.map<ExpansionPanel>((OrdersPanelItem item) {
      //   return ExpansionPanel(
      //     headerBuilder: (BuildContext context, bool isExpanded) {
      //       return ListTile(
      //         title: Text("Order Id: #31"),
      //       );
      //     },
      //     canTapOnHeader: true,
      //     body: new Padding(
      //         padding: new EdgeInsets.all(10.0),
      //         child: new Column(
      //             children: buildAddOnsReturn(item.collapsedValues))),
      //     isExpanded: item.isExpanded,
      //   );
      // }).toList(),
    );
  }

  _buildFoodList(Order order) {
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemBuilder: (context, index) {
        return createListViewItem(order.cart.cartItems[index]);
      },
      itemCount: order.cart.cartItems.length,
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

  createListViewItem(CartItem item) {
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 16, right: 16, top: 16),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(16))),
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 8, left: 8, top: 8, bottom: 8),
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.blue.shade200,
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("assets/images/burrito.jpg"))),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(item.menuItem.item_name),
                      Text(
                        extrasText(item),
                        style: CustomTextStyle.textFormFieldRegular
                            .copyWith(color: Colors.grey, fontSize: 14),
                      ),
                      Text(
                        "Restaurant Name",
                        style: CustomTextStyle.textFormFieldBold
                            .copyWith(color: Colors.grey, fontSize: 14),
                      ),
                    ],
                  ),
                ),
                flex: 100,
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _tile(String text, bool coloured,
      {bool isFirst = false, bool isLast = false}) {
    return TimelineTile(
      alignment: TimelineAlign.left,
      isFirst: isFirst,
      isLast: isLast,
      indicatorStyle: IndicatorStyle(
          color: coloured ? Colors.orangeAccent : Colors.grey, width: 25),
      // bottomLineStyle:
      //     LineStyle(color: coloured ? Colors.orangeAccent : Colors.grey),
      topLineStyle:
          LineStyle(color: coloured ? Colors.orangeAccent : Colors.grey),
      rightChild: Container(
        alignment: AlignmentDirectional.centerStart,
        padding: EdgeInsets.all(10),
        constraints: BoxConstraints(minHeight: 50),
        child: Text(text, style: TextStyle(color: coloured ? Colors.black : Colors.black.withOpacity(0.4)),),
      ),
    );
  }

  bool _isAccepted(OrderOption option) {
    return option != OrderOption.notStarted;
  }

  bool _isReady(OrderOption option) {
    return option == OrderOption.done || option == OrderOption.fetched;
  }

  bool _isPickedUp(OrderOption option) {
    return option == OrderOption.fetched;
  }

  Widget _orderTimeline(OrderOption option) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _tile("Order Submitted", true, isFirst: true),
          _tile("Order Accepted", _isAccepted(option)),
          _tile("Order Ready", _isReady(option)),
          _tile("Picked Up", _isPickedUp(option), isLast: true)
        ],
      ),
    );
  }

  Widget _buildTotalContainer(Cart cart) {
    return Container(
        height: 150.0,
        padding: EdgeInsets.only(
          left: 10.0,
          right: 10.0,
        ),
        child: Column(
          children: <Widget>[
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
                  cart.totalPrice.toString(),
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
                  "--",
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
                  cart.discountedPrice.toString(),
                  style: TextStyle(
                      color: Color(0xFF6C6D6D),
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ));
  }
}
