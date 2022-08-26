import 'package:ecommerce_app/bloc/details_bloc/detailed_bloc.dart';
import 'package:ecommerce_app/bloc/home_bloc/home_bloc.dart';
import 'package:ecommerce_app/bloc/home_bloc/home_state.dart';
import 'package:ecommerce_app/common/constants/assets.dart';
import 'package:ecommerce_app/common/styles/app_text_styles.dart';
import 'package:ecommerce_app/di.dart';
import 'package:ecommerce_app/ui/pages/home/blocs/home_filter_cubit.dart';
import 'package:ecommerce_app/ui/pages/home/elements/home_best_seller.dart';
import 'package:ecommerce_app/ui/pages/home/elements/home_bottom_panel.dart';
import 'package:ecommerce_app/ui/pages/home/elements/home_category.dart';
import 'package:ecommerce_app/ui/pages/home/elements/home_filter.dart';
import 'package:ecommerce_app/ui/pages/home/elements/home_hot_sales.dart';
import 'package:ecommerce_app/ui/pages/home/elements/home_search_panel.dart';
import 'package:ecommerce_app/ui/pages/home/elements/home_title_block.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeFilterCubit = HomeFilterCubit();

  @override
  void initState() {
    context.read<HomeBloc>().getInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: homeFilterCubit),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(Assets.svgLocation),
              const SizedBox(width: 11),
              const Text(
                'Zihuatanejo, Gro',
                style: AppTextStyles.mediumSize15,
              ),
              const Icon(
                Icons.expand_more,
                color: Color.fromRGBO(179, 179, 179, 1),
              )
            ],
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                homeFilterCubit.toggleShow();
              },
              icon: SvgPicture.asset(Assets.svgFilter),
            )
          ],
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return state.map(
              homeLoading: (homeLoading) {
                return const Center(child: CircularProgressIndicator());
              },
              error: (error) {
                return Center(
                    child: Text(
                  error.message,
                  style: AppTextStyles.mediumSize15,
                ));
              },
              homeData: (homeData) {
                final bestSeller = homeData.bestSeller;
                final stores = homeData.stores;

                return MultiRepositoryProvider(
                  providers: [
                    RepositoryProvider.value(value: stores),
                    RepositoryProvider.value(value: bestSeller),
                  ],
                  child: Stack(
                    children: [
                      ListView(
                        padding: const EdgeInsets.only(top: 18, bottom: 94),
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(left: 17.0, right: 17, bottom: 24),
                            child: HomeTitleBlock(title: 'Select Category', suffixTitle: 'view all'),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 17.0, right: 17, bottom: 35),
                            child: HomeCategory(),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 17.0, right: 17, bottom: 24),
                            child: HomeSeearchPanel(),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 17.0, right: 17, bottom: 8),
                            child: HomeTitleBlock(title: 'Hot sales', suffixTitle: 'see more'),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 11),
                            child: HomeHotSales(),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 17.0, right: 17),
                            child: HomeTitleBlock(title: 'Best Seller', suffixTitle: 'see more'),
                          ),
                          HomeBestSeller(),
                        ],
                      ),
                      const HomeBottomPanel(),
                      const HomeFilterPanel(),
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

  @override
  void dispose() {
    homeFilterCubit.close();

    super.dispose();
  }
}
