import 'package:flutter/material.dart';
import 'package:neabuy/models/product_details_modal.dart';
import 'package:neabuy/models/store.dart';
import 'package:neabuy/stores%20page/cart/cart_page.dart';

class ProductsPage extends StatefulWidget {
  final Store store;

  ProductsPage({required this.store});

  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  List<Product> cartItems = []; // List to store products in the cart

  void addToCart(Product product, int quantity) {
    setState(() {
      for (int i = 0; i < quantity; i++) {
        cartItems.add(product);
      }
    });
  }

  // Function to navigate to the cart page
  void navigateToCart() {
    if (cartItems.isEmpty) {
      // Show an alert dialog if the cart is empty
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Cart is Empty"),
            content: Text("Please add products to the cart before proceeding."),
            actions: [
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.pop(context); // Close the dialog.
                },
              ),
            ],
          );
        },
      );
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => CartPage(
            cartItems: cartItems,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products in ${widget.store.name}'),
        actions: [
          IconButton(
            onPressed: navigateToCart, // Navigate to the cart page
            icon: Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(16.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.75,
          mainAxisSpacing: 16.0,
          crossAxisSpacing: 16.0,
        ),
        itemCount: widget.store.products.length,
        itemBuilder: (context, index) {
          final product = widget.store.products[index];

          return GridTile(
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return ProductDetailsModal(
                      product: product,
                      addToCartCallback: (quantity) {
                        addToCart(product, quantity);
                      },
                    );
                  },
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.width * 0.55 - 140,
                      color: Colors.grey[300],
                      child: product.imageUrl != null
                          ? Image.network(product.imageUrl) // Display image if available
                          : Placeholder(), // Placeholder if no image URL is provided
                    ),
                    SizedBox(height: 8.0),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                product.name,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '\$${product.totalPriceIncludingTax.toStringAsFixed(2)}', // Use totalPriceIncludingTax
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 4.0),
                          Container(
                            height: 1,
                            color: Colors.grey[300],
                          ),
                          SizedBox(height: 4.0),
                          Text(
                            "Weight: ${product.weight}",
                            style: TextStyle(fontSize: 10, color: Colors.black54),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
