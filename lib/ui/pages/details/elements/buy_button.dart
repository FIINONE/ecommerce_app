import 'package:ecommerce_app/models/seller_model.dart';
import 'package:ecommerce_app/ui/pages/details/blocs/cart_count_cubit.dart';
import 'package:ecommerce_app/ui/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class BuyButton extends StatelessWidget {
  const BuyButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CartCountCubit>();
    final seller = context.read<SellerModel>();
    final f = NumberFormat('#,###.00');
    final price = f.format(seller.price);

    return AppButton(
      text: 'Add to Cart   \$$price',
      onTap: () {
        cubit.addCount();
      },
    );
  }
}
