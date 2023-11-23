// delivery_page.dart
import 'package:flutter/material.dart';
import 'package:japanese_restaurant_app/components/custom_button.dart';
import 'package:provider/provider.dart';
import 'package:japanese_restaurant_app/models/delivery.dart';
import 'package:japanese_restaurant_app/theme/colors.dart';

class DeliveryPage extends StatefulWidget {
  const DeliveryPage({Key? key}) : super(key: key);

  @override
  _DeliveryPageState createState() => _DeliveryPageState();
}

class _DeliveryPageState extends State<DeliveryPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DeliveryData(),
      child: Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.location_on_sharp,
                          color: Colors.white, size: 30),
                      SizedBox(width: 5),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Rua Paratinim ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(height: 2),
                          Text("Cidade Antonio Estevao De Carvalho",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12)),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 60),
                  Column(
                    children: [
                      const Row(
                        children: [
                          Text(
                            "Types of deliveries",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          Icon(Icons.help, color: Colors.white, size: 16),
                        ],
                      ),
                      const SizedBox(height: 20),
                      DeliveryList(),
                    ],
                  ),
                ],
              ),
              CustomButton(text: "PayNow", onTap: () {})
            ],
          ),
        ),
      ),
    );
  }
}
