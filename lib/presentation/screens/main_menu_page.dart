import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_delivery_ui/core/app_colors.dart';
import 'package:go_router/go_router.dart';

import '../../core/app_icons.dart';

class MainMenuPage extends StatelessWidget {
  const MainMenuPage({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            type: .fixed,
            backgroundColor: Colors.white,
            onTap: (index)=> navigationShell.goBranch(index),
            selectedItemColor: AppColors.primaryColor,
            currentIndex: navigationShell.currentIndex,
            items: [
              _buildBottomNavigationBarItemWidget(icon: navigationShell.currentIndex == 0 ? AppIcons.icHome : AppIcons.icHomeSelected, label: '', index: 0),
              _buildBottomNavigationBarItemWidget(icon: AppIcons.icDelivery, label: '', index: 1),
              _buildBottomNavigationBarItemWidget(icon: AppIcons.icBookmark, label: '', index: 2),
              _buildBottomNavigationBarItemWidget(icon: AppIcons.icProfile, label: '', index: 3),

            ]),
        body: SafeArea(child: navigationShell)
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItemWidget(
      {required String icon, required String label, required int index}) =>
      BottomNavigationBarItem(
        icon: SvgPicture.asset(icon, height: 24, width: 24,), label: label,);

}