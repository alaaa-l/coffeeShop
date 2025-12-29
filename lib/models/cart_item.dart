import 'package:coffee_shop_app/models/drink.dart';

class CartItem {
  CartItem({
    required this.drink,
    required this.numberOfItems,
    required this.totalcost,
    required this.selectedSize,
  });
  Drink drink;
  int numberOfItems;
  double totalcost;
  String selectedSize;
}
