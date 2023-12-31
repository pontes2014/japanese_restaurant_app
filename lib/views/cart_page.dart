import 'package:flutter/material.dart';
import 'package:japanese_restaurant_app/components/custom_button.dart';
import 'package:japanese_restaurant_app/models/food.dart';
import 'package:japanese_restaurant_app/models/shop.dart';
import 'package:japanese_restaurant_app/theme/colors.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key});

  void removeFromCart(Food food, BuildContext context) {
    final shop = context.read<Shop>();
    shop.removeFromCart(food);
  }

  double calculateTotalPrice(List<Food> cart) {
    double totalPrice = 0;

    for (Food food in cart) {
      double price = double.tryParse(food.price) ?? 0;
      totalPrice += price;
    }

    return totalPrice;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(builder: (context, value, child) {
      double totalPrice = calculateTotalPrice(value.cart);

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
                  final Food food = value.cart[index];
                  final String foodName = food.name;
                  final String foodPrice = food.price;
                  final String foodImagePath = food.imagePath;

                  return Container(
                    decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: const EdgeInsets.only(left: 20, top: 20, right: 20),
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: SizedBox(
                        width: 50,
                        height: 50,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            foodImagePath,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      title: Text(
                        foodName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
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
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25),
              child: CustomButton(
                icon: Icons.arrow_forward_rounded,
                text: "Delivery and payment \$${totalPrice.toStringAsFixed(2)}",
                onTap: () {
                  if (value.cart.isNotEmpty) {
                    Navigator.pushNamed(context, '/delivery_page');
                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
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
            ),
          ],
        ),
      );
    });
  }
}
