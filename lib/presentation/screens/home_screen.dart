import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery_ui/core/app_colors.dart';
import 'package:food_delivery_ui/core/app_data.dart';
import 'package:food_delivery_ui/core/app_icons.dart';
import 'package:food_delivery_ui/core/app_textstyles.dart';
import 'package:food_delivery_ui/core/models/food_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: .symmetric(horizontal: 24, vertical: 32),
      child: Column(
        crossAxisAlignment: .start,
          spacing: 24,
          children: [
            Row(
          spacing: 16,
          children: [
            Expanded(child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: .circular(12)
              ),
              padding: .all(16),
              child: Row(
                spacing: 8,
                children: [
                  SvgPicture.asset(AppIcons.icLocation),
                  Text("6391 Elgin St., 10299", style: AppTextStyles.regularTextStyle.copyWith(fontWeight: .w300, color: AppColors.lightGreyColor),)
                ],
              ),
            )),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: .circular(12)
              ),
              padding: .all(16),
              child: SvgPicture.asset(AppIcons.icNotification)
            )
          ],
        ),
            SizedBox(
              height: 32,
              child: ListView.separated(
                  scrollDirection: .horizontal,
                  itemBuilder: (_, index)=> _buildCategoryItemWidget(index), separatorBuilder: (_, _) => const SizedBox(width: 16,), itemCount: AppData.categories.length),
            ),
            Expanded(child: ListView.separated(itemBuilder: (_, index) => _buildFoodItemWidget(food: AppData.foods[index]), separatorBuilder: (ctx, index) => const SizedBox(height: 24,), itemCount: AppData.foods.length))
      ]),
    );
  }

  Widget _buildCategoryItemWidget(int index){
    bool isSelected = index == 0;
    return Container(
      decoration: BoxDecoration(
        borderRadius: .circular(99),
        color: isSelected ? AppColors.categoryFillColor : Colors.white,
        border: .all(color: AppColors.borderColor)
      ),
      padding: .symmetric(horizontal: 16,),
      alignment: .center,
      child: Text(AppData.categories[index], textAlign: .center, style: AppTextStyles.regularTextStyle.copyWith(color: isSelected ? Colors.black : AppColors.lightGreyColor),),
    );
  }

  Widget _buildFoodItemWidget({required FoodModel food}) {
    return Container(
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
    );
  }
}
