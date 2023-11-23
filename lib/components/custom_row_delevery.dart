import 'package:flutter/material.dart';
import 'package:japanese_restaurant_app/theme/colors.dart';

class CustomRowDelivery extends StatelessWidget {
  final int index;
  final String title;
  final String subtitle;
  final int selectedDeliveryIndex;
  final Function(bool?) onChanged;

  CustomRowDelivery({
    required this.index,
    required this.title,
    required this.subtitle,
    required this.selectedDeliveryIndex,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: secondaryColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Text("Free", style: TextStyle(color: Colors.white)),
              Checkbox(
                shape: const CircleBorder(),
                checkColor: Colors.white,
                activeColor: Colors.transparent,
                value: selectedDeliveryIndex == index,
                onChanged: onChanged,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
