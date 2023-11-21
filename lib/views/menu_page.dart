import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:japanese_restaurant_app/components/custom_button.dart';
import 'package:japanese_restaurant_app/components/custom_foodtile.dart';
import 'package:japanese_restaurant_app/models/food.dart';
import 'package:japanese_restaurant_app/services/api_services.dart';
import 'package:japanese_restaurant_app/theme/colors.dart';
import 'package:japanese_restaurant_app/views/food_details_page.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  // food menu
  late List<Food> foodMenu = [];

  @override
  void initState() {
    super.initState();

    _loadMenuData();
  }

  Future<void> _loadMenuData() async {
    final apiData = await MockApiService.getMockUsers();  
    setState(() {
      foodMenu = apiData.map((jsonFood) => Food.fromJson(jsonFood)).toList();
    });
  }

  void navigateToItemDetails(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FoodDetailsPage(
          food: foodMenu[index],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          Icons.menu,
          color: Colors.grey[900],
        ),
        title: Text('Tokyo', style: TextStyle(color: Colors.grey[900])),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //promo banner
            Container(
              decoration: BoxDecoration(
                  color: primaryColor, borderRadius: BorderRadius.circular(25)),
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
              padding: const EdgeInsets.all(25),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        //promo message
                        Text(
                          'Get 32% Promo',
                          style: GoogleFonts.dmSerifDisplay(),
                        ),
                        const SizedBox(height: 10),
                        // reddem button
                        CustomButton(
                          text: 'Redeem',
                          onTap: () {},
                        ),
                      ],
                    ),
                    Image.asset(
                      'assets/images/many_sushi.png',
                      height: 100,
                    )
                  ]),
            ),

            const SizedBox(height: 25),

            //search bar
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  hintText: "Search...",
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),

            //menu list
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                "Food Menu",
                style: TextStyle(
                    color: Colors.grey[800],
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),

            const SizedBox(height: 10),

            //popular food

            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: SizedBox(
                height: 300,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: foodMenu.length,
                  itemBuilder: (context, index) => FoodTile(
                    food: foodMenu[index],
                    onTap: () => navigateToItemDetails(index),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(25)),
              margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
              padding: const EdgeInsets.all(20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        //image
                        Image.asset(
                          "assets/images/card_sushi.png",
                          height: 60,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        // name and price
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //name
                            Text(
                              "Salmon Eggs",
                              style: GoogleFonts.dmSerifDisplay(fontSize: 18),
                            ),
                            Text(
                              '\$21.00',
                              style: TextStyle(color: Colors.grey[700]),
                            ),
                          ],
                        ),
                      ],
                    ),
                    // heart
                    const Icon(
                      Icons.favorite,
                      color: Colors.grey,
                      size: 28,
                    ),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
