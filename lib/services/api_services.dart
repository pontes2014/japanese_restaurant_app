import 'dart:convert';
import 'package:http/http.dart' as http;

class MockApiService {
  static List<Map<String, dynamic>> getMockUsers() {
    final mockUsers = [
      {
        "name": "hot roll",
        "price": "15.99",
        "imagePath": "assets/images/hot_roll.png",
        "rating": "4.9",
        "description":
            "The hot roll is a Japanese fusion dish that combines the warmth of a tempura roll with the kick of spicy mayo. It features a delicious filling of crispy tempura, avocado, and cucumber, rolled in seaweed and rice. Topped with spicy mayo and sesame seeds, it's a perfect blend of textures and flavors."
      },
      {
        "name": "ramen",
        "price": "12.99",
        "imagePath": "assets/images/ramen.png",
        "rating": "4.3",
        "description":
            "Ramen is a comforting Japanese noodle soup dish with a savory broth, Chinese-style wheat noodles, and a variety of toppings. Our ramen includes a rich broth, tender noodles, slices of pork, green onions, and a boiled egg. It's a hearty and flavorful meal."
      },
      {
        "name": "combo",
        "price": "22.99",
        "imagePath": "assets/images/combo.png",
        "rating": "4.9",
        "description":
            "The combo is a well-curated selection of our best dishes, offering a mix of sushi rolls, sashimi, and tempura. Perfect for those who want to experience a variety of flavors in one meal, the combo is great for sharing or satisfying your cravings for different Japanese delicacies."
      },
      {
        "name": "oshizushi",
        "price": "11.99",
        "imagePath": "assets/images/oshizushi.png",
        "rating": "4.8",
        "description":
            "Oshizushi, also known as pressed sushi, is a traditional Japanese dish featuring layers of vinegared rice, fresh fish, and various toppings. Our oshizushi includes carefully selected fish and vibrant vegetables, creating a visually appealing and delicious bite-sized culinary experience."
      },
      {
        "name": "niguiri",
        "price": "11.99",
        "imagePath": "assets/images/niguiri.png",
        "rating": "4.8",
        "description":
            "Niguiri is a classic sushi dish consisting of a small bed of vinegared rice topped with fresh seafood or other ingredients. Our niguiri features high-quality fish, expertly sliced and served over seasoned rice, providing a perfect balance of flavors and textures in each bite."
      },
      {
        "name": "hossomaki",
        "price": "11.99",
        "imagePath": "assets/images/hossomaki.png",
        "rating": "4.9",
        "description":
            "Hossomaki rolls are traditional cylindrical sushi rolls with nori (seaweed) on the outside and rice and fillings on the inside. Our hossomaki includes a variety of fresh ingredients, tightly rolled to create a compact and delightful bite-sized sushi experience."
      },
      {
        "name": "arroz",
        "price": "6.99",
        "imagePath": "assets/images/arroz.png",
        "rating": "4.3",
        "description":
            "Arroz, meaning rice in Spanish, is a simple yet essential dish in Japanese cuisine. Our arroz is prepared with perfectly cooked short-grain rice, seasoned with a touch of soy sauce and mirin. It serves as a versatile and satisfying accompaniment to various Japanese dishes."
      },
      {
        "name": "dango",
        "price": "12.99",
        "imagePath": "assets/images/dango.png",
        "rating": "4.4",
        "description":
            "Dango is a popular Japanese sweet consisting of skewered rice dumplings. Our dango features soft and chewy rice dumplings served on sticks, with a sweet soy glaze. It's a delightful and portable treat enjoyed during festivals and celebrations in Japan."
      },
      {
        "name": "maki",
        "price": "10.99",
        "imagePath": "assets/images/maki.png",
        "rating": "4.9",
        "description":
            "Maki rolls are cylindrical sushi rolls with nori on the outside, rice and fillings on the inside. Our maki includes a variety of creative combinations, featuring fresh ingredients and expertly rolled to create visually appealing and flavorful bite-sized pieces."
      },
      {
        "name": "sanduiche",
        "price": "3.50",
        "imagePath": "assets/images/sanduiche.png",
        "rating": "4.1",
        "description":
            "Sanduiche, a Japanese-style sandwich, offers a unique twist on the classic sandwich. Our sanduiche includes layers of thinly sliced tamagoyaki (Japanese omelet), cucumber, and ham, sandwiched between soft, fluffy Japanese milk bread. It's a tasty and satisfying handheld meal."
      },
      {
        "name": "temaki",
        "price": "5.99",
        "imagePath": "assets/images/temaki.png",
        "rating": "5.0",
        "description":
            "Temaki, or hand-rolled sushi, is a cone-shaped sushi roll with nori on the outside and rice and fillings on the inside. Our temaki features a generous portion of fresh seafood, avocado, and cucumber, expertly hand-rolled to create a delicious and visually appealing cone."
      },
      {
        "name": "taiyaki",
        "price": "2.99",
        "imagePath": "assets/images/taiyaki.png",
        "rating": "2.9",
        "description":
            "Taiyaki is a fish-shaped cake filled with sweet red bean paste. Our taiyaki features a crispy yet fluffy exterior, shaped like a fish, and a generous filling of smooth and sweet red bean paste. It's a popular Japanese street food and a delightful dessert."
      },
      {
        "name": "dorayaki",
        "price": "2.99",
        "imagePath": "assets/images/dorayaki.png",
        "rating": "4.9",
        "description":
            "Dorayaki is a sweet Japanese pancake-like dessert filled with red bean paste. Our dorayaki includes two fluffy pancake layers with a sweet and velvety red bean filling. It's a beloved treat in Japan, often enjoyed with a cup of green tea."
      }
    ];

    return mockUsers;
  }

  static Future<List<Map<String, dynamic>>> getMockUsersAsync() async {
    return getMockUsers();
  }

  static Future<http.Response> getMockUsersHttpResponse() async {
    final mockUsers = getMockUsers();
    final jsonData = jsonEncode(mockUsers);
    return http.Response(jsonData, 200);
  }
}
