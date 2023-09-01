import 'package:flutter/material.dart';
import 'package:neabuy/models/store.dart';

class ProductDetailsModal extends StatefulWidget {
  final Product product;
  final Function(int) addToCartCallback;

  ProductDetailsModal({
    required this.product,
    required this.addToCartCallback,
  });

  @override
  _ProductDetailsModalState createState() => _ProductDetailsModalState();
}

class _ProductDetailsModalState extends State<ProductDetailsModal> {
  int _quantity = 1;

  void _incrementQuantity() {
    setState(() {
      _quantity++;
    });
  }

  void _decrementQuantity() {
    if (_quantity > 1) {
      setState(() {
        _quantity--;
      });
    }
  }

  void _addToCart() {
    // Call the addToCartCallback function to add the product to the cart
    widget.addToCartCallback(_quantity);

    // Display a snackbar to confirm that the product has been added to the cart
    final snackBar = SnackBar(
      content: Text('${widget.product.name} has been successfully added to the cart'),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);

    // Close the modal
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    // Calculate the maximum height for the description container (30% of the screen height)
    final screenHeight = MediaQuery.of(context).size.height;
    final maxHeight = screenHeight * 0.3;

    // Calculate the maximum width for the description container (60% of the screen width)
    final screenWidth = MediaQuery.of(context).size.width;
    final maxWidth = screenWidth * 0.6;

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        constraints: BoxConstraints(
          maxHeight: maxHeight, // Set maximum height
          maxWidth: maxWidth,   // Set maximum width
        ),
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Description:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              widget.product.description,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                IconButton(
                  onPressed: _decrementQuantity,
                  icon: Icon(Icons.remove),
                ),
                Text(
                  _quantity.toString(),
                  style: TextStyle(fontSize: 18),
                ),
                IconButton(
                  onPressed: _incrementQuantity,
                  icon: Icon(Icons.add),
                ),
              ],
            ),
           ElevatedButton(
  onPressed: _addToCart,
  child: Text('Add to Cart - \$${(widget.product.totalPriceIncludingTax * _quantity).toStringAsFixed(2)}'), // Use totalPriceIncludingTax
),

          ],
        ),
      ),
    );
  }
}
