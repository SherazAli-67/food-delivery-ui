import 'package:food_delivery_ui/core/app_icons.dart';
import 'package:food_delivery_ui/core/models/food_model.dart';
import 'package:food_delivery_ui/core/models/meal_model.dart';

class AppData {
  static List<String> get categories => [
    'Promo 2024', 'Popular', 'Recommended'
  ];
  
  static List<FoodModel> get foods => [
    FoodModel(id: 'desi', title: 'Desi', subtitle: 'Get Special Discount.', offPercentageText: 'up to 45%', image: AppIcons.desiFoodImage),
    FoodModel(id: 'thai', title: 'Thai', subtitle: 'Get Special Discount.', offPercentageText: 'up to 50%', image: AppIcons.thaiFoodImage),
    FoodModel(id: 'healthy', title: 'Healthy', subtitle: 'Get Special Discount.', offPercentageText: 'up to 75%', image: AppIcons.healthyFoodImage),
  ];
  
  static List<String> get mealCategories => [
    'Breakfast', 'Dessert', 'Lunch', 'Dinner'
  ];
  
  static List<MealModel> get meals => [
    MealModel(id: '1', title: 'Tom Yum Goong', subtitle: 'Spicy and sour soup with shrimp, mushrooms.', price: 5.59, image: AppIcons.thaiFood1),
    MealModel(id: '2', title: 'Tom Kha Gai', subtitle: 'Coconut milk-based soup with chicken.', price: 3.49, image: AppIcons.thaiFood2),
    MealModel(id: '3', title: 'Massaman Curry', subtitle: 'A mild and creamy curry made with massaman curry.', price: 4.59, image: AppIcons.thaiFood3),
    MealModel(id: '4', title: 'Pad Kra Pao', subtitle: 'With Thai basil, garlic, chili peppers, and soy sauce.', price: 5.59, image: AppIcons.thaiFood4),
  ];
}