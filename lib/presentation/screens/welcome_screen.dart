import 'package:flutter/material.dart';
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
          alignment: .topCenter,
          children: [
            Image.asset(AppIcons.welcomeImg, fit: .cover,),
            Positioned(
                right: 0,
                child: Text("Skip", style: AppTextStyles.regularTextStyle,))

          ],
        ),
      ))
    );
  }

}