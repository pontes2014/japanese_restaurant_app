import 'package:flutter/material.dart';
import 'package:japanese_restaurant_app/components/custom_button.dart';
import 'package:japanese_restaurant_app/models/food.dart';
import 'package:japanese_restaurant_app/models/shop.dart';
import 'package:japanese_restaurant_app/theme/colors.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  // remove from cart
  void removeFromCart(Food food, BuildContext context) {
    // get access to shop
    final shop = context.read<Shop>();

    // remove from cart
    shop.removeFromCart(food);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(builder: (context, value, child) {
      return Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          title: const Text('Cart'),
          centerTitle: true,
          backgroundColor: primaryColor,
          elevation: 0,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: value.cart.length,
                  itemBuilder: (context, index) {
                    // get food from cart
                    final Food food = value.cart[index];

                    // get food name
                    final String foodName = food.name;

                    // get food price
                    final String foodPrice = food.price;

                    // return list tile
                    return Container(
                      decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(10)),
                      margin:
                          const EdgeInsets.only(left: 20, top: 20, right: 20),
                      child: ListTile(
                        title: Text(
                          foodName,
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          foodPrice,
                          style: TextStyle(color: Colors.grey[200]),
                        ),
                        trailing: IconButton(
                            onPressed: () => removeFromCart(food, context),
                            icon: Icon(
                              Icons.delete,
                              color: Colors.grey[300],
                            )),
                      ),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(25),
              child: CustomButton(
                text: "Delivery and payment",
                onTap: () {
                  if (value.cart.isNotEmpty) {
                    Navigator.pushNamed(context, '/delivery_page');
                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Empty cart",
                              style: TextStyle(color: Colors.white)),
                          backgroundColor: primaryColor,
                          content: const Text(
                              "Add items to cart before proceeding to delivery and payment.",
                              style: TextStyle(color: Colors.white)),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                "OK",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
              ),
            )
          ],
        ),
      );
    });
  }
}
