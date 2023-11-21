import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:japanese_restaurant_app/components/custom_button.dart';
import 'package:japanese_restaurant_app/theme/colors.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // shop name
              Text(
                "SUSHI MAN",
                style: GoogleFonts.dmSerifDisplay(
                    color: Colors.white, fontSize: 28),
              ),

              // icon
              Image.asset(
                'assets/images/sushiman.png',
              ),
              const SizedBox(
                height: 25,
              ),
              // title
              Text(
                "THE TASTE OF JAPANESE FOOD",
                style: GoogleFonts.dmSerifDisplay(
                    fontSize: 35, color: Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),
              // subtitle
              Text(
                "Feel the taste of the most popular Japanese food anywhere and anytime",
                style: GoogleFonts.dmSerifDisplay(
                    color: Colors.grey[300], height: 2),
              ),
              // get started button
              const SizedBox(
                height: 25,
              ),
              CustomButton(
                  text: 'Get Started',
                  onTap: () {
                    // go to menu page
                    Navigator.pushNamed(context, '/menu_page');
                  }),
            ]),
      ),
    );
  }
}
