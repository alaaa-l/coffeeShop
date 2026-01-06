import 'package:coffee_shop_app/models/cart_item.dart';
import 'package:coffee_shop_app/models/drink.dart';
import 'package:coffee_shop_app/screens/home_page.dart';
import 'package:coffee_shop_app/screens/tabs.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({required this.cart, required this.favDrinks, super.key});
  final List<Drink> favDrinks;
  final List<CartItem> cart;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/image.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black.withOpacity(0.5),
                Colors.black.withOpacity(0.8),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome to ',
                style: TextStyle(
                  color: Color.fromARGB(201, 248, 247, 247),
                  fontWeight: FontWeight.w600,
                  fontSize: 23,
                ),
              ),

              const SizedBox(height: 13),

              Text(
                'Brew Haven',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 40,
                ),
              ),

              const SizedBox(height: 13),

              Text(
                'Start your day the right way',
                style: TextStyle(
                  color: Color.fromARGB(255, 166, 166, 166),
                  fontWeight: FontWeight.w800,
                  fontSize: 18,
                ),
              ),

              const SizedBox(height: 60),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) =>
                              Tabs(cartItems: cart, favoritesList: favDrinks),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown,

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(40.0),
                      ),
                    ),
                    child: const Text(
                      'Get in Now',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
