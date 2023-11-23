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
  List<Food> foodList;
  List<Food> drinksList;
  List<Food> dessertList;

  ProductList({
    required this.foodList,
    required this.drinksList,
    required this.dessertList,
  });

  factory ProductList.fromJson(Map<String, dynamic> json) {
    List<dynamic> foodJsonList = json['produtos']['food'];
    List<dynamic> drinksJsonList = json['produtos']['drinks'];
    List<dynamic> dessertJsonList = json['produtos']['dessert'];

    List<Food> foodList =
        foodJsonList.map((item) => Food.fromJson(item)).toList();
    List<Food> drinksList =
        drinksJsonList.map((item) => Food.fromJson(item)).toList();
    List<Food> dessertList =
        dessertJsonList.map((item) => Food.fromJson(item)).toList();

    return ProductList(
      foodList: foodList,
      drinksList: drinksList,
      dessertList: dessertList,
    );
  }
}
