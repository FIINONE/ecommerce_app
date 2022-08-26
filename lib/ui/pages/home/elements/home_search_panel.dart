import 'package:ecommerce_app/common/constants/assets.dart';
import 'package:ecommerce_app/common/styles/app_colors.dart';
import 'package:ecommerce_app/common/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeSeearchPanel extends StatelessWidget {
  const HomeSeearchPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 34,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              boxShadow: const [
                BoxShadow(blurRadius: 20, color: AppColors.shadowSearch),
              ],
            ),
            child: TextField(
              style: AppTextStyles.regularSize12,
              decoration: InputDecoration(
                hintText: 'Search',
                icon: Padding(
                  padding: const EdgeInsets.only(left: 24.0),
                  child: SvgPicture.asset(
                    Assets.svgSearch,
                    fit: BoxFit.scaleDown,
                  ),
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        Container(
          height: 34,
          width: 34,
          margin: const EdgeInsets.only(left: 11, right: 20),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.orange,
            boxShadow: [
              BoxShadow(blurRadius: 20, color: AppColors.shadowSearch),
            ],
          ),
          child: SvgPicture.asset(
            Assets.svgQrcode,
            fit: BoxFit.scaleDown,
          ),
        )
      ],
    );
  }
}
