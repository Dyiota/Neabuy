class Product {
  final String name;
  final double price;
  final double taxRate;
  final String description;
  final String weight;
  final String imageUrl; // Add this property

  Product({
    required this.name,
    required this.price,
    required this.taxRate,
    required this.description,
    required this.weight,
    required this.imageUrl, // Add this parameter to the constructor
  });

  double get totalPriceIncludingTax {
    return price * (1 + taxRate);
  }


}




class Store {
  final String name;
  final double lat;
  final double long;
  final int deliveryTime;
  final List<Product> products;
  final int starRating;

  Store({
    required this.name,
    required this.lat,
    required this.long,
    required this.deliveryTime,
    required this.products,
    required this.starRating,
  });
}
