import 'package:coffee_shop_app/models/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartCard extends StatefulWidget {
  const CartCard({required this.cartItems, required this.cartItem, super.key});
  final CartItem cartItem;
  final List<CartItem> cartItems;

  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(context),
      onDismissed: (direction) => widget.cartItems.remove(widget.cartItem),
      child: Card(
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(35),
                child: Image.asset(
                  widget.cartItem.drink.imagePath,
                  width: 120,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 15),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.cartItem.drink.name,
                    style: GoogleFonts.lato(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '\$ ${widget.cartItem.Totalcost}',
                    style: GoogleFonts.lato(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 5),
              IconButton(
                onPressed: () {
                  setState(() {
                    if (widget.cartItem.numberOfItems > 1) {
                      widget.cartItem.numberOfItems--;
                    } else {
                      widget.cartItem.numberOfItems = 1;
                    }
                  });
                },
                icon: Icon(Icons.remove),
              ),
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(255, 132, 96, 70),
                ),
                child: Center(
                  child: Text(
                    '${widget.cartItem.numberOfItems}',
                    style: GoogleFonts.lato(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    widget.cartItem.numberOfItems++;
                  });
                },
                icon: Icon(Icons.add),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
