import 'package:coffee_shop_app/models/cart_item.dart';
import 'package:coffee_shop_app/widgets/cart_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Cart extends StatefulWidget {
  const Cart({required this.cartItems, super.key});
  final List<CartItem> cartItems;

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Your Order",
          style: GoogleFonts.lato(
            color: Color.fromARGB(255, 0, 0, 0),
            fontWeight: FontWeight.w800,
            fontSize: 24,
          ),
        ),
        SizedBox(height: 30),
        ListView.builder(
          itemCount: widget.cartItems.length,
          itemBuilder: (context, i) {
            return CartCard(
              cartItems: widget.cartItems,
              cartItem: widget.cartItems[i],
            );
          },
        ),
      ],
    );
  }
}
