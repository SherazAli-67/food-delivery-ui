import 'package:flutter/cupertino.dart';
import 'package:food_delivery_ui/presentation/screens/foods_by_category_page.dart';
import 'package:food_delivery_ui/presentation/screens/home_screen.dart';
import 'package:food_delivery_ui/presentation/screens/main_menu_page.dart';
import 'package:food_delivery_ui/presentation/screens/welcome_screen.dart';
import 'package:go_router/go_router.dart';

GoRouter router = GoRouter(
    initialLocation: NamedRoutes.home.routeName,
    routes: [
      GoRoute(path: NamedRoutes.welcome.routeName, builder: (_, _)=> WelcomeScreen()),
      StatefulShellRoute.indexedStack(
          branches: [
        StatefulShellBranch(routes: [
          GoRoute(path: NamedRoutes.home.routeName, builder: (_, _)=> HomeScreen())
        ]),
        StatefulShellBranch(routes: [
          GoRoute(path: NamedRoutes.delivery.routeName, builder: (_, _)=> Center(child: Text("Delivery"),))

        ]),
        StatefulShellBranch(routes: [
          GoRoute(path: NamedRoutes.bookmark.routeName, builder: (_, _)=> Center(child: Text("Bookmark"),))

        ]),
        StatefulShellBranch(routes: [
          GoRoute(path: NamedRoutes.profile.routeName, builder: (_, _)=> Center(child: Text("Profile"),))

        ]),
      ],
        builder: (ctx, state, navigationShell) => MainMenuPage(navigationShell: navigationShell)
      ),
      GoRoute(path: NamedRoutes.foodByCategory.routeName, builder: (_, state) =>  FoodsByCategoryPage())
    ],
);

enum NamedRoutes {
  welcome('/welcome'),
  home('/home'),
  delivery('/delivery'),
  bookmark('/bookmark'),
  profile('/profile'),
  foodByCategory('/food-by-category')
  ;
  
  final String routeName;
  const NamedRoutes(this.routeName);
}