import 'package:flutter/material.dart';
import 'package:food_delivery_ui/core/models/meal_model.dart';

import '../core/models/cart_item_model.dart';

class CartProvider extends ChangeNotifier{
  List<CartItemModel> cartItems = [];

  List<String> get _cartMealItemIds => cartItems.map((cartItem) => cartItem.meal.id).toList();

  CartItemModel? _getCartItemByProductID(String id){
    for (var cartItem in cartItems) {
      if(cartItem.meal.id == id){
        return cartItem;
      }
    }
    return null;
  }

  void addItemToCart(MealModel meal){
    if(_cartMealItemIds.contains(meal.id)){
      int index = cartItems.indexWhere((cartItem) => cartItem.meal.id == meal.id);
      CartItemModel cartItem = cartItems[index];
      final updatedCartItem  = cartItem.copyWith(quantity: cartItem.quantity+1);
      cartItems[index] = updatedCartItem;
    }else{
      cartItems.add(CartItemModel(id: DateTime.now().toIso8601String(), meal: meal, quantity: 1));
    }
    notifyListeners();
  }

  String getTotalPrice(){
   double total = 0;
   for (var item in cartItems) {
     total += item.quantity * item.meal.price;
   }
   return '\$${total.toStringAsFixed(2)}';
  }

  double getTotalPriceDouble(){
    double total = 0;
    for (var item in cartItems) {
      total += item.quantity * item.meal.price;
    }
    return total.ceilToDouble();
  }
  void onDecreaseQuantityTap({required String mealID}){
    CartItemModel? cartItem = _getCartItemByProductID(mealID);
    if(cartItem != null){
      if(cartItem.quantity == 1){
        return;
      }
      int index = cartItems.indexWhere((item)=> item.id == cartItem.id);
      CartItemModel updatedCartItem = cartItem.copyWith(quantity: cartItem.quantity-1);
      cartItems[index] = updatedCartItem;
      notifyListeners();
    }
  }

  int getCartItemQuantityByPlanID(String id) {
    if(_cartMealItemIds.contains(id)){
      CartItemModel cartItem = _getCartItemByProductID(id)!;
      return cartItem.quantity;
      // return cartItem.quantity < 10 ? '0${cartItem.quantity}' : cartItem.quantity.toString();
    }else{
      return 0;
    }
  }

  String getFormattedCartItemQuantityByPlanID(String id) {
    if(_cartMealItemIds.contains(id)){
      CartItemModel cartItem = _getCartItemByProductID(id)!;
      return cartItem.quantity < 10 ? '0${cartItem.quantity}' : cartItem.quantity.toString();
    }else{
      return '00';
    }
  }

  bool alreadyInCart(MealModel meal){
    return _cartMealItemIds.contains(meal.id);
  }
}