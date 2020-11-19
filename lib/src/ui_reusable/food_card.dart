import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quick_eats/blocs/restaurant_bloc/restaurant_bloc.dart';
import 'package:quick_eats/src/data/server_settings.dart';
import 'package:quick_eats/src/models/scoped_models.dart';
import 'package:quick_eats/src/views/restaurant/menu_items_by_category.dart';
import 'package:scoped_model/scoped_model.dart';

class FoodCard extends StatelessWidget {
  final String categoryName;
  final String imagePath;
  final int numberOfItems;
  final String categoryId;

  FoodCard(this.categoryName, this.imagePath, this.categoryId,
      {this.numberOfItems});

  bool _isSvg(String path) {
    return path.contains(".svg");
  }

  Widget _imageWidget(String path) {
    return _isSvg(path)
        ? SvgPicture.network(
            serverUrl + path,
            height: 65.0,
            width: 65.0,
          )
        : Image(
            image: NetworkImage(serverUrl + imagePath),
            height: 65.0,
            width: 65.0,
          );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(right: 20.0),
        child: Card(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Row(
              children: <Widget>[
                _imageWidget(imagePath),
                SizedBox(
                  width: 20.0,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      categoryName,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.0),
                    ),
                    Text("$numberOfItems kinds"),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      onTap: () {
        Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context) => BlocProvider<RestaurantBloc>(
                  child: MenuItemsByCategoryPage(categoryId,categoryName),
                  create: (BuildContext context) =>
                      RestaurantBloc(context: context),
                )),
      );
      },
    );
  }
}
