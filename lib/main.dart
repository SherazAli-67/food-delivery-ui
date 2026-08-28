import 'package:flutter/material.dart';
import 'package:food_delivery_ui/constants/string_const.dart';
import 'package:food_delivery_ui/core/app_colors.dart';
import 'package:food_delivery_ui/router/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: StringConst.appTitle,
      theme: ThemeData(
        brightness: .light,
        scaffoldBackgroundColor: AppColors.scaffoldBgColor,
        fontFamily: StringConst.appFontFamily
      ),
      routerConfig: router,
      builder: (ctx, child) => child!,
    );
  }
}