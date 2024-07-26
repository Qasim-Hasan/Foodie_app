import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:food/models/cart_item.dart';
import 'package:food/models/food.dart';
import 'package:intl/intl.dart';

class Restaurant extends ChangeNotifier {
  //List of food menu
  final List<Food> _menu = [
    // Burgers
    Food(
      imagePath: "lib/images/burgers/burger_1.png",
      description: "A juicy beef patty with melted cheese",
      name: "Classic Cheese Burger",
      price: 220.0,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 10.0),
        Addon(name: "Extra Sauce", price: 20.0),
        Addon(name: "Bacon", price: 100.0),
        Addon(name: "Extra Fries", price: 150.0),
      ],
    ),
    Food(
      imagePath: "lib/images/burgers/burger_2.png",
      description: "A spicy chicken patty with lettuce",
      name: "Spicy Chicken Burger",
      price: 450.0,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.5),
      ],
    ),
    Food(
      imagePath: "lib/images/burgers/burger_3.png",
      description: "A veggie patty with avocado",
      name: "Veggie Burger",
      price: 950.0,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra Avocado", price: 1.0),
        Addon(name: "Extra Sauce", price: 0.5),
      ],
    ),

    // Desserts
    Food(
      imagePath: "lib/images/desserts/dessert_1.png",
      description: "A slice of rich chocolate cake",
      name: "Chocolate berry Cake",
      price: 500.0,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Extra Cream", price: 0.5),
        Addon(name: "Fruit Topping", price: 0.75),
      ],
    ),
    Food(
      imagePath: "lib/images/desserts/dessert_2.png",
      description: "A serving of vanilla ice cream",
      name: "Vanilla Chocolate Ice Cream",
      price: 300.0,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Chocolate Syrup", price: 0.5),
        Addon(name: "Sprinkles", price: 0.25),
      ],
    ),
    Food(
      imagePath: "lib/images/desserts/dessert_3.png",
      description: "Available in all 3 flavours",
      name: "Sunday Cones",
      price: 440.5,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Berry Topping", price: 0.75),
        Addon(name: "Whipped Cream", price: 0.5),
      ],
    ),

    // Drinks
    Food(
      imagePath: "lib/images/drinks/drink_1.png",
      description: "A refreshing Orange Juice",
      name: "Orange Juice",
      price: 120.0,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Extra Ice", price: 0.25),
        Addon(name: "Mint", price: 0.5),
      ],
    ),
    Food(
      imagePath: "lib/images/drinks/drink_2.png",
      description: "A cold sharbat ",
      name: "Sharbat",
      price: 125.5,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Extra Shot", price: 0.5),
        Addon(name: "Syrup", price: 0.5),
      ],
    ),
    Food(
      imagePath: "lib/images/drinks/drink_3.png",
      description: "A chilled glass of Lemonade",
      name: "Lemonade",
      price: 170.0,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Lemon Slice", price: 0.25),
        Addon(name: "Extra Ice", price: 0.25),
      ],
    ),

    // Salads
    Food(
      imagePath: "lib/images/salads/salad_1.png",
      description: "A fresh green salad with vinaigrette",
      name: "Green Salad",
      price: 600.0,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Extra Dressing", price: 0.5),
        Addon(name: "Grilled Chicken", price: 1.5),
      ],
    ),
    Food(
      imagePath: "lib/images/salads/salad_2.png",
      description: "A Caesar salad with croutons",
      name: "Caesar Salad",
      price: 750.0,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 0.75),
        Addon(name: "Bacon Bits", price: 1.0),
      ],
    ),
    Food(
      imagePath: "lib/images/salads/salad_3.png",
      description: "A mixed fruit salad",
      name: "Fruit Salad",
      price: 500.5,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Yogurt Dressing", price: 0.5),
        Addon(name: "Honey Drizzle", price: 0.5),
      ],
    ),

    // Sides
    Food(
      imagePath: "lib/images/sides/side_1.png",
      description: "A serving of full size platter",
      name: "Vegetable Platter",
      price: 2500.5,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Cheese Sauce", price: 0.75),
        Addon(name: "Ketchup", price: 0.25),
      ],
    ),
    Food(
      imagePath: "lib/images/sides/side_2.png",
      description: "A serving of Chinese Rice",
      name: "Rice",
      price: 130.0,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Ranch Dip", price: 0.5),
        Addon(name: "BBQ Sauce", price: 0.5),
      ],
    ),
    Food(
      imagePath: "lib/images/sides/side_3.png",
      description: "A large french fries",
      name: "French fries",
      price: 200.0,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Extra Garlic", price: 0.25),
        Addon(name: "Cheese Topping", price: 0.5),
      ],
    ),
  ];

  //// GETTERS
  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;

  //// OPERATIONS

  //User cart
  final List<CartItem> _cart = [];
  //Add to the cart
  void addToCart(Food food, List<Addon> selectedAddons) {
    // already have selected item in cart
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      //Check if food items are the same
      bool isSameFood = item.food == food;
      // Check if the list of selected items are same
      bool isSameAddons =
          ListEquality().equals(item.selectedAddons, selectedAddons);

      return isSameFood && isSameAddons;
    });
    //
    if (cartItem != null) {
      cartItem.quantity++;
    }
    // Add A new cart item
    else {
      _cart.add(
        CartItem(
          food: food,
          selectedAddons: selectedAddons,
        ),
      );
    }
    notifyListeners();
  }

  //remove from cart
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        // ignore: collection_methods_unrelated_type
        _cart.remove(cartIndex);
      }
    }
    notifyListeners();
  }

  // Get total price of cart
  double getTotalPrice() {
    double total = 0.0;
    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;
      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }
      total += itemTotal * cartItem.quantity;
    }
    return total;
  }

  // Get total number of items in cart
  int getTotalItems() {
    int totalItemCount = 0;
    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }
    return totalItemCount;
  }

  // Clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  //// HELPER

  // Generate a reciept
  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Here's your Reciept...");
    receipt.writeln();

    //Format date to include to  seconds only
    String formattedDate =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln("---------");

    for (final cartItem in _cart) {
      receipt.writeln(
          "${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}");
      if (cartItem.selectedAddons.isNotEmpty) {
        receipt
            .writeln("    Add-Ons: ${_formatAddons(cartItem.selectedAddons)}");
      }
      receipt.writeln();
    }

    receipt.writeln("----------");
    receipt.writeln();
    receipt.writeln("Total_Items:${getTotalItems()}");
    receipt.writeln("Total_Items:${_formatPrice(getTotalPrice())}");

    return receipt.toString();
  }

  // format double value into money
  String _formatPrice(double price) {
    return "\Rs${price.toStringAsFixed(2)}";
  }

  //format list of addons into a string summary
  String _formatAddons(List<Addon> addons) {
    return addons
        .map((addon) => "${addon.name} (${_formatPrice(addon.price)})")
        .join(", ");
  }
}
