import 'package:quick_eats/src/models/menu_item.dart';
import 'package:quick_eats/src/models/menu_item_extras_panel.dart';

class CartItem {
  // String name;
  // double price;
  // String description;
  MenuItem menuItem;
  int quantity;
  List<MenuExtraItem> items;
  CartItem(this.menuItem,this.quantity, { this.items});

  double get totalExtrasPrice{
    double total = 0;
    items.forEach((element) => total+=element.price );
    return total;
  }

  double get total{
    return (totalExtrasPrice + menuItem.item_price) * quantity;
  }
}