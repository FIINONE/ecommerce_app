import 'package:ecommerce_app/common/styles/app_colors.dart';
import 'package:ecommerce_app/common/styles/app_text_styles.dart';
import 'package:ecommerce_app/models/seller_model.dart';
import 'package:ecommerce_app/ui/pages/details/blocs/capacity_selector_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CapacitySelector extends StatelessWidget {
  const CapacitySelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final seller = context.read<SellerModel>();
    final size = MediaQuery.of(context).size;
    final width = (size.width - 60) / 2;

    return BlocProvider(
      create: (_) => CapacitySelectorCubit(initial: seller.capacity[0]),
      child: SizedBox(
        width: width,
        child: ListView.separated(
          itemCount: seller.capacity.length,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => const SizedBox(width: 5),
          itemBuilder: (context, index) {
            final capacity = seller.capacity[index];

            return _CapacitySelectorItem(capacity: capacity);
          },
        ),
      ),
    );
  }
}

class _CapacitySelectorItem extends StatelessWidget {
  const _CapacitySelectorItem({
    Key? key,
    required this.capacity,
  }) : super(key: key);

  final String capacity;

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<CapacitySelectorCubit>();

    return Center(
      child: InkWell(
        onTap: () => cubit.selected(capacity),
        child: Container(
          height: 30,
          width: 72,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: cubit.state == capacity ? AppColors.orange : Colors.transparent,
          ),
          child: Center(
            child: Text(
              '$capacity GB',
              style: AppTextStyles.boldSize10
                  .copyWith(fontSize: 13, color: cubit.state == capacity ? Colors.white : AppColors.grey_141),
            ),
          ),
        ),
      ),
    );
  }
}
