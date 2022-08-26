import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ecommerce_app/common/styles/app_colors.dart';
import 'package:ecommerce_app/common/styles/app_text_styles.dart';
import 'package:ecommerce_app/models/home_store_model.dart';

class HomeHotSales extends StatelessWidget {
  const HomeHotSales({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final stores = context.read<List<HomestoreModel>>();

    return SizedBox(
      height: 182,
      child: PageView.builder(
        itemCount: stores.length,
        itemBuilder: (context, index) {
          final store = stores[index];

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17.0),
            child: Stack(
              children: [
                Container(
                  height: 182,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Image.network(
                    store.picture,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 14,
                  left: 25,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      store.isNew
                          ? const _NewMark()
                          : const SizedBox(
                              height: 27,
                              width: 27,
                            ),
                      Padding(
                        padding: const EdgeInsets.only(top: 18.0),
                        child: Text(
                          store.title,
                          style: AppTextStyles.boldSize25.copyWith(color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Text(
                          store.subtitle,
                          style: AppTextStyles.regularSize12.copyWith(color: Colors.white, fontSize: 11),
                        ),
                      ),
                      const _BuyButton(),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _NewMark extends StatelessWidget {
  const _NewMark({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 27,
      width: 27,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.orange,
      ),
      alignment: Alignment.center,
      child: Text(
        'New',
        style: AppTextStyles.boldSize10.copyWith(color: Colors.white),
      ),
    );
  }
}

class _BuyButton extends StatelessWidget {
  const _BuyButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 26.0),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          splashColor: AppColors.orange,
          borderRadius: BorderRadius.circular(5),
          child: Ink(
            height: 23,
            width: 98,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            child: Center(
              child: Text(
                'Buy now!',
                style: AppTextStyles.boldSize10.copyWith(fontSize: 11),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
