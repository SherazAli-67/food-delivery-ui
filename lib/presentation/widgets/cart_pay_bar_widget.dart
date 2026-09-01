import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_delivery_ui/constants/string_const.dart';
import 'package:food_delivery_ui/core/app_colors.dart';
import 'package:food_delivery_ui/core/app_icons.dart';
import 'package:food_delivery_ui/core/app_textstyles.dart';
import 'package:food_delivery_ui/providers/cart_provider.dart';
import 'package:food_delivery_ui/presentation/widgets/fade_slide_in.dart';

class CartPayBarWidget extends StatelessWidget {
  const CartPayBarWidget({super.key, required this.provider});

  final CartProvider provider;

  @override
  Widget build(BuildContext context) {
    return Container(
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
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 250),
                switchInCurve: Curves.easeOutBack,
                switchOutCurve: Curves.easeIn,
                transitionBuilder: (child, animation) {
                  return FadeTransition(
                    opacity: animation,
                    child: ScaleTransition(
                      scale: Tween<double>(begin: 0.85, end: 1).animate(animation),
                      child: child,
                    ),
                  );
                },
                child: RichText(
                  key: ValueKey('${provider.getTotalPrice()}_${provider.getTotalPriceDouble()}'),
                  text: TextSpan(
                      text: "Pay | ${provider.getTotalPrice()} ",
                      style: AppTextStyles.regularTextStyle.copyWith(fontWeight: .bold, fontSize: 14, fontFamily: StringConst.appFontFamily),
                      children: [
                        TextSpan(
                            text: '${provider.getTotalPriceDouble()}',
                            style: AppTextStyles.regularTextStyle.copyWith(fontSize: 10, fontWeight: .w400, fontFamily: StringConst.appFontFamily, decoration: .lineThrough)
                        )
                      ]
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: SizedBox(
              height: 40,
              child: Stack(
                alignment: .topRight,
                clipBehavior: .none,
                children: List.generate(provider.cartItems.length, (index) {
                  final cartItem = provider.cartItems[index];
                  return Positioned(
                    right: index * 15,
                    child: FadeSlideIn(
                      key: ValueKey(cartItem.id),
                      duration: const Duration(milliseconds: 300),
                      slideOffset: const Offset(0.4, 0),
                      child: Image.asset(cartItem.meal.image, height: 40, width: 26),
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
