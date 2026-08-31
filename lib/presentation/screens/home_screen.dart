import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery_ui/core/app_colors.dart';
import 'package:food_delivery_ui/core/app_icons.dart';
import 'package:food_delivery_ui/core/app_textstyles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: .symmetric(horizontal: 24, vertical: 32),
      child: Column(children: [
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
        )
      ]),
    );
  }
}
