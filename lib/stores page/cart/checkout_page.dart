import 'package:flutter/material.dart';
import 'package:neabuy/Summary%20data/product_summary_item.dart';
import 'package:neabuy/models/store.dart';
import 'payment/payment_page.dart'; // Import your PaymentPage class

class CheckoutPage extends StatefulWidget {
  final List<Product> cartItems;
  final Map<Product, int> productQuantities;
  final Map<Product, double> productTotalPrices;
  final double totalCost;
  final double distanceInKm;
  final double deliveryFee;

  CheckoutPage({
    required this.cartItems,
    required this.productQuantities,
    required this.productTotalPrices,
    required this.totalCost,
    required this.distanceInKm,
    required this.deliveryFee,
  });

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  String? deliveryAddress;

  @override
  Widget build(BuildContext context) {
    double totalCostWithDelivery = widget.totalCost + widget.deliveryFee;

    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
              color: Colors.blue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Subtotal',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    '\$${widget.totalCost.toStringAsFixed(2)}',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),

            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Product Summary',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),

                  GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 16.0,
                      crossAxisSpacing: 16.0,
                      childAspectRatio: 0.8,
                    ),
                    padding: EdgeInsets.all(16.0),
                    itemCount: widget.cartItems.length,
                    itemBuilder: (BuildContext context, int index) {
                      final product = widget.cartItems[index];
                      final quantity = widget.productQuantities[product] ?? 0;
                      final totalValue = widget.productTotalPrices[product] ?? 0.0;

                      return Padding(
                        padding: EdgeInsets.all(8.0),
                        child: ProductSummaryItem(
                          product: product,
                          quantity: quantity,
                          totalValue: totalValue,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),

            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: [
                  Text(
                    'Cart Summary',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(height: 12.0),
                  Text(
                    'Distance: ${widget.distanceInKm} km',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    'Delivery Fee: \$${widget.deliveryFee.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    'Total Cost (including Delivery): \$${totalCostWithDelivery.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20.0),

            // Display the delivery address here
            Text(
              'Delivery Address: ${deliveryAddress ?? "Not specified"}',
              style: TextStyle(fontSize: 18),
            ),

            SizedBox(height: 20.0),

           ElevatedButton(
  onPressed: () {
    // Navigate to the PaymentPage when the button is pressed
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PaymentPage(),
      ),
    );
  },
  child: Text('Place Order'),
  style: ElevatedButton.styleFrom(
    primary: Colors.blue,
    textStyle: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
  ),
),

          ],
        ),
      ),
    );
  }
}
