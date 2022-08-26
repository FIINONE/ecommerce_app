import 'package:ecommerce_app/common/constants/assets.dart';
import 'package:ecommerce_app/common/routes/app_routes.dart';
import 'package:ecommerce_app/common/styles/app_colors.dart';
import 'package:ecommerce_app/common/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ecommerce_app/models/best_seller_model.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeBestSeller extends StatelessWidget {
  const HomeBestSeller({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bestSellers = context.read<List<BestsellerModel>>();

    final size = MediaQuery.of(context).size;
    final width = (size.width - 48) / 2;
    final childAspectRatio = width / 227;
    const double spacing = 13;

    return GridView.builder(
      itemCount: bestSellers.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: childAspectRatio,
        mainAxisSpacing: spacing,
        crossAxisSpacing: spacing,
      ),
      padding: const EdgeInsets.only(left: 17.0, right: 17, top: 17),
      clipBehavior: Clip.none,
      itemBuilder: (context, index) {
        final seller = bestSellers[index];
        return _SellerItem(seller: seller);
      },
    );
  }
}

class _SellerItem extends StatelessWidget {
  const _SellerItem({
    Key? key,
    required this.seller,
  }) : super(key: key);

  final BestsellerModel seller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                blurRadius: 40,
                color: AppColors.shadowSeller,
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.network(
                  seller.picture,
                  height: 168,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 7),
              Padding(
                padding: const EdgeInsets.only(left: 21.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _PriceWidget(seller: seller),
                    const SizedBox(height: 5),
                    Text(
                      seller.title,
                      style: AppTextStyles.regularSize12.copyWith(fontSize: 10),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, AppRoutesName.detailed);
            },
            borderRadius: BorderRadius.circular(10),
            splashColor: AppColors.orange.withOpacity(0.5),
          ),
        ),
        _FavoriteWidget(seller: seller),
      ],
    );
  }
}

class _FavoriteWidget extends StatefulWidget {
  const _FavoriteWidget({
    Key? key,
    required this.seller,
  }) : super(key: key);

  final BestsellerModel seller;

  @override
  State<_FavoriteWidget> createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<_FavoriteWidget> {
  late bool isFavorites = widget.seller.isFavorites;

  void onTap() {
    setState(() {
      isFavorites = !isFavorites;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 10,
        right: 12,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(25),
            radius: 25,
            child: Ink(
              height: 25,
              width: 25,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(
                isFavorites ? Assets.svgFavoriteOn : Assets.svgFavoriteOff,
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
        ));
  }
}

class _PriceWidget extends StatelessWidget {
  const _PriceWidget({
    Key? key,
    required this.seller,
  }) : super(key: key);

  final BestsellerModel seller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '\$${seller.priceWithoutDiscount.toString()}',
          style: AppTextStyles.boldSize15.copyWith(fontSize: 16),
        ),
        const SizedBox(width: 7),
        Text(
          '\$${seller.discountPrice.toString()}',
          textAlign: TextAlign.center,
          style: AppTextStyles.mediumSize12.copyWith(
            fontSize: 10,
            height: 1.3,
            color: AppColors.grey_204,
            decoration: TextDecoration.lineThrough,
          ),
        ),
      ],
    );
  }
}
