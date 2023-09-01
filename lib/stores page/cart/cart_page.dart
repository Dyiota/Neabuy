import 'package:flutter/material.dart';
import 'package:neabuy/models/store.dart';

class CartPage extends StatefulWidget {
  final List<Product> cartItems;

  CartPage({required this.cartItems});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  Map<Product, int> productQuantities = {};
  bool isCartEmpty = true;

  @override
  void initState() {
    super.initState();
    for (final product in widget.cartItems) {
      productQuantities[product] = productQuantities.containsKey(product)
          ? productQuantities[product]! + 1
          : 1;
    }
    updateCartEmptyState();
  }

  void updateCartEmptyState() {
    setState(() {
      isCartEmpty = productQuantities.isEmpty;
    });
  }

  double calculateTotalCost() {
    double total = 0;
    for (final product in widget.cartItems) {
      final quantity = productQuantities[product] ?? 0;
      total += product.totalPriceIncludingTax * quantity; // Use totalPriceIncludingTax
    }
    return total;
  }

  void increaseQuantity(Product product) {
    setState(() {
      productQuantities[product] = (productQuantities[product] ?? 0) + 1;
    });
  }

  void decreaseQuantity(Product product) {
    setState(() {
      if (productQuantities[product] != 0 && productQuantities[product]! > 1) {
        productQuantities[product] = productQuantities[product]! - 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (isCartEmpty)
              Text(
                'Please add products to the cart',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            if (!isCartEmpty)
              Text(
                'Thank you for choosing Neabuy',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            SizedBox(height: 16),
            if (!isCartEmpty)
              Expanded(
                child: ListView.builder(
                  itemCount: productQuantities.keys.length,
                  itemBuilder: (context, index) {
                    final product = productQuantities.keys.toList()[index];
                    final quantity = productQuantities[product] ?? 0;

                    return Card(
                      elevation: 3,
                      margin: EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        leading: Image.network(product.imageUrl, width: 50, height: 50), // Display the image
                        title: Text(product.name),
                        subtitle: Text('\$${product.totalPriceIncludingTax.toStringAsFixed(2)}'),

                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                decreaseQuantity(product);
                              },
                              icon: Icon(Icons.remove),
                            ),
                            Text('$quantity'),
                            IconButton(
                              onPressed: () {
                                increaseQuantity(product);
                              },
                              icon: Icon(Icons.add),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
