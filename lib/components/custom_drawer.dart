import 'package:flutter/material.dart';
import 'package:japanese_restaurant_app/components/custom_list_tile.dart';
import 'package:japanese_restaurant_app/theme/colors.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: primaryColor,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(
          children: [
            DrawerHeader(
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 80,
                child: Image.asset("assets/images/sushiman.png"),
              ),
            ),
            MyListTile(
                text: "Shop",
                icon: Icons.home,
                ontap: () => {
                      Navigator.pop(context),
                      Navigator.pushNamed(context, "/menu_page"),
                    }),
            MyListTile(
                text: "Cart",
                icon: Icons.shopping_cart,
                ontap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, "/cart_page");
                }),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 25),
          child: MyListTile(
              text: "Exit",
              icon: Icons.logout,
              ontap: () => Navigator.pushNamedAndRemoveUntil(
                  context, "/intro_page", (route) => false)),
        ),
      ]),
    );
  }
}
