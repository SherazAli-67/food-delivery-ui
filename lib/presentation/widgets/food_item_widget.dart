import 'package:flutter/material.dart';
import 'package:food_delivery_ui/router/app_router.dart';
import 'package:go_router/go_router.dart';
import '../../core/app_colors.dart';
import '../../core/app_textstyles.dart';
import '../../core/models/food_model.dart';

class FoodItemWidget extends StatelessWidget {
  const FoodItemWidget({
    super.key,
    required this.food
  });

  final FoodModel food;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> context.push(NamedRoutes.foodByCategory.routeName),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(food.image), fit: .cover),
          borderRadius: .circular(12),
        ),
        child: Row(
          children: [
            Padding(padding: .symmetric(horizontal: 16, vertical: 21), child: Column(
              spacing: 16,
              crossAxisAlignment: .start,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: AppColors.redColor,
                      borderRadius: .circular(8)
                  ),
                  padding: .symmetric(horizontal: 8, vertical: 4),
                  child: Text(food.title, style:  AppTextStyles.regularTextStyle.copyWith(color: Colors.white, fontWeight: .w600),),
                ),
                Column(
                  spacing: 4,
                  crossAxisAlignment: .start,
                  children: [
                    Text(food.subtitle, style: AppTextStyles.regularTextStyle.copyWith(color: AppColors.lightBlueColor, fontWeight: .w300),),
                    Text(food.offPercentageText, style: AppTextStyles.headingTextStyle.copyWith(fontSize: 24),)
                  ],
                )
              ],
            ),)
          ],
        ),
      ),
    );
  }
}