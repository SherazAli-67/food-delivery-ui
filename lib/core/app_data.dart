import 'package:food_delivery_ui/core/app_icons.dart';
import 'package:food_delivery_ui/core/models/food_model.dart';

class AppData {
  static List<String> get categories => [
    'Promo 2024', 'Popular', 'Recommended'
  ];
  
  static List<FoodModel> get foods => [
    FoodModel(id: 'desi', title: 'Desi', subtitle: 'Get Special Discount.', offPercentageText: 'up to 45%', image: AppIcons.desiFoodImage),
    FoodModel(id: 'thai', title: 'Thai', subtitle: 'Get Special Discount.', offPercentageText: 'up to 50%', image: AppIcons.thaiFoodImage),
    FoodModel(id: 'healthy', title: 'Healthy', subtitle: 'Get Special Discount.', offPercentageText: 'up to 75%', image: AppIcons.healthyFoodImage),

  ];
}