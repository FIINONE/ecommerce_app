import 'package:ecommerce_app/ui/pages/details/blocs/cart_count_cubit.dart';
import 'package:ecommerce_app/ui/pages/my_cart/blocs/my_cart_list_cubit.dart';
import 'package:ecommerce_app/ui/pages/my_cart/elements/good_count.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:ecommerce_app/common/constants/assets.dart';
import 'package:ecommerce_app/common/styles/app_colors.dart';
import 'package:ecommerce_app/common/styles/app_text_styles.dart';

class CartList extends StatelessWidget {
  const CartList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final goodsCubit = context.read<MyCartListCubit>();

    return Expanded(
      child: ListView.separated(
        itemCount: goodsCubit.state.length,
        padding: const EdgeInsets.only(top: 80, left: 23, right: 32, bottom: 80),
        separatorBuilder: (context, index) => const SizedBox(height: 45),
        itemBuilder: (context, index) {
          final good = goodsCubit.state[index];

          return Row(
            children: [
              Container(
                height: 88,
                width: 88,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                clipBehavior: Clip.hardEdge,
                child: Image.network(
                  good.images,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 17),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      good.title,
                      style: AppTextStyles.mediumSize15.copyWith(fontSize: 20, color: Colors.white),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      '\$${good.price}',
                      style: AppTextStyles.mediumSize15.copyWith(fontSize: 20, color: AppColors.orange),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 33),
              GoodCount(index: index),
              const SizedBox(width: 17),
              SvgPicture.asset(
                Assets.svgDelete,
                fit: BoxFit.scaleDown,
              )
            ],
          );
        },
      ),
    );
  }
}
