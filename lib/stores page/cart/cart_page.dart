import 'package:flutter/material.dart';
import 'package:neabuy/models/store.dart';
import 'package:neabuy/stores%20page/cart/checkout_page.dart';

class CartPage extends StatefulWidget {
  final List<Product> cartItems;

  CartPage({required this.cartItems});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  Map<Product, int> productQuantities = {};
  bool isCartEmpty = true;
  double totalCost = 0;

  @override
  void initState() {
    super.initState();
    for (final product in widget.cartItems) {
      productQuantities[product] = productQuantities.containsKey(product)
          ? productQuantities[product]! + 1
          : 1;
    }
    updateCartEmptyState();
    calculateTotalCost();
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
      total += product.totalPriceIncludingTax * quantity;
    }
    setState(() {
      totalCost = total;
    });
    return total;
  }

  void decreaseQuantity(Product product) {
    setState(() {
      if (productQuantities[product] != null && productQuantities[product]! > 1) {
        productQuantities[product] = productQuantities[product]! - 1;
      } else {
        productQuantities.remove(product);
        widget.cartItems.remove(product);
      }
      calculateTotalCost();
    });
  }

  void increaseQuantity(Product product) {
    setState(() {
      productQuantities[product] = (productQuantities[product] ?? 0) + 1;
      calculateTotalCost();
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
                        leading: Container(
                          width: 40,
                          height: 40,
                          child: Image.network(
                            product.imageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(product.name),
                        subtitle:
                            Text('\$${product.totalPriceIncludingTax.toStringAsFixed(2)}'),
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
            Text(
              'Total: \$${totalCost.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                double totalCost = 0;
                for (final product in widget.cartItems) {
                  final quantity = productQuantities[product] ?? 0;
                  totalCost += product.totalPriceIncludingTax * quantity;
                }

                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CheckoutPage(
                      cartItems: widget.cartItems,
                      productQuantities: productQuantities,
                      productTotalPrices: calculateProductTotalPrices(),
                      totalCost: totalCost,
                       distanceInKm: 5.0, deliveryFee: 50,
                    ),
                  ),
                );
              },
              child: Text('Proceed to Checkout'),
            ),
          ],
        ),
      ),
    );
  }

  Map<Product, double> calculateProductTotalPrices() {
    final Map<Product, double> productTotalPrices = {};
    for (final product in widget.cartItems) {
      final quantity = productQuantities[product] ?? 0;
      productTotalPrices[product] = product.totalPriceIncludingTax * quantity;
    }
    return productTotalPrices;
  }
}
