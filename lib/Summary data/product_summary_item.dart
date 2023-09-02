import 'package:flutter/material.dart';
import 'package:neabuy/models/store.dart'; // Make sure to import the necessary dependencies

class ProductSummaryItem extends StatelessWidget {
  final Product product;
  final int quantity;
  final double totalValue;

  ProductSummaryItem({
    required this.product,
    required this.quantity,
    required this.totalValue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0), // Adjust padding as needed
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black, // Customize border color
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Product: ${product.name}',
            style: TextStyle(
              fontSize: 12, // Customize font size
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Quantity: $quantity',
            style: TextStyle(
              fontSize: 10, // Customize font size
            ),
          ),
          Text(
            'Total Value: \$${totalValue.toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: 10, // Customize font size
            ),
          ),
        ],
      ),
    );
  }
}
