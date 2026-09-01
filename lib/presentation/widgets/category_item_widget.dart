import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../core/app_textstyles.dart';

class CategoryItemWidget extends StatelessWidget {
  const CategoryItemWidget({
    super.key,
    required this.category,
    required this.isSelected
  });

  final String category;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: .circular(99),
          color: isSelected ? AppColors.categoryFillColor : Colors.white,
          border: .all(color: AppColors.borderColor)
      ),
      padding: .symmetric(horizontal: 16,),
      alignment: .center,
      child: Text(category, textAlign: .center, style: AppTextStyles.regularTextStyle.copyWith(color: isSelected ? Colors.black : AppColors.lightGreyColor),),
    );
  }
}