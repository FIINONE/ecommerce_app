import 'package:ecommerce_app/common/styles/app_colors.dart';
import 'package:ecommerce_app/common/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class HomeTitleBlock extends StatelessWidget {
  const HomeTitleBlock({
    Key? key,
    required this.title,
    required this.suffixTitle,
  }) : super(key: key);

  final String title;
  final String suffixTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppTextStyles.boldSize25,
          ),
          Text(
            suffixTitle,
            style: AppTextStyles.regularSize15.copyWith(color: AppColors.orange),
          )
        ],
      ),
    );
  }
}
