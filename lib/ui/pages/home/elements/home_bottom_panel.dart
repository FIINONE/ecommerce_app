import 'package:ecommerce_app/common/constants/assets.dart';
import 'package:ecommerce_app/common/styles/app_colors.dart';
import 'package:ecommerce_app/common/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeBottomPanel extends StatelessWidget {
  const HomeBottomPanel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
        height: 72,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: AppColors.blueBlack,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 68),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 8,
                  width: 8,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 7),
                Text(
                  'Explorer',
                  style: AppTextStyles.boldSize15.copyWith(color: Colors.white),
                )
              ],
            ),
            SvgPicture.asset(Assets.svgBasket),
            SvgPicture.asset(Assets.svgFavorite),
            SvgPicture.asset(Assets.svgPerson),
          ],
        ),
      ),
    );
  }
}