import 'package:coffee_shop_app/data/drinks_data.dart';
import 'package:coffee_shop_app/data/offers_data.dart';
import 'package:coffee_shop_app/models/cart_item.dart';
import 'package:coffee_shop_app/models/drink.dart';
import 'package:coffee_shop_app/models/offer.dart';
import 'package:coffee_shop_app/screens/drink_details.dart';
import 'package:coffee_shop_app/screens/special_offer.dart';
import 'package:coffee_shop_app/widgets/category_button.dart';
import 'package:coffee_shop_app/widgets/item_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({required this.cart, required this.favList, super.key});
  final List<Drink> favList;
  final List<CartItem> cart;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? searchText;
  List<Drink> drinksList = drinks;
  List<Offer> offersList = offers;
  String selectedCategory = "cappuccino";
  Widget? content;
  List<Drink>? cappuccinoDrinks;
  List<Drink>? coldDrinks;
  List<Drink>? expressoDrinks;

  @override
  initState() {
    super.initState();
    cappuccinoDrinks = drinksList.where((drink) {
      return drink.category == Category.cappuccino;
    }).toList();
    coldDrinks = drinksList.where((drink) {
      return drink.category == Category.coldBrew;
    }).toList();
    expressoDrinks = drinksList.where((drink) {
      return drink.category == Category.expresso;
    }).toList();

    content = GridView.builder(
      padding: const EdgeInsets.only(right: 18),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 18,
        crossAxisSpacing: 18,
        childAspectRatio: 0.86,
      ),
      itemCount: cappuccinoDrinks!.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DrinkDetails(
                  cart: widget.cart,
                  favoriteDrinks: widget.favList,
                  drink: cappuccinoDrinks![index],
                ),
              ),
            );
          },
          child: ItemCard(drink: cappuccinoDrinks![index]),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 20, vertical: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Sip Something Great",
            style: GoogleFonts.lato(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 35),
          Container(
            width: 343,
            height: 53,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 248, 247, 250),
              borderRadius: BorderRadius.circular(100),
              border: Border.all(
                color: const Color.fromARGB(255, 203, 203, 212),
                width: 1,
              ),
            ),
            child: Center(
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.search, color: Colors.grey, size: 27),
                  ),
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        searchText = value;
                      },
                      decoration: InputDecoration(
                        hintText: 'Search Coffee..',
                        hintStyle: GoogleFonts.lato(
                          color: Color.fromARGB(255, 203, 203, 212),
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),

                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.tune_rounded,
                      color: Color.fromARGB(255, 132, 96, 70),
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 35),
          Text(
            "Categories",
            style: GoogleFonts.lato(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 23),
          Row(
            children: [
              CategoryButton(
                name: "Cappuccino",
                imgPath: "assets/cappuccino.png",
                isTapped: selectedCategory == "cappuccino",
                onTap: () {
                  setState(() {
                    selectedCategory = "cappuccino";
                    content = GridView.builder(
                      padding: const EdgeInsets.only(right: 18),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 18,
                        crossAxisSpacing: 18,
                        childAspectRatio: 0.86,
                      ),
                      itemCount: cappuccinoDrinks!.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => DrinkDetails(
                                  cart: widget.cart,
                                  favoriteDrinks: widget.favList,
                                  drink: cappuccinoDrinks![index],
                                ),
                              ),
                            );
                          },
                          child: ItemCard(drink: cappuccinoDrinks![index]),
                        );
                      },
                    );
                  });
                },
              ),
              SizedBox(width: 17),
              CategoryButton(
                name: "Cold Brew",
                imgPath: "assets/vector.png",
                isTapped: selectedCategory == "cold-brew",
                onTap: () {
                  setState(() {
                    selectedCategory = "cold-brew";
                    content = GridView.builder(
                      padding: const EdgeInsets.only(right: 18),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 18,
                        crossAxisSpacing: 18,
                        childAspectRatio: 0.86,
                      ),
                      itemCount: coldDrinks!.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => DrinkDetails(
                                  cart: widget.cart,
                                  favoriteDrinks: widget.favList,
                                  drink: coldDrinks![index],
                                ),
                              ),
                            );
                          },
                          child: ItemCard(drink: coldDrinks![index]),
                        );
                      },
                    );
                  });
                },
              ),
              SizedBox(width: 17),
              CategoryButton(
                name: "Expresso",
                imgPath: "assets/expresso.png",
                isTapped: selectedCategory == "expresso",
                onTap: () {
                  setState(() {
                    selectedCategory = "expresso";
                    content = GridView.builder(
                      padding: const EdgeInsets.only(right: 18),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 18,
                        crossAxisSpacing: 18,
                        childAspectRatio: 0.86,
                      ),
                      itemCount: expressoDrinks!.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => DrinkDetails(
                                  cart: widget.cart,
                                  favoriteDrinks: widget.favList,
                                  drink: expressoDrinks![index],
                                ),
                              ),
                            );
                          },
                          child: ItemCard(drink: expressoDrinks![index]),
                        );
                      },
                    );
                  });
                },
              ),
            ],
          ),
          SizedBox(height: 10),
          Expanded(child: content!),
          SizedBox(height: 30),

          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SpecialOffer(offersList: offersList),
                ),
              );
            },
            child: Container(
              height: 65,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(40),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(
                      255,
                      101,
                      100,
                      100,
                    ).withOpacity(0.08),
                    blurRadius: 4,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Row(
                    children: [
                      Text(
                        "Explore special offers",
                        style: GoogleFonts.lato(
                          color: const Color.fromARGB(255, 132, 96, 70),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Image.asset("assets/fire.png", height: 18, width: 18),
                    ],
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 16,
                    color: const Color.fromARGB(255, 132, 96, 70),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
