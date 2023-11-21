class Food {
  String name;
  String price;
  String imagePath;
  String rating;
  String description;

  Food({
    required this.name,
    required this.price,
    required this.imagePath,
    required this.rating,
    required this.description,
  });

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      name: json['name'],
      price: json['price'],
      imagePath: json['imagePath'],
      rating: json['rating'],
      description: json['description'],
    );
  }
}

class ProductList {
  List<Food> products;

  ProductList({required this.products});

  factory ProductList.fromJsonList(List<dynamic> list) {
    List<Food> products = list.map((item) => Food.fromJson(item)).toList();
    return ProductList(products: products);
  }
}
