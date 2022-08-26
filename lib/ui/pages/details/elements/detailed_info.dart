import 'package:ecommerce_app/common/constants/assets.dart';
import 'package:ecommerce_app/common/styles/app_colors.dart';
import 'package:ecommerce_app/common/styles/app_text_styles.dart';
import 'package:ecommerce_app/models/seller_model.dart';
import 'package:ecommerce_app/ui/pages/details/elements/buy_button.dart';
import 'package:ecommerce_app/ui/pages/details/elements/capacity_selector.dart';
import 'package:ecommerce_app/ui/pages/details/elements/color_selector.dart';
import 'package:ecommerce_app/ui/pages/details/elements/detailed_title.dart';
import 'package:ecommerce_app/ui/pages/details/elements/star_shape.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailedInfoWidget extends StatelessWidget {
  const DetailedInfoWidget({
    Key? key,
  }) : super(key: key);

  List<double> ratingToListValue(double rating) {
    final ratingValueList = [
      0.0,
      0.0,
      0.0,
      0.0,
      0.0,
    ];

    for (var i = 0; i < rating.floor(); i++) {
      ratingValueList[i] = 1.0;
    }

    if ((rating.ceil() - rating) > 0) {
      ratingValueList[rating.floor()] = rating - rating.floor();
    }

    return ratingValueList;
  }

  @override
  Widget build(BuildContext context) {
    final seller = context.read<SellerModel>();

    final size = MediaQuery.of(context).size;
    final height = size.height * 0.4;

    final ratingValueList = ratingToListValue(seller.rating);

    return Container(
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(blurRadius: 20, offset: const Offset(0, -5), color: AppColors.shadowFilter.withOpacity(0.1)),
        ],
      ),
      child: ListView(
        padding: const EdgeInsets.only(top: 28, bottom: 36, left: 30, right: 30),
        children: [
          const SellerTitle(),
          const SizedBox(height: 7),
          Row(
            children: ratingValueList
                .map((value) => SizedBox(
                      height: 17,
                      width: 17,
                      child: CustomPaint(
                        painter: StarShapePainter(value),
                      ),
                    ))
                .toList(),
          ),
          const SizedBox(height: 30),
          const _RowPanel(),
          const SizedBox(height: 30),
          const _CharacteristicsList(),
          const SizedBox(height: 30),
          Text(
            'Select color and capacity',
            style: AppTextStyles.mediumSize15.copyWith(fontSize: 16),
          ),
          const SizedBox(height: 14),
          SizedBox(
            height: 40,
            child: Row(
              children: const [
                ColorSelector(),
                CapacitySelector(),
              ],
            ),
          ),
          const SizedBox(height: 25),
          const BuyButton()
        ],
      ),
    );
  }
}

class _RowPanel extends StatefulWidget {
  const _RowPanel({
    Key? key,
  }) : super(key: key);

  @override
  State<_RowPanel> createState() => _RowPanelState();
}

class _RowPanelState extends State<_RowPanel> {
  final titleList = ['Shop', 'Details', 'Features'];
  String selectedTitle = 'Shop';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = (size.width - 60) / 3;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: titleList
          .map((title) => InkWell(
                onTap: () {
                  setState(() {
                    selectedTitle = title;
                  });
                },
                child: Column(
                  children: [
                    Text(
                      title,
                      style: selectedTitle == title
                          ? AppTextStyles.boldSize25.copyWith(fontSize: 20)
                          : AppTextStyles.regularSize15.copyWith(fontSize: 20, color: AppColors.grey_0),
                    ),
                    selectedTitle == title
                        ? Container(
                            width: width,
                            height: 3,
                            decoration: const BoxDecoration(color: AppColors.orange),
                          )
                        : SizedBox(width: width)
                  ],
                ),
              ))
          .toList(),
    );
  }
}

class _CharacteristicsList extends StatelessWidget {
  const _CharacteristicsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final seller = context.read<SellerModel>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _CharacterItem(
          assets: Assets.svgCpu,
          title: seller.cpu,
        ),
        _CharacterItem(
          assets: Assets.svgCamera,
          title: seller.camera,
        ),
        _CharacterItem(
          assets: Assets.svgFlashMemory,
          title: seller.ssd,
        ),
        _CharacterItem(
          assets: Assets.svgMemory,
          title: seller.sd,
        ),
      ],
    );
  }
}

class _CharacterItem extends StatelessWidget {
  const _CharacterItem({
    Key? key,
    required this.assets,
    required this.title,
  }) : super(key: key);

  final String assets;
  final String title;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = (size.width - 60) / 4;
    return SizedBox(
      width: width,
      child: Column(
        children: [
          SvgPicture.asset(assets),
          const SizedBox(height: 5),
          Text(
            title,
            style: AppTextStyles.regularSize12.copyWith(fontSize: 11, color: AppColors.grey_183),
          ),
        ],
      ),
    );
  }
}
