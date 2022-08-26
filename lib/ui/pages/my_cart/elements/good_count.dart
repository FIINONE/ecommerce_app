import 'package:ecommerce_app/models/good_model.dart';
import 'package:ecommerce_app/ui/pages/my_cart/blocs/my_cart_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ecommerce_app/common/styles/app_colors.dart';
import 'package:ecommerce_app/common/styles/app_text_styles.dart';

class GoodCount extends StatelessWidget {
  const GoodCount({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    final goodsCubit = context.read<MyCartListCubit>();

    return Container(
      width: 26,
      height: 68,
      decoration: BoxDecoration(color: AppColors.greyDark, borderRadius: BorderRadius.circular(26)),
      child: Column(
        children: [
          Material(
            color: Colors.transparent,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(26)),
            clipBehavior: Clip.hardEdge,
            child: IconButton(
              onPressed: () {
                goodsCubit.removeCount(index);
              },
              iconSize: 8,
              constraints: const BoxConstraints(minHeight: 8, minWidth: 8),
              icon: const Icon(
                Icons.remove,
                color: Colors.white,
                size: 10,
              ),
              padding: const EdgeInsets.only(top: 8, bottom: 6, left: 8, right: 8),
            ),
          ),
          BlocSelector<MyCartListCubit, List<GoodModel>, int>(
              bloc: goodsCubit,
              selector: (state) => state[index].count,
              builder: (context, count) {
                return Text(
                  count.toString(),
                  style: AppTextStyles.mediumSize15.copyWith(fontSize: 20, color: Colors.white, height: 1.2),
                );
              }),
          Material(
            color: Colors.transparent,
            borderRadius: const BorderRadius.vertical(bottom: Radius.circular(26)),
            clipBehavior: Clip.hardEdge,
            child: IconButton(
              onPressed: () {
                goodsCubit.addCount(index);
              },
              iconSize: 8,
              constraints: const BoxConstraints(minHeight: 8, minWidth: 8),
              padding: const EdgeInsets.only(bottom: 8, top: 6, left: 8, right: 8),
              icon: const Icon(
                Icons.add,
                color: Colors.white,
                size: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
