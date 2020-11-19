import 'package:flutter/material.dart';
import 'package:quick_eats/src/datarepo/menu_items.dart';
import 'package:quick_eats/src/models/menu_item.dart';
import 'package:quick_eats/src/utils/custom_text_style.dart';

class FavoritePage extends StatefulWidget {
  @override
  _FavoritePageState createState() => new _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  List<MenuItem> _menuItems;
  final menuItemsList = menuItems;
  bool showCheckboxes;

  @override
  void initState() {
    //_menuItems = new List();
    showCheckboxes = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text("Favourites")],
      )),
      body: _createFavouriteList(menuItemsList),
      //bottomNavigationBar: ,
    );
  }

  _editIcon(){
    return GestureDetector(child: Icon(showCheckboxes ? Icons.delete : Icons.edit),onTap: (){
      setState(() {
        if(showCheckboxes){
        showCheckboxes = false;
      }else{
        showCheckboxes = true;
      }
      });
      
    },);
  }

  _createFavouriteList(List<MenuItem> menuItems) {
    _menuItems = menuItems;
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemBuilder: (context, position) {
        return createFavouriteListItem(_menuItems[position]);
      },
      itemCount: _menuItems.length,
    );
  }

  _showDialog(MenuItem item) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Delete Confirmation"),
            content: Text(
                "Are you sure you want to remove this item from your favourites?"),
            actions: [
              FlatButton(
                child: Text("Yes"),
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {
                    _menuItems.remove(item);
                  });
                },
              ),
              FlatButton(
                child: Text("No"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  createFavouriteListItem(MenuItem item) {
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
                      Text(item.item_name),
                      Text(
                        "Restaurant Name",
                        style: CustomTextStyle.textFormFieldRegular
                            .copyWith(color: Colors.grey, fontSize: 14),
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
                  _showDialog(item);
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
