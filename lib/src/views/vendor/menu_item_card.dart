import 'package:flutter/material.dart';
import 'package:quick_eats/src/data/server_settings.dart';
import 'package:quick_eats/src/models/cart.dart';
import 'package:quick_eats/src/models/menu_item.dart';

import 'menu_item_page.dart';

class MenuItemCard extends StatefulWidget {
  final MenuItem item;
  MenuItemCard(this.item);
  @override
  _MenuItemCardState createState() => _MenuItemCardState();
}

class _MenuItemCardState extends State<MenuItemCard> {
  bool isFavourite;
  @override
  void initState() {
    isFavourite = true;
    super.initState();
  }

  _setFavourite(){
    
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.0, top: 15.0, right: 20.0, bottom: 5.0),
      child: Container(
          child: GestureDetector(
        onTap: () => Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (context) => MenuItemPage(widget.item))),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          child: Column(
            children: <Widget>[
              Stack(
                alignment: Alignment.topRight,
                children: <Widget>[
                  FittedBox(
                    fit: BoxFit.fill,
                    // borderRadius: BorderRadius.only(
                    //     topRight: Radius.circular(10),
                    //     topLeft: Radius.circular(10)),
                    child: widget.item.item_picture_url != null ? Image.network(
                      serverUrl + widget.item.item_picture_url,
                      //fit: BoxFit.fitWidth,
                    ) : FittedBox(
                      child: Image.asset("assets/images/waffle.jpg"),
                      //fit: BoxFit.fitWidth,
                    ),
                    
                  ),
                  GestureDetector(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.grey.withOpacity(0.7),
                      radius: 20.0,
                      child: Icon(
                        Icons.favorite_border,
                        color:isFavourite ? Colors.red : Colors.white,
                        size: 30.0,
                      ),
                    ),
                  ),
                  onTap: (){
                    setState(() {
                      isFavourite = !isFavourite;
                    });
                  },)
                  
                ],
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(child: Text(
                            widget.item.item_name,
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                            ),
                          ),width: MediaQuery.of(context).size.width * 0.60,)
                          ,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          //TODO replace the style with the uniform theme style
                          child: Container(child: 
                          Text(
                            widget.item.item_description,
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.grey,
                            ),
                          ),
                          width: MediaQuery.of(context).size.width * 0.60
                          ,)
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            border: new Border.all(color: Colors.green),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(7.0),
                            child: Text(widget.item.item_price.toStringAsFixed(2)),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
