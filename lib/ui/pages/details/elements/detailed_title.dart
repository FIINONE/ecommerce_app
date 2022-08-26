import 'package:ecommerce_app/common/constants/assets.dart';
import 'package:ecommerce_app/common/styles/app_colors.dart';
import 'package:ecommerce_app/common/styles/app_text_styles.dart';
import 'package:ecommerce_app/models/seller_model.dart';
import 'package:ecommerce_app/ui/widgets/app_square_mini_buttom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SellerTitle extends StatefulWidget {
  const SellerTitle({
    Key? key,
  }) : super(key: key);

  @override
  State<SellerTitle> createState() => _SellerTitleState();
}

class _SellerTitleState extends State<SellerTitle> {
  bool isFavorites = false;
  @override
  void initState() {
    super.initState();

    final seller = context.read<SellerModel>();
    isFavorites = seller.isFavorites;
  }

  @override
  Widget build(BuildContext context) {
    final seller = context.read<SellerModel>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          seller.title,
          style: AppTextStyles.mediumSize15.copyWith(fontSize: 24),
        ),
        AppSquareMiniButtom(
          onTap: () {
            setState(() {
              isFavorites = !isFavorites;
            });
          },
          size: 37,
          iconSize: 14,
          assetName: isFavorites ? Assets.svgFavoriteOn : Assets.svgFavoriteOff,
          iconColor: isFavorites ? AppColors.orange : Colors.white,
        ),
      ],
    );
  }
}
