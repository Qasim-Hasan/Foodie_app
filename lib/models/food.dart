class Food {
  final String name; // Chicken Burgers
  final String description; // Burger made of chicken, sauce and salads
  final String imagePath; // lib/images/
  final double price; // 10 dollars
  final FoodCategory category; // Burger
  List<Addon> availableAddons; // [Extra Cheese,spice sauce, etc]

  Food({
    required this.imagePath,
    required this.description,
    required this.name,
    required this.price,
    required this.category,
    required this.availableAddons,
  });
}

//Food Categories

enum FoodCategory {
  burgers,
  salads,
  sides,
  desserts,
  drinks,
}

// Food Add on
class Addon {
  String name;
  double price;

  Addon({
    required this.name,
    required this.price,
  });
}
