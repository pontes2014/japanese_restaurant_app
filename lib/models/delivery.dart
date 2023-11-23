import 'package:flutter/material.dart';
import 'package:japanese_restaurant_app/components/custom_row_delevery.dart';
import 'package:provider/provider.dart';

class DeliveryData with ChangeNotifier {
  int _selectedDeliveryIndex = -1;

  int get selectedDeliveryIndex => _selectedDeliveryIndex;

  set selectedDeliveryIndex(int index) {
    _selectedDeliveryIndex = index;
    notifyListeners();
  }
}

class DeliveryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<DeliveryData>(
      builder: (context, deliveryData, child) {
        return Column(
          children: [
            CustomRowDelivery(
              index: 0,
              title: "Standard",
              subtitle: "Today, 20-30 min",
              selectedDeliveryIndex: deliveryData.selectedDeliveryIndex,
              onChanged: (value) {
                onDeliveryRowChanged(context, deliveryData, 0, value);
              },
            ),
            const SizedBox(height: 10),
            CustomRowDelivery(
              index: 1,
              title: "Express",
              subtitle: "Today, 10-15 min",
              selectedDeliveryIndex: deliveryData.selectedDeliveryIndex,
              onChanged: (value) {
                onDeliveryRowChanged(context, deliveryData, 1, value);
              },
            ),
          ],
        );
      },
    );
  }

  void onDeliveryRowChanged(
      BuildContext context, DeliveryData deliveryData, int index, bool? value) {
    if (value == true) {
      deliveryData.selectedDeliveryIndex = index;
    } else {
      deliveryData.selectedDeliveryIndex = -1;
    }
  }
}