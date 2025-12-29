import 'package:coffee_shop_app/models/cart_item.dart';
import 'package:coffee_shop_app/widgets/cart_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum Location { beirut, sidon, nabatiye, tyre, baalbek, byblos }

class Cart extends StatefulWidget {
  const Cart({required this.cartItems, super.key});
  final List<CartItem> cartItems;

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  Location _selectedLocation = Location.beirut;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
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
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: widget.cartItems.length,
            itemBuilder: (context, i) {
              return CartCard(
                cartItems: widget.cartItems,
                cartItem: widget.cartItems[i],
              );
            },
          ),

          DropdownButton(
            value: _selectedLocation,

            items: Location.values.map((location) {
              return DropdownMenuItem(
                value: location,
                child: Text(
                  location.name.toUpperCase(),
                  style: GoogleFonts.lato(
                    color: Color.fromARGB(255, 132, 96, 70),
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              );
            }).toList(),
            onChanged: (value) {
              if (value == null) {
                return;
              }
              setState(() {
                _selectedLocation = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
