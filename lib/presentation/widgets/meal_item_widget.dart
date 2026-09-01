import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../core/app_icons.dart';
import '../../core/app_textstyles.dart';
import '../../core/models/meal_model.dart';
import '../../providers/cart_provider.dart';

class MealItemWidget extends StatelessWidget {
  const MealItemWidget({
    super.key,
    required this.meal,
    required this.provider
  });

  final MealModel meal;
  final CartProvider provider;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: .center,
      children: [
        Positioned(bottom: 0, left: 0, right: 0, child: Image.asset(AppIcons.curvedShape),),
        Padding(
          padding: .only(left: 12, right: 12, top: 120),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Column(
                crossAxisAlignment: .start,
                spacing: 4,
                children: [
                  Text(meal.title, style: AppTextStyles.regularTextStyle.copyWith(fontWeight: .w600),),
                  Text(meal.subtitle, style: AppTextStyles.regularTextStyle.copyWith(fontSize: 10, color: AppColors.lightGreyColor),)
                ],
              ),
              Row(
                children: [
                  Expanded(child: Text('\$${meal.price}', style: AppTextStyles.regularTextStyle.copyWith(fontWeight: .bold, fontSize: 16),)),
                  IconButton(onPressed: ()=> provider.addItemToCart(meal), icon: provider.alreadyInCart(meal) ? Icon(Icons.check_circle_outline_rounded, color: Colors.green,) :  Icon(Icons.add_circle_outline_rounded) )
                ],
              )
            ],
          ),
        ),
        Positioned(
            top: 0,
            child: Image.asset(meal.image,)),
      ],
    );
  }
}