import 'package:flutter/material.dart';
import 'package:food_delivery_ui/core/app_colors.dart';
import 'package:food_delivery_ui/core/app_icons.dart';
import 'package:food_delivery_ui/core/app_textstyles.dart';
import 'package:food_delivery_ui/presentation/widgets/circular_progress_btn.dart';
import 'package:food_delivery_ui/presentation/widgets/fade_slide_in.dart';
import 'package:food_delivery_ui/router/app_router.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreen extends StatelessWidget{
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(
        mainAxisAlignment: .center,
        children: [
          FadeSlideIn(
            child: Stack(
              children: [
                Image.asset(AppIcons.welcomeImg),
                Positioned(
                    right: 0,
                    top: 0,
                    child: Text("Skip", style: AppTextStyles.regularTextStyle,)),
              ],
            ),
          ),
          FadeSlideIn(
            delay: const Duration(milliseconds: 150),
            child: Container(
              margin: .symmetric(horizontal: 24),
              decoration: BoxDecoration(
                  borderRadius: .circular(48),
                  color: AppColors.primaryColor,
                  image: DecorationImage(image: AssetImage(AppIcons.whiteTexture))
              ),
              padding: .symmetric(horizontal: 24, vertical: 32),
              child: Column(
                spacing: 46,
                children: [
                  Padding(
                    padding: const .symmetric(horizontal: 24.0),
                    child: Column(
                      children: [
                        Text("Delicious Food Waiting", style: AppTextStyles.headingTextStyle.copyWith(color: Colors.white), textAlign: .center,),
                        Text("Welcome to MealMate, whether you're craving the bold flavors, our app has got you covered.", style: AppTextStyles.regularTextStyle.copyWith(fontWeight: .w300, color: Colors.white),textAlign: .center,)
                      ],
                    ),
                  ),
                  CircularProgressButton(onCompleted: ()=> context.push(NamedRoutes.home.routeName),)
                ],
              ),
            ),
          ),
        ],
      ))
    );
  }
}