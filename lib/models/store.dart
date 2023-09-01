class Product {
  final String name;
  final double price;
  final double taxRate;
  final String description;
  final String weight;

  Product({
    required this.name,
    required this.price,
    required this.taxRate,
    required this.description,
    required this.weight,
  });

  double get totalPriceIncludingTax {
    return price * (1 + taxRate);
  }

  get imageUrl => null;
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
