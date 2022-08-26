import 'package:ecommerce_app/common/styles/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  static final instance = AppTextStyles._();
  AppTextStyles._();

  static const heavy = TextStyle(
    fontFamily: 'MarkPro',
    color: AppColors.blueBlack,
    fontWeight: FontWeight.w800,
    fontSize: 30,
    height: 1.1,
  );

  static const boldSize10 = TextStyle(
    fontFamily: 'MarkPro',
    color: AppColors.blueBlack,
    fontWeight: FontWeight.w700,
    fontSize: 10,
    height: 1.26,
  );
  static const boldSize15 = TextStyle(
    fontFamily: 'MarkPro',
    color: AppColors.blueBlack,
    fontWeight: FontWeight.w700,
    fontSize: 15,
    height: 1.26,
  );
  static const boldSize25 = TextStyle(
    fontFamily: 'MarkPro',
    color: AppColors.blueBlack,
    fontWeight: FontWeight.w700,
    fontSize: 25,
    height: 1.26,
  );

  static const mediumSize12 = TextStyle(
    fontFamily: 'MarkPro',
    color: AppColors.blueBlack,
    fontWeight: FontWeight.w500,
    fontSize: 12,
    height: 1.26,
  );
  static const mediumSize15 = TextStyle(
    fontFamily: 'MarkPro',
    color: AppColors.blueBlack,
    fontWeight: FontWeight.w500,
    fontSize: 15,
    height: 1.26,
  );

  static const regularSize12 = TextStyle(
    fontFamily: 'MarkPro',
    color: AppColors.blueBlack,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    height: 1.26,
  );
  static const regularSize15 = TextStyle(
    fontFamily: 'MarkPro',
    color: AppColors.blueBlack,
    fontWeight: FontWeight.w400,
    fontSize: 15,
    height: 1.26,
  );
}
