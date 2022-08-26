import 'package:ecommerce_app/bloc/my_cart_bloc/my_cart_bloc.dart';
import 'package:ecommerce_app/bloc/my_cart_bloc/my_cart_state.dart';
import 'package:ecommerce_app/common/constants/assets.dart';
import 'package:ecommerce_app/common/styles/app_colors.dart';
import 'package:ecommerce_app/common/styles/app_text_styles.dart';
import 'package:ecommerce_app/ui/pages/my_cart/blocs/my_cart_list_cubit.dart';
import 'package:ecommerce_app/ui/pages/my_cart/elements/my_cart_list.dart';
import 'package:ecommerce_app/ui/pages/my_cart/elements/my_cart_summary.dart';
import 'package:ecommerce_app/ui/widgets/app_button.dart';
import 'package:ecommerce_app/ui/widgets/app_square_mini_buttom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCartPage extends StatefulWidget {
  const MyCartPage({Key? key}) : super(key: key);

  @override
  State<MyCartPage> createState() => _MyCartPageState();
}

class _MyCartPageState extends State<MyCartPage> {
  @override
  void initState() {
    super.initState();

    final bloc = context.read<MyCartBloc>();
    bloc.getMyCart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 79,
        leading: Padding(
          padding: const EdgeInsets.only(left: 42.0),
          child: AppSquareMiniButtom(
            onTap: () => Navigator.pop(context),
            size: 37,
            iconData: Icons.arrow_back_ios_new,
            iconSize: 18,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 35.0),
            child: Row(
              children: [
                const Text(
                  'Add address',
                  style: AppTextStyles.mediumSize15,
                ),
                const SizedBox(width: 9),
                AppSquareMiniButtom(
                  onTap: () {},
                  size: 37,
                  iconSize: 37,
                  assetName: Assets.svgLocation,
                  color: AppColors.orange,
                ),
              ],
            ),
          )
        ],
      ),
      body: BlocBuilder<MyCartBloc, MyCartState>(
        builder: (context, state) {
          return state.map(
            loading: (loading) => const Center(child: CircularProgressIndicator()),
            error: (error) => Center(
                child: Text(
              error.message,
              style: AppTextStyles.mediumSize15,
            )),
            data: (data) {
              return RepositoryProvider.value(
                value: data.data,
                child: BlocProvider(
                  create: (_) => MyCartListCubit(data.data.goods),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 42.0, vertical: 50),
                        child: Text(
                          'My Cart',
                          style: AppTextStyles.boldSize25.copyWith(fontSize: 35),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                            color: AppColors.blueBlack,
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(30),
                            ),
                          ),
                          clipBehavior: Clip.hardEdge,
                          child: Column(
                            children: [
                              const CartList(),
                              Divider(
                                color: AppColors.grey_255.withOpacity(0.25),
                                thickness: 2,
                                height: 2,
                                indent: 4,
                                endIndent: 4,
                              ),
                              const MyCartSummary(),
                              const Divider(
                                color: AppColors.grey_255,
                                thickness: 1,
                                height: 1,
                                indent: 4,
                                endIndent: 4,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 44.0, right: 44.0, bottom: 44.0, top: 27),
                                child: AppButton(
                                  text: 'Checkout',
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        final size = MediaQuery.of(context).size;

                                        return Center(
                                          child: Container(
                                            height: size.width / 2,
                                            width: size.width / 2,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(30), color: Colors.white),
                                            alignment: Alignment.center,
                                            padding: const EdgeInsets.all(8),
                                            child: const Text(
                                              'Thanks for shopping with us',
                                              textAlign: TextAlign.center,
                                              style: AppTextStyles.boldSize25,
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
