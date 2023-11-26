import 'package:flutter/material.dart';
import 'package:japanese_restaurant_app/components/custom_button.dart';
import 'package:japanese_restaurant_app/components/custom_row_delevery.dart';
import 'package:japanese_restaurant_app/theme/colors.dart';
import 'package:provider/provider.dart';
import 'package:japanese_restaurant_app/models/location.dart';

class DeliveryPage extends StatefulWidget {
  const DeliveryPage({Key? key}) : super(key: key);

  @override
  _DeliveryPageState createState() => _DeliveryPageState();
}

class _DeliveryPageState extends State<DeliveryPage> {
  bool isLoading = true;
  int selectedDeliveryIndex = 1;

  void onChanged(bool? value, int index) {
    if (value != null && value) {
      setState(() {
        selectedDeliveryIndex = index;
      });
    }
  }

  @override
  void initState() {
    super.initState();

    LocationController locationController =
        Provider.of<LocationController>(context, listen: false);

    locationController.getPosition().then((_) {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    LocationController locationController =
        Provider.of<LocationController>(context);

    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                isLoading
                    ? const CircularProgressIndicator()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.location_on,
                              color: Colors.white, size: 40),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Rua: ${locationController.road}',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                              Text(
                                'Bairro/Cidade: ${locationController.cityDistrict}',
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'CEP: ${locationController.postcode}',
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                const SizedBox(height: 80),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Types Of Deliveries",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    Icon(Icons.help, color: Colors.white),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomRowDelivery(
                  index: 1,
                  title: "Standard",
                  subtitle: "Today, 20 - 30 min",
                  selectedDeliveryIndex: selectedDeliveryIndex,
                  onChanged: (value) => onChanged(value, 1),
                ),
                const SizedBox(
                    height: 10), // Ajuste o espaçamento conforme necessário
                CustomRowDelivery(
                  index: 2,
                  title: "Express",
                  subtitle: "Today, 10 - 15 min",
                  selectedDeliveryIndex: selectedDeliveryIndex,
                  onChanged: (value) => onChanged(value, 2),
                ),
              ],
            ),
            CustomButton(
                icon: Icons.attach_money,
                text: "PayNow",
                onTap: () {
                  Navigator.pushNamed(context, "/paynow_page");
                })
          ],
        ),
      ),
    );
  }
}
