import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery_ui/core/app_colors.dart';
import 'package:food_delivery_ui/core/app_data.dart';
import 'package:food_delivery_ui/core/app_icons.dart';
import 'package:food_delivery_ui/core/app_textstyles.dart';
import 'package:food_delivery_ui/presentation/widgets/category_item_widget.dart';
import 'package:food_delivery_ui/presentation/widgets/food_item_widget.dart';

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
                  itemBuilder: (_, index)=> CategoryItemWidget(index: index), separatorBuilder: (_, _) => const SizedBox(width: 16,), itemCount: AppData.categories.length),
            ),
            Expanded(child: ListView.separated(itemBuilder: (_, index) => FoodItemWidget(food: AppData.foods[index]), separatorBuilder: (ctx, index) => const SizedBox(height: 24,), itemCount: AppData.foods.length))
      ]),
    );
  }
}