import 'package:ecommerce_app/common/constants/assets.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce_app/common/styles/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppSquareMiniButtom extends StatelessWidget {
  const AppSquareMiniButtom({
    Key? key,
    required this.onTap,
    required this.size,
    required this.iconSize,
    this.iconData,
    this.assetName = Assets.svgBasket,
    this.color = AppColors.blueBlack,
    this.iconColor = Colors.white,
  }) : super(key: key);

  final void Function() onTap;
  final double size;
  final double iconSize;
  final IconData? iconData;
  final String assetName;
  final Color color;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          radius: size,
          borderRadius: BorderRadius.circular(10),
          child: Ink(
            height: size,
            width: size,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10),
            ),
            // padding: EdgeInsets.only(left: iconSize / 4),
            child: Center(
              child: iconData != null
                  ? Icon(
                      iconData,
                      color: iconColor,
                      size: iconSize,
                    )
                  : SvgPicture.asset(
                      assetName,
                      color: iconColor,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
