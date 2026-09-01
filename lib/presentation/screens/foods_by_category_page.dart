import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_delivery_ui/providers/cart_provider.dart';
import 'package:provider/provider.dart';
import '../../core/app_colors.dart';
import '../../core/app_data.dart';
import '../../core/app_icons.dart';
import '../../core/app_textstyles.dart';
import '../widgets/cart_pay_bar_widget.dart';
import '../widgets/category_item_widget.dart';
import '../widgets/fade_slide_in.dart';
import '../widgets/meal_item_widget.dart';

class FoodsByCategoryPage extends StatelessWidget{
  const FoodsByCategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CartProvider(),
      builder: (_, child) {
        return Consumer<CartProvider>(
          builder: (_, provider, _) {
            return Scaffold(
              body: SafeArea(child: Padding(
                padding: .symmetric(horizontal: 24, vertical: 32),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: .start,
                      spacing: 24,
                      children: [
                        FadeSlideIn(
                          child: Row(
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
                        ),
                        FadeSlideIn(
                          delay: AppAnimations.sectionGap,
                          child: SizedBox(
                            height: 32,
                            child: ListView.separated(
                                scrollDirection: .horizontal,
                                itemBuilder: (_, index)=> CategoryItemWidget(category: AppData.mealCategories[index], isSelected: index ==0,),
                                separatorBuilder: (_, _) => const SizedBox(width: 16,),
                                itemCount: AppData.mealCategories.length),
                          ),
                        ),
                        Expanded(
                          child: GridView.builder(
                            itemCount: AppData.meals.length,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 15,
                                crossAxisSpacing: 24,
                                childAspectRatio: 0.77),
                            itemBuilder: (_, index) => FadeSlideIn(
                              delay: Duration(
                                milliseconds: AppAnimations.sectionGap.inMilliseconds + 40 + index * AppAnimations.staggerStep.inMilliseconds,
                              ),
                              child: MealItemWidget(meal: AppData.meals[index], provider: provider),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: FadeSlideIn(
                        delay: const Duration(milliseconds: 300),
                        child: CartPayBarWidget(provider: provider),
                      ),
                    ),
                  ],
                ),
              )),
            );
          }
        );
      }
    );
  }
}
