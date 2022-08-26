import 'package:ecommerce_app/ui/widgets/app_square_mini_buttom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'package:ecommerce_app/common/styles/app_colors.dart';
import 'package:ecommerce_app/common/styles/app_text_styles.dart';
import 'package:ecommerce_app/ui/pages/home/blocs/home_filter_cubit.dart';

class HomeFilterPanel extends StatelessWidget {
  const HomeFilterPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isVisible = context.watch<HomeFilterCubit>().state;

    final size = MediaQuery.of(context).size;
    final height = size.height * 0.4;

    return Positioned(
      bottom: 0,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        height: isVisible ? height : 0,
        width: size.width,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30),
          ),
          boxShadow: [BoxShadow(blurRadius: 20, offset: Offset(0, -5), color: AppColors.shadowFilter)],
        ),
        onEnd: () {},
        child: ListView(
          padding: const EdgeInsets.only(top: 24, left: 44, right: 20, bottom: 44),
          children: [
            const _TopPanel(),
            const SizedBox(height: 50),
            Text(
              'Brand',
              style: AppTextStyles.mediumSize15.copyWith(fontSize: 18),
            ),
            const SizedBox(height: 10),
            const _BrandFilter(),
            const SizedBox(height: 15),
            Text(
              'Price',
              style: AppTextStyles.mediumSize15.copyWith(fontSize: 18),
            ),
            const SizedBox(height: 10),
            const _PriceFilter(),
            const SizedBox(height: 15),
            Text(
              'Size',
              style: AppTextStyles.mediumSize15.copyWith(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.grey_220),
                borderRadius: BorderRadius.circular(5),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      '4.5 to 5.5 inches',
                      style: AppTextStyles.regularSize15.copyWith(fontSize: 18),
                    ),
                  ),
                  const Icon(
                    Icons.expand_more,
                    size: 24,
                    color: AppColors.grey_179,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _BrandFilter extends StatefulWidget {
  const _BrandFilter({
    Key? key,
  }) : super(key: key);

  @override
  State<_BrandFilter> createState() => _BrandFilterState();
}

class _BrandFilterState extends State<_BrandFilter> {
  static const branList = ['Samsung', 'Xiaomi', 'Motorola'];
  String selected = branList[0];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.grey_220),
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
      child: DropdownButton<String>(
        onChanged: (value) {
          setState(() {
            selected = value ?? branList[0];
          });
        },
        value: selected,
        style: AppTextStyles.regularSize15.copyWith(fontSize: 18),
        borderRadius: BorderRadius.circular(5),
        isExpanded: true,
        icon: const Icon(
          Icons.expand_more,
          size: 24,
          color: AppColors.grey_179,
        ),
        underline: const SizedBox.shrink(),
        isDense: true,
        items: branList
            .map(
              (brand) => DropdownMenuItem<String>(
                value: brand,
                child: Text(brand),
              ),
            )
            .toList(),
      ),
    );
  }
}

class _PriceFilter extends StatefulWidget {
  const _PriceFilter({
    Key? key,
  }) : super(key: key);

  @override
  State<_PriceFilter> createState() => _PriceFilterState();
}

class _PriceFilterState extends State<_PriceFilter> {
  static const maskA = '\$####';
  static const maskB = ' - \$#####';
  final maskFormatter =
      MaskTextInputFormatter(mask: maskA, filter: {'#': RegExp(r'[0-9-]')}, type: MaskAutoCompletionType.eager);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.grey_220),
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
      child: TextField(
        onChanged: (value) {
          if (value.contains('-') && value.length < 6) {
            String mask = maskFormatter.getMaskedText();
            mask = mask.replaceAll(RegExp(r'[0-9]'), '#');
            mask = mask.replaceAll(RegExp(r'[-]'), '');
            maskFormatter.updateMask(mask: mask + maskB, filter: {'#': RegExp(r'[0-9]')});
            return;
          }

          if (value.length < 6 && maskFormatter.isFill()) {
            maskFormatter.updateMask(mask: maskA + maskB, filter: {'#': RegExp(r'[0-9]')});
            return;
          }

          if (value.length < 6) {
            maskFormatter.updateMask(mask: maskA, filter: {'#': RegExp(r'[0-9-]')});
          }
        },
        style: AppTextStyles.regularSize15.copyWith(fontSize: 18),
        inputFormatters: [maskFormatter],
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          suffixIcon: Icon(
            Icons.expand_more,
            size: 24,
            color: AppColors.grey_179,
          ),
          hintText: '0 - \$10 000',
          suffixIconConstraints: BoxConstraints(maxHeight: 37),
          isDense: true,
          isCollapsed: true,
          contentPadding: EdgeInsets.zero,
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class _TopPanel extends StatelessWidget {
  const _TopPanel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeFilterCubit = context.watch<HomeFilterCubit>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppSquareMiniButtom(
          onTap: () => homeFilterCubit.toggleShow(),
          size: 37,
          iconData: Icons.close,
          iconSize: 14,
        ),
        Text(
          'Filter options',
          style: AppTextStyles.mediumSize15.copyWith(fontSize: 18),
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              homeFilterCubit.toggleShow();
            },
            child: Ink(
              height: 37,
              width: 86,
              decoration: BoxDecoration(
                color: AppColors.orange,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  'Done',
                  style: AppTextStyles.mediumSize15.copyWith(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
