import 'package:coffee_shop_app/models/drink.dart';

class CartItem {
  CartItem({
    required this.drink,
    required this.numberOfItems,
    required this.Totalcost,
  });
  Drink drink;
  int numberOfItems;
  double Totalcost;
}
