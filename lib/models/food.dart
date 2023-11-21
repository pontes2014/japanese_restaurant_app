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
      description:
          json['description'], 
    );
  }
}
