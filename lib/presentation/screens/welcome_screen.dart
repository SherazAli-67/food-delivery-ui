import 'package:flutter/material.dart';
import 'package:food_delivery_ui/core/app_colors.dart';
import 'package:food_delivery_ui/core/app_icons.dart';
import 'package:food_delivery_ui/core/app_textstyles.dart';

class WelcomeScreen extends StatelessWidget{
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Padding(
        padding: const .symmetric(horizontal: 24.0, vertical: 32),
        child: Stack(

          children: [
            Image.asset(AppIcons.welcomeImg, fit: .cover,),
            Positioned(
                right: 0,
                child: Text("Skip", style: AppTextStyles.regularTextStyle,)),
            Positioned(
                bottom: 32,
                left: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: .circular(48),
                    color: AppColors.primaryColor
                  ),
                  padding: .symmetric(horizontal: 24, vertical: 32),
                  child: Column(
                    children: [
                      Text("Delicious Food Waiting", style: AppTextStyles.headingTextStyle.copyWith(color: Colors.white), textAlign: .center,),
                      Text("Welcome to MealMate, whether you're craving the bold flavors, our app has got you covered.", style: AppTextStyles.regularTextStyle.copyWith(fontWeight: .w300, color: Colors.white),textAlign: .center,)
                    ],
                  ),
                ))
          ],
        ),
      ))
    );
  }

}