import 'package:ecommerce_app/common/styles/app_colors.dart';
import 'package:ecommerce_app/ui/pages/home/blocs/home_category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:ecommerce_app/common/constants/assets.dart';
import 'package:ecommerce_app/common/styles/app_text_styles.dart';

class HomeCategoryModel {
  final String assets;
  final String title;
  final int id;

  const HomeCategoryModel({
    required this.assets,
    required this.title,
    required this.id,
  });
}

const List<HomeCategoryModel> _homeCategoryList = [
  HomeCategoryModel(assets: Assets.svgPhone, title: 'Phones', id: 0),
  HomeCategoryModel(assets: Assets.svgComp, title: 'Computer', id: 1),
  HomeCategoryModel(assets: Assets.svgHealth, title: 'Health', id: 2),
  HomeCategoryModel(assets: Assets.svgBooks, title: 'Books', id: 3),
  HomeCategoryModel(assets: '', title: 'Tools', id: 4),
];

class HomeCategory extends StatelessWidget {
  const HomeCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (_) => HomeCategoryCubit(),
      child: SizedBox(
        height: 93,
        width: size.width,
        child: ListView.separated(
          itemCount: _homeCategoryList.length,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => const SizedBox(width: 23),
          itemBuilder: (context, index) {
            final model = _homeCategoryList[index];
            return _HomeCategoryItem(model: model);
          },
        ),
      ),
    );
  }
}

class _HomeCategoryItem extends StatelessWidget {
  const _HomeCategoryItem({
    Key? key,
    required this.model,
  }) : super(key: key);

  final HomeCategoryModel model;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCategoryCubit>();

    return BlocBuilder<HomeCategoryCubit, int>(
      builder: (context, id) {
        final isSelected = model.id == id;
        final circleColor = isSelected ? AppColors.orange : Colors.white;
        final iconColor = isSelected ? Colors.white : AppColors.grey;
        final textColor = isSelected ? AppColors.orange : AppColors.blueBlack;

        return GestureDetector(
          onTap: () => cubit.select(model.id),
          child: Column(
            children: [
              Container(
                height: 71,
                width: 71,
                decoration: BoxDecoration(
                  color: circleColor,
                  shape: BoxShape.circle,
                  boxShadow: const [
                    BoxShadow(blurRadius: 20, color: AppColors.shadowCategory),
                  ],
                ),
                child: model.assets.isNotEmpty
                    ? SvgPicture.asset(
                        model.assets,
                        color: iconColor,
                        fit: BoxFit.scaleDown,
                      )
                    : const SizedBox.shrink(),
              ),
              const SizedBox(height: 7),
              Text(
                model.title,
                style: AppTextStyles.mediumSize12.copyWith(color: textColor),
              )
            ],
          ),
        );
      },
    );
  }
}
