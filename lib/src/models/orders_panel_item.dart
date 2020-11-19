import 'package:quick_eats/src/models/order.dart';

class OrdersPanelItem{
  OrdersPanelItem({this.collapsedValues, this.isExpanded = false});
  List<Order> collapsedValues;
  bool isExpanded = true;

}