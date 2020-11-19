import 'package:quick_eats/src/models/cart.dart';
import 'package:quick_eats/src/models/enums/order_options.dart';
import 'package:quick_eats/src/models/models.dart';
import 'package:quick_eats/src/models/rating.dart';

class Order{
  Restaurant restaurant;
  OrderOption option;
  DateTime dateTime;
  String orderId;
  Rating rating;
  Cart cart;
}