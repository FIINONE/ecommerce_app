import 'package:ecommerce_app/common/styles/app_text_styles.dart';
import 'package:ecommerce_app/models/cart_model.dart';
import 'package:ecommerce_app/models/good_model.dart';
import 'package:ecommerce_app/ui/pages/my_cart/blocs/my_cart_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class MyCartSummary extends StatelessWidget {
  const MyCartSummary({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = context.read<CartModel>();

    return Padding(
      padding: const EdgeInsets.only(top: 15.0, bottom: 26, left: 55, right: 35),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: AppTextStyles.regularSize15.copyWith(color: Colors.white),
              ),
              const _TotalPrice(),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Delivery',
                style: AppTextStyles.regularSize15.copyWith(color: Colors.white),
              ),
              Text(
                cart.delivery,
                style: AppTextStyles.boldSize15.copyWith(color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TotalPrice extends StatelessWidget {
  const _TotalPrice({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final goodsCubit = context.read<MyCartListCubit>();

    return BlocBuilder<MyCartListCubit, List<GoodModel>>(
        builder: (context, snapshot) {
          int total = 0;
          goodsCubit.state.forEach((element) {
            total += element.count * element.price;
          });

          final f = NumberFormat('#,###');
          final priceString = f.format(total);

          return Text(
            '\$$priceString',
            style: AppTextStyles.boldSize15.copyWith(color: Colors.white),
          );
        });
  }
}
