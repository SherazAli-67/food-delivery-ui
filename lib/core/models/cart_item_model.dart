import 'package:food_delivery_ui/core/models/meal_model.dart';

class CartItemModel {
  final String id;
  final MealModel meal;
  final int quantity;
  CartItemModel({required this.id, required this.meal, required this.quantity});



  CartItemModel copyWith({
    String? id,
    int? quantity,
  }) {

    return CartItemModel(
      id: id ?? this.id,
      meal: meal,
      quantity: quantity ?? this.quantity,
    );

  }
}