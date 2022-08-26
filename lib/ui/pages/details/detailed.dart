import 'package:ecommerce_app/bloc/details_bloc/detailed_bloc.dart';
import 'package:ecommerce_app/bloc/details_bloc/detailed_state.dart';
import 'package:ecommerce_app/common/constants/assets.dart';
import 'package:ecommerce_app/common/routes/app_routes.dart';
import 'package:ecommerce_app/common/styles/app_colors.dart';
import 'package:ecommerce_app/common/styles/app_text_styles.dart';
import 'package:ecommerce_app/ui/pages/details/blocs/cart_count_cubit.dart';
import 'package:ecommerce_app/ui/pages/details/elements/detailed_info.dart';
import 'package:ecommerce_app/ui/pages/details/elements/photo_view.dart';
import 'package:ecommerce_app/ui/widgets/app_square_mini_buttom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailedPage extends StatefulWidget {
  const DetailedPage({Key? key}) : super(key: key);

  @override
  State<DetailedPage> createState() => _DetailedPageState();
}

class _DetailedPageState extends State<DetailedPage> {
  @override
  void initState() {
    super.initState();

    final bestSellers = context.read<DetailedBloc>();
    bestSellers.getDetailed();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => CartCountCubit())],
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Product Details',
            style: AppTextStyles.mediumSize15.copyWith(fontSize: 18),
          ),
          leading: Padding(
            padding: const EdgeInsets.only(left: 42.0),
            child: AppSquareMiniButtom(
              onTap: () => Navigator.pop(context),
              size: 37,
              iconData: Icons.arrow_back_ios_new,
              iconSize: 18,
            ),
          ),
          leadingWidth: 79,
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 35.0),
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  AppSquareMiniButtom(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutesName.myCart);
                    },
                    size: 37,
                    iconSize: 37,
                    assetName: Assets.svgBasket,
                    color: AppColors.orange,
                  ),
                  const _CartCountWidget()
                ],
              ),
            )
          ],
        ),
        body: BlocBuilder<DetailedBloc, DetailedState>(
          builder: (context, state) {
            return state.map(
              loading: (loading) => const Center(child: CircularProgressIndicator()),
              error: (error) => Center(
                  child: Text(
                error.message,
                style: AppTextStyles.mediumSize15,
              )),
              data: (data) {
                final sellerDetailed = data.data;

                return MultiRepositoryProvider(
                  providers: [
                    RepositoryProvider.value(value: sellerDetailed),
                  ],
                  child: Column(
                    children: const [
                      PhotoView(),
                      DetailedInfoWidget(),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class _CartCountWidget extends StatelessWidget {
  const _CartCountWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<CartCountCubit>();

    return Positioned(
      top: 22,
      child: Text(
        cubit.state == 0 ? '' : cubit.state.toString(),
        style: AppTextStyles.boldSize10.copyWith(color: Colors.white, fontSize: 13),
      ),
    );
  }
}
