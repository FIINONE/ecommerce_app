import 'package:ecommerce_app/models/seller_model.dart';
import 'package:ecommerce_app/ui/pages/details/blocs/color_selector_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColorSelector extends StatelessWidget {
  const ColorSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final seller = context.read<SellerModel>();

    final size = MediaQuery.of(context).size;
    final width = (size.width - 60) / 2;

    return BlocProvider(
      create: (_) => ColorSelectorCubit(colorValue: seller.color[0]),
      child: SizedBox(
        width: width,
        child: ListView.separated(
          itemCount: seller.color.length,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => const SizedBox(width: 19),
          itemBuilder: (context, index) {
            final color = seller.color[index];

            return _ColorSelectorItem(color: color);
          },
        ),
      ),
    );
  }
}

class _ColorSelectorItem extends StatelessWidget {
  const _ColorSelectorItem({
    Key? key,
    required this.color,
  }) : super(key: key);

  final String color;

  int toColorValue(String color) {
    String colorValue = color.replaceAll(RegExp(r'[#]'), '');
    if (colorValue.length == 6) {
      colorValue = 'FF$colorValue';
    }
    return int.tryParse(colorValue, radix: 16) ?? 0xFFFFFFFF;
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<ColorSelectorCubit>();
    final colorValue = toColorValue(color);

    return InkWell(
      onTap: () => cubit.selected(color),
      child: Container(
        height: 39,
        width: 39,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Color(colorValue)),
        child: cubit.state == color
            ? const Icon(
                Icons.check,
                color: Colors.white,
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
