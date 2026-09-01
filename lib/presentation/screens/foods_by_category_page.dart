import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_delivery_ui/constants/string_const.dart';
import 'package:food_delivery_ui/core/models/meal_model.dart';
import 'package:food_delivery_ui/providers/cart_provider.dart';
import 'package:provider/provider.dart';
import '../../core/app_colors.dart';
import '../../core/app_data.dart';
import '../../core/app_icons.dart';
import '../../core/app_textstyles.dart';
import '../widgets/category_item_widget.dart';

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
                                itemBuilder: (_, index)=> CategoryItemWidget(category: AppData.mealCategories[index], isSelected: index ==0,), separatorBuilder: (_, _) => const SizedBox(width: 16,), itemCount: AppData.mealCategories.length),
                          ),
                          Expanded(child: GridView.builder(
                              itemCount: AppData.meals.length,
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 15, crossAxisSpacing: 24, childAspectRatio: 0.77), itemBuilder: (ctx, index){
                            MealModel meal = AppData.meals[index];
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
                          }))
                        ]),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child:  Container(
                        decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: .circular(12)
                        ),
                        padding: .symmetric(horizontal: 16, vertical: 12),
                        child: Row(
                          children: [
                            Row(
                              spacing: 8,
                              children: [
                                Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: .circular(8)
                                    ),
                                    padding: .all(8),
                                    child: SvgPicture.asset(AppIcons.icWallet)
                                ),
                                RichText(text: TextSpan(
                                    text: "Pay | ${provider.getTotalPrice()} ",
                                    style: AppTextStyles.regularTextStyle.copyWith(fontWeight: .bold, fontSize: 14, fontFamily: StringConst.appFontFamily),
                                    children: [
                                      TextSpan(
                                          text: '${provider.getTotalPriceDouble()}',
                                          style: AppTextStyles.regularTextStyle.copyWith(fontSize: 10, fontWeight: .w400, fontFamily: StringConst.appFontFamily, decoration: .lineThrough)
                                      )
                                    ]
                                ))
                              ],
                            ),
                            Expanded(
                              child: Stack(
                                  alignment: .topRight,
                                  children: List.generate(provider.cartItems.length, (index){
                                    String cartItem = provider.cartItems[index].meal.image;
                                    return index == 0 ? Image.asset(cartItem, height: 40, width: 26,) :  Positioned(
                                      right: index * 15,
                                      child: Image.asset(cartItem, height: 40, width: 26,),);
                                  })
                              ),
                            ),
                          ],
                        )
                      )
                    )
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