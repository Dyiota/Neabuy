import 'package:flutter/material.dart';

class DeliveryFeeWidget extends StatelessWidget {
  final double distanceInKm; // Pass the distance as a parameter

  DeliveryFeeWidget({required this.distanceInKm});

  // Define a method to calculate delivery fees based on the distance
  double calculateDeliveryFee() {
    // Define your local business logic here
    double baseFee = 50.0; // Base fee within 4km radius
    double feePerKm = 12.0; // Additional fee per km

    if (distanceInKm <= 4.0) {
      return baseFee;
    } else {
      double extraKm = distanceInKm - 4.0;
      return baseFee + (extraKm * feePerKm);
    }
  }

  @override
  Widget build(BuildContext context) {
    double deliveryFee = calculateDeliveryFee();

    return Text(
      'Delivery Fee: \$${deliveryFee.toStringAsFixed(2)}',
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
